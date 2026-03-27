import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../../services/supabase'
import { Button } from '../Button'
import { MessageCircle, Search, Briefcase, ChevronRight, Store, MapPin, X } from 'lucide-react'
import { CATEGORIES } from '../../constants/categories'
import { CITIES } from '../../constants/cities'
import { useSelectionStore } from '../../store/useSelectionStore'

interface CompleteProfileModalProps {
  userId: string
  isOpen: boolean
  onClose: () => void
}

type Step = 'loading' | 'role' | 'whatsapp' | 'business' | 'completed'

const MACRO_SEGMENT_LABELS: Record<string, string> = {
  home: 'Casa & Serviços',
  auto: 'Veículos & Mecânica',
  health: 'Saúde & Bem-Estar',
  pet: 'Mundo Pet',
  education: 'Educação & Cursos',
  events: 'Festas & Eventos',
  sustainability: 'Sustentabilidade & Mobilidade',
  digital: 'Marketing & Digital',
}

export function CompleteProfileModal({ userId, isOpen, onClose }: CompleteProfileModalProps) {
  const navigate = useNavigate()
  const { clearCities, toggleCity, setSelectedCategory, selectedCities, selectedCategory } = useSelectionStore()
  const [step, setStep] = useState<Step>('loading')
  const [role, setRole] = useState<'client' | 'provider'>('client')
  const [whatsapp, setWhatsapp] = useState('')
  
  // Business Form State
  const [providerId, setProviderId] = useState<string | null>(null)
  const [businessName, setBusinessName] = useState('')
  const [category, setCategory] = useState('')
  const [cityId, setCityId] = useState('')
  const [cityName, setCityName] = useState('')
  const [neighborhood, setNeighborhood] = useState('')
  const [description, setDescription] = useState('')

  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  // Load Cities (simplification: hardcoded or fetched if needed, but for now let's assume we fetch or just use text for MVP/Demo if Cities are strict)
  // Actually, we should probably fetch cities. Let's stick to a simple input for now or fetch later.
  // We have a `cities` table.
  // Cities from DB to match UUIDs if possible
  const [dbCities, setDbCities] = useState<{id: string, slug: string}[]>([])

  useEffect(() => {
    if (isOpen) {
        checkProfile()
        fetchDbCities()
    }
  }, [userId, isOpen])

  const fetchDbCities = async () => {
    const { data } = await supabase.from('cities').select('id, slug')
    if (data) setDbCities(data)
  }

  const checkProfile = async () => {
    if (!userId) return

    try {
        const { data: profile, error } = await supabase
        .from('profiles')
        .select('whatsapp, role')
        .eq('id', userId)
        .single()

        if (error && error.code !== 'PGRST116') {
            console.error('Error fetching profile:', error)
            return
        }

        // Default state if nothing found
        if (!profile) {
            setStep('role')
            return
        }

        // If we have profile data, allow user to edit/proceed
        setWhatsapp(profile.whatsapp || '')
        if (profile.role) setRole(profile.role)

        // If provider, check if they have a business registered
        if (profile.role === 'provider') {
            const { data: provider } = await supabase
                .from('providers')
                .select('*')
                .eq('owner_id', userId)
                .single()
            
            if (provider) {
                setProviderId(provider.id)
                setBusinessName(provider.name)
                setCategory(provider.category)
                setCityId(provider.city_slug || '')
                setNeighborhood(provider.neighborhood)
                setDescription(provider.description || '')
                setWhatsapp(provider.whatsapp || '')
                
                setStep('business')
                return
            } else {
                setRole('provider')
                if (selectedCities.length === 1) setCityId(selectedCities[0])
                if (selectedCategory) setCategory(selectedCategory)
                setStep('business')
                return
            }
        }

        // If just opening to edit/view, start at Role selection so they can switch
        setStep('role')
    } catch (err) {
        console.error(err)
    }
  }

  const markOnboardingAsCompleted = async () => {
      await supabase.from('profiles').update({ onboarding_completed: true }).eq('id', userId)
  }

  const handleFinishAsClient = async () => {
      setLoading(true)
      const { error } = await supabase.from('profiles').update({ 
          role: 'client',
          onboarding_completed: true,
          updated_at: new Date().toISOString()
      }).eq('id', userId)

      setLoading(false)
      
      if (error) {
          setError('Erro ao salvar perfil.')
          return
      }
      // addToast('Perfil atualizado com sucesso!', 'success') // Assuming addToast is defined elsewhere
      onClose()
  }

  const handleRoleSelect = (selected: 'client' | 'provider') => {
    setRole(selected)
    if (selected === 'client') {
        handleFinishAsClient()
    } else {
        setStep('business')
    }
  }

  const handleSaveProfile = async () => {
      setLoading(true)
      const { error } = await supabase.from('profiles').update({ whatsapp }).eq('id', userId)
      setLoading(false)
      if (error) {
          setError('Erro ao salvar WhatsApp.')
          return
      }
      setStep('role')
  }

  const handleSaveBusiness = async () => {
    if (!businessName || !cityId || !neighborhood) {
        setError('Preencha os campos obrigatórios (*)')
        return
    }

    setLoading(true)
    setError(null)

    const selectedCity = CITIES.find(c => c.id === cityId) || { id: cityId, name: cityId, state: 'SP' }
    
    // Find matching DB city to use real UUID for city_id if it exists
    const matchingDbCity = dbCities.find(c => c.slug === selectedCity.id)

    // Generate a slug (simple version)
    const slug = `${businessName}-${selectedCity.name}-${Math.floor(Math.random() * 1000)}`
        .toLowerCase()
        .normalize("NFD").replace(/[\u0300-\u036f]/g, "") // remove accents
        .replace(/[^a-z0-9]+/g, '-') // replace non-alphanumeric with hyphen
        .replace(/^-+|-+$/g, '') 

    const providerData = {
            owner_id: userId,
            name: businessName,
            category: category,
            city_id: matchingDbCity ? matchingDbCity.id : null, // Null if city isn't in DB yet
            city_slug: selectedCity.id,
            neighborhood: neighborhood,
            whatsapp: whatsapp || '', 
            description: description,
            slug: slug,
            state: selectedCity.state,
            // Only set rating/reviews on insert? Or keep them? 
            // Better to upsert without touching rating if it's an update, but simplified:
            ...(providerId ? {} : { rating: 5.0, review_count: 0 }) 
    }

    let errorResult

    if (providerId) {
        const { error } = await supabase
            .from('providers')
            .update(providerData)
            .eq('id', providerId)
        errorResult = error
    } else {
        const { error } = await supabase
            .from('providers')
            .insert({ ...providerData, rating: 5.0, review_count: 0 })
        errorResult = error
    }

    if (errorResult) {
        console.error(errorResult)
        setError('Erro ao salvar empresa. Tente novamente.')
        setLoading(false)
        return
    }

    // Update Profile Role and Onboarding
    const { error: profileError } = await supabase.from('profiles').update({ 
          role: 'provider', 
          onboarding_completed: true,
          updated_at: new Date().toISOString()
    }).eq('id', userId)

    setLoading(false)
    onClose()
    
    // Gamification: redirect directly to the new profile "storefront"
    clearCities()
    toggleCity(selectedCity.id)
    setSelectedCategory(category)
    navigate('/results')
  }

  if (!isOpen) return null

  return (
    <div className="fixed inset-0 z-[60] flex items-center justify-center bg-black/50 backdrop-blur-sm p-4 animate-in fade-in duration-200">
      <div className="bg-white dark:bg-gray-800 rounded-2xl w-full max-w-md shadow-2xl p-6 relative animate-in zoom-in-95 duration-200 overflow-hidden">
        
        <button 
            onClick={onClose}
            className="absolute top-4 right-4 text-gray-400 hover:text-gray-600 dark:hover:text-gray-300"
        >
            <X className="h-5 w-5" />
        </button>

        {/* Step 1: Role Selection */}
        {step === 'role' && (
            <div className="space-y-6">
                <div className="text-center">
                    <h2 className="text-xl font-bold text-gray-900 dark:text-white">Bem-vindo(a)! 👋</h2>
                    <p className="text-gray-500 dark:text-gray-400 text-sm mt-1">Como você deseja usar a plataforma?</p>
                </div>

                <div className="grid grid-cols-1 gap-3">
                    <button 
                        onClick={() => handleRoleSelect('client')}
                        className="flex items-center gap-4 p-4 rounded-xl border-2 border-transparent bg-gray-50 dark:bg-gray-700 hover:border-brand-blue/50 hover:bg-blue-50 dark:hover:bg-gray-600 transition-all text-left group"
                    >
                        <div className="h-10 w-10 bg-blue-100 dark:bg-blue-900/50 rounded-full flex items-center justify-center text-blue-600 dark:text-blue-400 group-hover:scale-110 transition-transform">
                            <Search className="h-5 w-5" />
                        </div>
                        <div>
                            <p className="font-bold text-gray-900 dark:text-white">Quero Contratar</p>
                            <p className="text-xs text-gray-500 dark:text-gray-400">Buscar profissionais e serviços</p>
                        </div>
                        <ChevronRight className="h-5 w-5 ml-auto text-gray-300" />
                    </button>

                    <button 
                        onClick={() => handleRoleSelect('provider')}
                        className="flex items-center gap-4 p-4 rounded-xl border-2 border-transparent bg-gray-50 dark:bg-gray-700 hover:border-brand-yellow/50 hover:bg-yellow-50 dark:hover:bg-gray-600 transition-all text-left group"
                    >
                        <div className="h-10 w-10 bg-yellow-100 dark:bg-yellow-900/50 rounded-full flex items-center justify-center text-yellow-600 dark:text-yellow-400 group-hover:scale-110 transition-transform">
                            <Briefcase className="h-5 w-5" />
                        </div>
                        <div>
                            <p className="font-bold text-gray-900 dark:text-white">Quero Anunciar</p>
                            <p className="text-xs text-gray-500 dark:text-gray-400">Divulgar meu trabalho ou empresa</p>
                        </div>
                        <ChevronRight className="h-5 w-5 ml-auto text-gray-300" />
                    </button>
                </div>
            </div>
        )}

        {/* Step 2: WhatsApp */}
        {step === 'whatsapp' && (
             <div className="space-y-6">
                 <div className="text-center">
                    <div className="h-12 w-12 bg-green-100 dark:bg-green-900/30 rounded-full flex items-center justify-center mx-auto mb-4">
                        <MessageCircle className="h-6 w-6 text-green-600 dark:text-green-400" />
                    </div>
                    <h2 className="text-xl font-bold text-gray-900 dark:text-white">Contato</h2>
                    <p className="text-sm text-gray-500 dark:text-gray-400">
                        Seu WhatsApp para notificações e contato. Você também receberá contatos pelo nosso <strong className="text-brand-purple">Chat Interno</strong>.
                    </p>
                 </div>

                 <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">WhatsApp</label>
                    <input
                        type="tel"
                        placeholder="(11) 99999-9999"
                        className="w-full rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 px-4 py-2 text-gray-900 dark:text-white focus:ring-2 focus:ring-brand-blue focus:border-transparent transition-all"
                        value={whatsapp}
                        onChange={(e) => setWhatsapp(e.target.value)}
                    />
                 </div>

                 <div className="flex gap-2">
                     <Button variant="ghost" className="flex-1" onClick={() => setStep('role')}>Voltar</Button>
                     <Button className="flex-[2] bg-brand-blue text-white" onClick={handleSaveProfile} disabled={loading}>
                        {loading ? 'Salvando...' : 'Continuar'}
                     </Button>
                 </div>
                 {error && <p className="text-center text-xs text-red-500">{error}</p>}
             </div>
        )}

        {/* Step 3: Business Details (Provider Only) */}
        {step === 'business' && (
            <div className="space-y-4 max-h-[80vh] overflow-y-auto pr-1">
                <div className="text-center mb-4">
                    <div className="h-12 w-12 bg-purple-100 dark:bg-purple-900/30 rounded-full flex items-center justify-center mx-auto mb-3">
                        <Store className="h-6 w-6 text-purple-600 dark:text-purple-400" />
                     </div>
                    <h2 className="text-xl font-bold text-gray-900 dark:text-white">Dados da Empresa</h2>
                    <p className="text-sm text-gray-500">Preencha para aparecer nas buscas</p>
                </div>

                <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Nome do Negócio *</label>
                    <input
                        className="w-full rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 px-4 py-2"
                        placeholder="Ex: Auto Center Silva"
                        value={businessName}
                        onChange={e => setBusinessName(e.target.value)}
                    />
                </div>

                <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Categoria *</label>
                    <select
                        className="w-full rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 px-4 py-2"
                        value={category || ''}
                        onChange={e => setCategory(e.target.value)}
                    >
                        <option value="">Selecione sua especialidade...</option>
                        {Object.entries(
                            CATEGORIES.reduce((acc, cat) => {
                                if (!acc[cat.macroSegment]) acc[cat.macroSegment] = [];
                                acc[cat.macroSegment].push(cat);
                                return acc;
                            }, {} as Record<string, typeof CATEGORIES>)
                        ).map(([segment, cats]) => (
                            <optgroup key={segment} label={MACRO_SEGMENT_LABELS[segment] || segment}>
                                {cats.sort((a,b) => a.name.localeCompare(b.name)).map(cat => (
                                    <option key={cat.id} value={cat.id}>{cat.name}</option>
                                ))}
                            </optgroup>
                        ))}
                    </select>
                </div>

                <div className="grid grid-cols-2 gap-3">
                    <div>
                        <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Cidade *</label>
                        <select
                            className="w-full rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 px-4 py-2"
                            value={cityId || ''}
                            onChange={e => setCityId(e.target.value)}
                        >
                            <option value="">Selecione...</option>
                            {CITIES.map(c => (
                                <option key={c.id} value={c.id}>{c.name} - {c.state}</option>
                            ))}
                        </select>
                    </div>
                    <div>
                        <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Bairro *</label>
                        <input
                            className="w-full rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 px-4 py-2"
                            placeholder="Ex: Centro"
                            value={neighborhood}
                            onChange={e => setNeighborhood(e.target.value)}
                        />
                    </div>
                </div>

                <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Descrição</label>
                    <textarea
                        className="w-full rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 px-4 py-2 h-24 resize-none"
                        placeholder="Conte um pouco sobre seus serviços..."
                        value={description}
                        onChange={e => setDescription(e.target.value)}
                    />
                </div>

                <Button className="w-full bg-brand-blue text-white mt-4" onClick={handleSaveBusiness} disabled={loading}>
                    {loading ? 'Finalizando...' : 'Concluir Cadastro'}
                </Button>
                
                {error && <p className="text-center text-xs text-red-500">{error}</p>}
            </div>
        )}

      </div>
    </div>
  )
}

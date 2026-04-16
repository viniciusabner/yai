import { useState, useEffect, useCallback } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import { Building2, Phone, Mail, MapPin, AlertTriangle, CheckCircle, Loader2, ArrowLeft } from 'lucide-react'
import { supabase } from '../../services/supabase'
import { checkPhoneExists, checkEmailExists, createProvider, CreateProviderInput } from '../../services/providers.service'
import { checkEmailProviderMatch, claimProviderByEmail } from '../../services/claim.service'
import { Button } from '../../components/Button'

const CITIES = [
  { slug: 'santo-andre', name: 'Santo André' },
  { slug: 'sao-bernardo-do-campo', name: 'São Bernardo do Campo' },
  { slug: 'sao-caetano-do-sul', name: 'São Caetano do Sul' },
  { slug: 'diadema', name: 'Diadema' },
  { slug: 'maua', name: 'Mauá' },
  { slug: 'ribeirao-pires', name: 'Ribeirão Pires' },
  { slug: 'rio-grande-da-serra', name: 'Rio Grande da Serra' },
]

const CATEGORIES = [
  { value: 'eletricista', label: 'Eletricista' },
  { value: 'encanador', label: 'Encanador' },
  { value: 'mecanica', label: 'Mecânica' },
  { value: 'pedreiro', label: 'Pedreiro' },
  { value: 'pintor', label: 'Pintor' },
  { value: 'limpeza_pos_obra', label: 'Faxina / Limpeza' },
  { value: 'jardineiro', label: 'Jardinagem' },
  { value: 'marido_aluguel', label: 'Marido de Aluguel' },
  { value: 'psicologia', label: 'Psicologia' },
  { value: 'nutricao', label: 'Nutricionista' },
  { value: 'informatica', label: 'Informática' },
  { value: 'musica', label: 'Escola de Música' },
  { value: 'reforco_escolar', label: 'Reforço Escolar' },
  { value: 'outros', label: 'Outros' },
]

type FieldConflict = { id: string; name: string } | null

function useDebounce<T>(value: T, delay: number): T {
  const [debounced, setDebounced] = useState(value)
  useEffect(() => {
    const timer = setTimeout(() => setDebounced(value), delay)
    return () => clearTimeout(timer)
  }, [value, delay])
  return debounced
}

export function RegisterCompany() {
  const navigate = useNavigate()
  const [user, setUser] = useState<any>(null)
  const [form, setForm] = useState<CreateProviderInput>({
    name: '', category: '', city_slug: '', phone: '', email: '',
    neighborhood: '', address: '', description: '', website: ''
  })
  const [phoneConflict, setPhoneConflict] = useState<FieldConflict>(null)
  const [emailConflict, setEmailConflict] = useState<FieldConflict>(null)
  const [checkingPhone, setCheckingPhone] = useState(false)
  const [checkingEmail, setCheckingEmail] = useState(false)
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState('')

  const debouncedPhone = useDebounce(form.phone, 600)
  const debouncedEmail = useDebounce(form.email, 600)

  useEffect(() => {
    supabase.auth.getUser().then(({ data: { user } }) => {
      if (!user) navigate('/login', { state: { from: '/register-company' } })
      else setUser(user)
    })
  }, [navigate])

  useEffect(() => {
    if (!debouncedPhone || debouncedPhone.replace(/\D/g, '').length < 8) {
      setPhoneConflict(null); return
    }
    setCheckingPhone(true)
    checkPhoneExists(debouncedPhone).then((result) => {
      setPhoneConflict(result)
      setCheckingPhone(false)
    })
  }, [debouncedPhone])

  useEffect(() => {
    if (!debouncedEmail || !debouncedEmail.includes('@')) {
      setEmailConflict(null); return
    }
    setCheckingEmail(true)
    checkEmailExists(debouncedEmail).then((result) => {
      setEmailConflict(result)
      setCheckingEmail(false)
    })
  }, [debouncedEmail])

  const handleChange = useCallback((e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>) => {
    setForm(prev => ({ ...prev, [e.target.name]: e.target.value }))
  }, [])

  const handleClaimExisting = async (providerId: string) => {
    if (!user) return
    setSubmitting(true)
    const success = await claimProviderByEmail(providerId, user.id)
    if (success) navigate('/provider')
    else setError('Não foi possível reivindicar o perfil. Tente novamente.')
    setSubmitting(false)
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (phoneConflict || emailConflict) return
    if (!form.name || !form.category || !form.city_slug || !form.phone || !form.email) {
      setError('Preencha todos os campos obrigatórios.')
      return
    }
    setSubmitting(true)
    setError('')
    try {
      await createProvider(form)
      navigate('/provider')
    } catch (err: any) {
      setError(err.message || 'Erro ao criar perfil. Tente novamente.')
    }
    setSubmitting(false)
  }

  const hasConflict = !!(phoneConflict || emailConflict)
  const conflictProvider = phoneConflict || emailConflict

  return (
    <div className="min-h-screen bg-gray-50 dark:bg-gray-950 py-8 px-4">
      <div className="max-w-lg mx-auto">
        <Link to="/para-profissionais" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700 dark:text-gray-400 mb-6">
          <ArrowLeft size={16} /> Voltar
        </Link>

        <div className="bg-white dark:bg-gray-900 rounded-2xl shadow-sm border border-gray-200 dark:border-gray-800 p-6">
          <div className="flex items-center gap-3 mb-6">
            <div className="w-10 h-10 rounded-xl bg-emerald-100 dark:bg-emerald-900/30 flex items-center justify-center">
              <Building2 size={20} className="text-emerald-600" />
            </div>
            <div>
              <h1 className="text-xl font-bold text-gray-900 dark:text-white">Cadastrar minha empresa</h1>
              <p className="text-sm text-gray-500 dark:text-gray-400">Apareça para clientes do ABC Paulista</p>
            </div>
          </div>

          {/* Conflict Banner */}
          {hasConflict && conflictProvider && (
            <div className="mb-5 p-4 rounded-xl bg-amber-50 dark:bg-amber-900/20 border border-amber-200 dark:border-amber-800">
              <div className="flex items-start gap-3">
                <AlertTriangle size={18} className="text-amber-600 shrink-0 mt-0.5" />
                <div className="flex-1">
                  <p className="text-sm font-semibold text-amber-800 dark:text-amber-200">
                    Já encontramos a empresa "{conflictProvider.name}" com esses dados!
                  </p>
                  <p className="text-xs text-amber-700 dark:text-amber-300 mt-1">
                    Quer assumir o controle dela em vez de criar um novo perfil?
                  </p>
                  <button
                    onClick={() => handleClaimExisting(conflictProvider.id)}
                    disabled={submitting}
                    className="mt-2 text-xs font-semibold text-amber-700 dark:text-amber-300 underline hover:no-underline"
                  >
                    {submitting ? 'Verificando...' : 'Sim, recuperar meu perfil existente →'}
                  </button>
                </div>
              </div>
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-4">
            {/* Name */}
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                Nome da empresa *
              </label>
              <input
                name="name" value={form.name} onChange={handleChange} required
                placeholder="Ex: Mecânica do João"
                className="w-full rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500"
              />
            </div>

            {/* Category + City */}
            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Categoria *</label>
                <select name="category" value={form.category} onChange={handleChange} required
                  className="w-full rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                  <option value="">Selecione</option>
                  {CATEGORIES.map(c => <option key={c.value} value={c.value}>{c.label}</option>)}
                </select>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Cidade *</label>
                <select name="city_slug" value={form.city_slug} onChange={handleChange} required
                  className="w-full rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                  <option value="">Selecione</option>
                  {CITIES.map(c => <option key={c.slug} value={c.slug}>{c.name}</option>)}
                </select>
              </div>
            </div>

            {/* Phone */}
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                <Phone size={14} className="inline mr-1" />Telefone / WhatsApp *
              </label>
              <div className="relative">
                <input
                  name="phone" value={form.phone} onChange={handleChange} required
                  placeholder="(11) 99999-9999"
                  className={`w-full rounded-lg border px-3 py-2.5 pr-9 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500 dark:bg-gray-800 ${phoneConflict ? 'border-amber-400' : 'border-gray-300 dark:border-gray-700'}`}
                />
                <div className="absolute right-3 top-1/2 -translate-y-1/2">
                  {checkingPhone && <Loader2 size={14} className="animate-spin text-gray-400" />}
                  {!checkingPhone && phoneConflict && <AlertTriangle size={14} className="text-amber-500" />}
                  {!checkingPhone && form.phone && !phoneConflict && form.phone.replace(/\D/g, '').length >= 8 && <CheckCircle size={14} className="text-emerald-500" />}
                </div>
              </div>
            </div>

            {/* Email */}
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                <Mail size={14} className="inline mr-1" />E-mail da empresa *
              </label>
              <div className="relative">
                <input
                  name="email" value={form.email} onChange={handleChange} required type="email"
                  placeholder="contato@minhaempresa.com.br"
                  className={`w-full rounded-lg border px-3 py-2.5 pr-9 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500 dark:bg-gray-800 ${emailConflict ? 'border-amber-400' : 'border-gray-300 dark:border-gray-700'}`}
                />
                <div className="absolute right-3 top-1/2 -translate-y-1/2">
                  {checkingEmail && <Loader2 size={14} className="animate-spin text-gray-400" />}
                  {!checkingEmail && emailConflict && <AlertTriangle size={14} className="text-amber-500" />}
                  {!checkingEmail && form.email && !emailConflict && form.email.includes('@') && <CheckCircle size={14} className="text-emerald-500" />}
                </div>
              </div>
            </div>

            {/* Neighborhood */}
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
                <MapPin size={14} className="inline mr-1" />Bairro
              </label>
              <input name="neighborhood" value={form.neighborhood} onChange={handleChange}
                placeholder="Ex: Centro"
                className="w-full rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 px-3 py-2.5 text-sm focus:outline-none"
              />
            </div>

            {/* Description */}
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Descrição</label>
              <textarea name="description" value={form.description} onChange={handleChange} rows={3}
                placeholder="Conte um pouco sobre sua empresa e os serviços que oferece..."
                className="w-full rounded-lg border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 px-3 py-2.5 text-sm focus:outline-none resize-none"
              />
            </div>

            {error && (
              <p className="text-sm text-red-600 dark:text-red-400 flex items-center gap-1.5">
                <AlertTriangle size={14} />{error}
              </p>
            )}

            <Button type="submit" disabled={submitting || hasConflict} className="w-full">
              {submitting ? <><Loader2 size={16} className="animate-spin mr-2" />Cadastrando...</> : 'Publicar meu perfil gratuitamente'}
            </Button>

            <p className="text-xs text-center text-gray-400">
              Seu perfil fica visível para clientes do ABC Paulista imediatamente após o cadastro.
            </p>
          </form>
        </div>
      </div>
    </div>
  )
}

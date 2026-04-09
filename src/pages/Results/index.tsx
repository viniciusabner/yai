import { useEffect, useState } from 'react'
import { useNavigate, useLocation, useSearchParams } from 'react-router-dom'
import { ArrowLeft } from 'lucide-react'
import { WhatsAppIcon } from '../../components/Icons/WhatsAppIcon'
import { Logo } from '../../components/Logo'
import { useSelectionStore } from '../../store/useSelectionStore'
import { getProvidersByCityIds, type Provider } from '../../services/providers.service'
import { getCities } from '../../services/cities.service'
import { ProviderList } from '../../components/ProviderList'
import { Button } from '../../components/Button'
import { ContactListItem } from '../../components/ContactListItem'
import { sendMessageToProviders, startConversation } from '../../services/messaging.service'
import { supabase } from '../../services/supabase'
import { LoginUpsellModal } from '../../components/LoginUpsellModal'
import { CompanyProfileModal } from '../../components/CompanyProfileModal'
import { buildWhatsAppLink } from '../../utils/whatsapp'
import { logContactEvent } from '../../services/providers.service'
import { CATEGORIES } from '../../constants/categories'

export function Results() {
  const navigate = useNavigate()
  const location = useLocation()
  const { 
    selectedCities, 
    selectedCategory, 
    selectedProviders,
    customMessage,
    setCustomMessage,
    selectProviders
  } = useSelectionStore()
  
  const [providers, setProviders] = useState<Provider[]>([])
  const [searchParams, setSearchParams] = useSearchParams()
  
  // Auto-send logic after login
  useEffect(() => {
    const autoSend = searchParams.get('autoSend')
    if (autoSend === 'true') {
      const newSearchParams = new URLSearchParams(searchParams)
      newSearchParams.delete('autoSend')
      setSearchParams(newSearchParams, { replace: true })
      
      if (customMessage.trim().length > 0 && selectedProviders.length > 0) {
         handleBulkChat()
      }
    }
  }, [searchParams, customMessage, selectedProviders])

  const [loading, setLoading] = useState(true)
  const [cityNames, setCityNames] = useState<string[]>([])
  const [cityMap, setCityMap] = useState<Record<string, string>>({})
  const [showContactModal, setShowContactModal] = useState(false)
  const [showProfileModal, setShowProfileModal] = useState(false)
  const [selectedProfile, setSelectedProfile] = useState<Provider | null>(null)
  const [sending, setSending] = useState(false)
  const [chatSentIds, setChatSentIds] = useState<string[]>([])
  
  const handleOpenProfile = (provider: Provider) => {
    setSelectedProfile(provider)
    setShowProfileModal(true)
  }
  const [showLoginModal, setShowLoginModal] = useState(false)

  const allSelected = providers.length > 0 && providers.every(p => selectedProviders.includes(p.id))

  const handleSelectAll = () => {
    if (allSelected) {
      selectProviders([])
    } else {
      selectProviders(providers.map(p => p.id))
    }
  }



  useEffect(() => {
    window.scrollTo(0, 0)
  }, [])

  useEffect(() => {
    if (selectedCities.length === 0) {
      navigate('/')
      return
    }

    // Load City Names
    getCities().then(cities => {
      const selectedMap: Record<string, string> = {}
      const names: string[] = []
      
      cities.forEach(c => {
        if (selectedCities.includes(c.id)) {
          selectedMap[c.id] = c.name
          names.push(c.name)
        }
      })
      
      setCityMap(selectedMap)
      setCityNames(names)
    })

    // Load Providers
    setLoading(true)
    getProvidersByCityIds(selectedCities, selectedCategory)
      .then(setProviders)
      .catch((err) => console.error(err))
      .finally(() => setLoading(false))
  }, [selectedCities, selectedCategory, navigate])

  const handleBulkWhatsApp = () => {
    if (!customMessage.trim()) {
      alert('Por favor, escreva uma mensagem antes de continuar.')
      return
    }
    setShowContactModal(true)
  }

  const handleBulkChat = async () => {
    if (!customMessage.trim()) {
      alert('Por favor, escreva uma mensagem antes de enviar.')
      return
    }

    try {
      setSending(true)
      const { data: { user } } = await supabase.auth.getUser()
      
      if (!user) {
        setSending(false)
        setShowLoginModal(true)
        return
      }

      // Pass user.id not needed if service gets it, but existing call passes it?
      // Wait, lint error said "Expected 2 arguments but got 3".
      // Let's check sendMessageToProviders signature. It takes (providerIds, content).
      // The call in line 92 passes 3 args: (ids, content, userId).
      // I should fix that call too.
      await sendMessageToProviders(selectedProviders, customMessage)
      
      setChatSentIds(prev => [...new Set([...prev, ...selectedProviders])])
      
      navigate('/inbox?success=1')
    } catch (error) {
       console.error(error)
       alert('Erro ao enviar mensagens. Tente novamente.')
    } finally {
      setSending(false)
    }
  }

  const handleOpenChat = async (providerId: string) => {
    try {
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) {
        setShowLoginModal(true)
        return
      }
      
      // Navigate to inbox, ideally selecting this conversation
      // We can pre-start it or just go there.
      // Better to pre-start/get ID so we can select it.
      const conversationId = await startConversation(providerId, 'Olá! Tenho interesse.')
      navigate('/inbox', { state: { conversationId } })

    } catch (error) {
      console.error(error)
      // If error (e.g. auth), show login
      setShowLoginModal(true)
    }
  }

  const categoryMessages: Record<string, { label: string, placeholder: string }> = {
    // Casa
    imobiliaria: { label: 'Diga o que você procura', placeholder: 'Ex: Procuro casa térrea com 3 quartos e quintal...' },
    pedreiro: { label: 'Descreva a obra ou reforma', placeholder: 'Ex: Preciso construir um muro, assentar piso...' },
    marido_aluguel: { label: 'O que você precisa que seja feito?', placeholder: 'Ex: Trocar chuveiro, pendurar quadros, instalar prateleira...' },
    eletricista: { label: 'Descreva o serviço elétrico', placeholder: 'Ex: Instalar tomadas, revisar quadro de luz, chuveiro desarmando...' },
    encanador: { label: 'Qual o problema hidráulico?', placeholder: 'Ex: Vazamento na pia, desentupir cano, instalar vaso...' },
    jardineiro: { label: 'O que precisa no seu jardim?', placeholder: 'Ex: Cortar grama, poda de árvores, plantar grama...' },
    pintor: { label: 'O que deseja pintar?', placeholder: 'Ex: Pintar 3 quartos e sala, pintura externa da casa...' },
    montador_moveis: { label: 'Quais móveis deseja montar?', placeholder: 'Ex: Montar guarda-roupas 6 portas e um painel de TV...' },
    vidraceiro: { label: 'Descreva o serviço em vidro', placeholder: 'Ex: Instalar box no banheiro, fechar sacada, espelho sob medida...' },
    tecnico_ar_condicionado: { label: 'O que precisa para o ar condicionado?', placeholder: 'Ex: Limpeza, instalação de split 9000 BTUs, manutenção...' },
    serralheiro: { label: 'Qual serviço de serralheria?', placeholder: 'Ex: Fazer portão de correr, grade para janela, conserto de solda...' },
    dedetizadora: { label: 'O que você precisa dedetizar?', placeholder: 'Ex: Dedetização de baratas, cupins, ratos no telhado...' },
    desentupidora: { label: 'Qual entupimento precisa resolver?', placeholder: 'Ex: Desentupir vaso sanitário, caixa de gordura, esgoto...' },
    gesseiro: { label: 'Qual serviço em gesso/drywall?', placeholder: 'Ex: Rebaixamento de teto, parede de drywall, sanca de gesso...' },
    lavanderia: { label: 'O que precisa lavar?', placeholder: 'Ex: Lavar edredom, roupas do dia a dia, terno...' },
    limpeza_pos_obra: { label: 'Como precisa da faxina?', placeholder: 'Ex: Faxina pesada pós-obra, limpeza de mudança...' },
    personal_organizer: { label: 'O que você precisa organizar?', placeholder: 'Ex: Organização de closet, cozinha, pós-mudança...' },
    redes_protecao: { label: 'Onde instalar a rede?', placeholder: 'Ex: Rede de proteção para 2 janelas e sacada, para gatos...' },
    mudancas: { label: 'Descreva a sua mudança', placeholder: 'Ex: Mudança completa com embalagem de apto 2 dorms...' },
    automacao_residencial: { label: 'Qual projeto de automação?', placeholder: 'Ex: Automação de iluminação, home theater, som ambiente...' },

    // Automotivo
    mecanica: { label: 'Qual problema no seu veículo?', placeholder: 'Ex: Barulho no motor, trocar óleo, revisão geral...' },
    'auto-eletrica': { label: 'Qual problema elétrico no carro?', placeholder: 'Ex: Bateria não carrega, farol queimado, alternador...' },
    borracharia: { label: 'O que precisa para seus pneus?', placeholder: 'Ex: Pneu furado, conserto, pneu novo aro 15...' },
    funilaria: { label: 'O que precisa de funilaria e pintura?', placeholder: 'Ex: Tirar amassado da porta, pintar capô arranhado...' },
    'auto-pecas': { label: 'Qual peça você procura?', placeholder: 'Ex: Pastilha de freio do Gol 2018, retrovisor direito...' },
    'estetica-automotiva': { label: 'Qual serviço de estética?', placeholder: 'Ex: Lavagem completa, polimento, cristalização...' },
    guincho: { label: 'Para onde precisa de guincho?', placeholder: 'Ex: Meu carro quebrou na estrada, preciso levar para o centro...' },
    automoveis: { label: 'Qual veículo procura?', placeholder: 'Ex: Procuro SUV, ano 2020 para cima, carro automático...' },

    // Saúde
    psicologia: { label: 'Qual o foco da terapia?', placeholder: 'Ex: Terapia para ansiedade, casal, infantil...' },
    personal_trainer: { label: 'Qual o objetivo do treino?', placeholder: 'Ex: Emagrecimento, hipertrofia, treino em casa...' },
    nutricionista: { label: 'Qual seu objetivo nutricional?', placeholder: 'Ex: Reeducação alimentar, dieta esportiva...' },
    cuidador_idosos: { label: 'Qual a rotina de cuidados?', placeholder: 'Ex: Cuidador noturno, acompanhamento hospitalar...' },
    fisioterapia: { label: 'Qual o tipo de reabilitação?', placeholder: 'Ex: Fisioterapia pós-operatória, dores nas costas...' },
    yoga_meditacao: { label: 'O que você busca na prática?', placeholder: 'Ex: Aulas de Hatha Yoga, meditação guiada, relaxamento...' },
    massoterapia: { label: 'Qual massagem você procura?', placeholder: 'Ex: Massagem relaxante, drenagem linfática, modeladora...' },
    estetica_avancada: { label: 'Qual procedimento estético?', placeholder: 'Ex: Harmonização facial, botox, limpeza de pele...' },
    odontologia: { label: 'Qual procedimento odontológico?', placeholder: 'Ex: Lente de contato dental, clareamento, implante...' },
    exames: { label: 'Quais exames precisa fazer?', placeholder: 'Ex: Coleta de sangue em casa, check-up geral...' },

    // Pet
    banho_tosa: { label: 'Qual o porte do seu pet?', placeholder: 'Ex: Banho e tosa para Shih Tzu, hidratação...' },
    veterinario: { label: 'O que seu pet precisa?', placeholder: 'Ex: Consulta de rotina, vacina V10, ultrassom...' },
    dog_walker: { label: 'Qual a rotina de passeios?', placeholder: 'Ex: Passeio 3x na semana para Golden Retriever...' },
    creche_pet: { label: 'Em quais datas precisa da creche/hotel?', placeholder: 'Ex: Hospedagem para o feriado, creche diária...' },
    adestramento: { label: 'Qual comportamento quer corrigir?', placeholder: 'Ex: Xixi no lugar errado, puxar coleira...' },
    alimentacao_pet: { label: 'Qual o porte e restrição do pet?', placeholder: 'Ex: Comida natural para cão idoso, porções mensais...' },
    pet_shop: { label: 'Qual item ou ração procura?', placeholder: 'Ex: Preciso de Ração Golden Adultos 15kg com entrega...' },

    // Digital & Educação
    gestao_trafego: { label: 'Qual o objetivo do seu negócio?', placeholder: 'Ex: Aumentar vendas no Instagram, leads locais...' },
    fotografia: { label: 'Para qual evento/fim as fotos?', placeholder: 'Ex: Ensaio corporativo, fotos de produtos...' },
    idiomas: { label: 'Qual idioma e foco?', placeholder: 'Ex: Inglês para conversação, preparatório IELTS...' },
    cursos_profissionalizantes: { label: 'Qual curso e especialização?', placeholder: 'Ex: Técnico em Enfermagem, Informática...' },
    aulas_particulares: { label: 'Qual disciplina e nível?', placeholder: 'Ex: Reforço de Matemática para ensino médio, Violão...' },
    consultoria_imagem: { label: 'O que busca melhorar?', placeholder: 'Ex: Colorimetria, estilo profissional...' },
    planejamento_financeiro: { label: 'Qual sua meta financeira?', placeholder: 'Ex: Organizar dívidas, aprender a investir...' },

    // Eventos
    decoracao_festas: { label: 'Detalhes da festa', placeholder: 'Ex: Decoração infantil tema Safari para 50 pessoas...' },
    buffet: { label: 'O que deseja servir?', placeholder: 'Ex: Buffet de churrasco para confraternização...' },
    recreacao: { label: 'Qual a faixa etária e duração?', placeholder: 'Ex: Recreação para 10 crianças de 5 anos por 4h...' },
    viagens: { label: 'Qual o destino e estilo da viagem?', placeholder: 'Ex: Roteiro Disney, cruzeiro pelo nordeste...' },
    tatuadores: { label: 'Descreva o estilo da tatuagem', placeholder: 'Ex: Tatuagem fineline no antebraço, realismo...' },
  };

  const defaultMessageContent = {
    label: 'Como os profissionais podem te ajudar?',
    placeholder: 'Ex: Descreva detalhes do que você precisa...'
  };

  const currentMessageText = selectedCategory && categoryMessages[selectedCategory] 
    ? categoryMessages[selectedCategory] 
    : defaultMessageContent;

  const categoryObj = CATEGORIES.find(c => c.id === selectedCategory);

  const selectedProvidersData = providers.filter(p => selectedProviders.includes(p.id))

  return (
    <div className="min-h-screen bg-gray-50 dark:bg-gray-950">
      {/* ... keeping header ... */}
      <header className="sticky top-16 z-40 bg-white dark:bg-gray-900 shadow-sm border-b dark:border-gray-800 transition-colors">
         <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-12 flex items-center gap-4">
           <button onClick={() => navigate('/')} className="p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors">
             <ArrowLeft className="h-5 w-5 text-gray-600 dark:text-gray-400" />
           </button>
           <div className="flex flex-col truncate">
             <h1 className="text-lg font-semibold text-gray-900 dark:text-white truncate">
               {categoryObj ? categoryObj.name : 'Resultados'}
             </h1>
             <span className="text-sm font-normal text-gray-500 dark:text-gray-400 truncate">
               {loading 
                 ? 'Carregando...' 
                 : `${providers.length} encontrados em ${cityNames.length === 1 ? cityNames[0] : `${cityNames.length} cidades`}`
               }
             </span>
           </div>
         </div>
      </header>

      <main className="px-3 py-2 max-w-7xl mx-auto space-y-6 relative">
        {/* Sticky Header: Message Input & Select All */}
        <div className="sticky top-28 z-30 bg-gray-50/95 dark:bg-gray-900/95 backdrop-blur-sm -mx-3 px-3 py-2 space-y-[6px] shadow-sm transition-all rounded-b-xl border-b border-gray-100 dark:border-gray-800">
           <div className={`bg-white dark:bg-gray-800 p-2 rounded-md shadow-sm border space-y-2 transition-colors ${!customMessage.trim() && selectedProviders.length > 0 ? 'border-red-300 ring-1 ring-red-100' : 'border-gray-100 dark:border-gray-700'}`}>
            <label htmlFor="message" className="block text-sm font-medium text-gray-700 dark:text-gray-200">
              {currentMessageText.label} <span className="text-red-500">*</span>:
            </label>
            <textarea
              id="message"
              rows={2}
              className="w-full p-2 rounded-md border-gray-200 shadow-sm focus:border-blue-500 focus:ring-blue-500/20 text-gray-900 placeholder:text-gray-400 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400"
              placeholder={currentMessageText.placeholder}
              value={customMessage}
              onChange={(e) => setCustomMessage(e.target.value)}
            />
            <p className={`text-xs ${!customMessage.trim() ? 'text-red-500 font-medium' : 'text-gray-500'}`}>
              {!customMessage.trim() ? 'Escreva uma mensagem para habilitar o contato.' : 'Essa mensagem será enviada para todos os contatos selecionados.'}
            </p>
          </div>

          {!loading && providers.length > 0 && (
            <div className="flex items-center gap-2 px-1">
              <input
                type="checkbox"
                checked={allSelected}
                onChange={handleSelectAll}
                className="h-5 w-5 rounded border-gray-300 text-green-600 focus:ring-green-600 cursor-pointer"
                id="select-all"
              />
              <label htmlFor="select-all" className="text-sm font-medium text-gray-700 dark:text-gray-100 cursor-pointer select-none">
                Selecionar todos ({selectedProviders.length})
              </label>
            </div>
          )}
        </div>

        <ProviderList
          providers={providers}
          loading={loading}
          cityName={cityNames.length === 1 ? cityNames[0] : 'Múltiplas cidades'}
          cityMap={cityMap}
          customMessage={customMessage}
          chatSentIds={chatSentIds}
        onLoginRequest={() => setShowLoginModal(true)}
          onChatAction={handleOpenChat}
          onProfileClick={handleOpenProfile}
        />
      </main>

      {/* ... keeping Bottom Bar ... */}

      {/* Profile Modal */}
      {selectedProfile && (
        <CompanyProfileModal 
            isOpen={showProfileModal}
            onClose={() => setShowProfileModal(false)}
            provider={selectedProfile}
            onWhatsAppClick={() => {
                logContactEvent(selectedProfile.id, 'whatsapp_click')
                window.open(buildWhatsAppLink(selectedProfile.whatsapp || selectedProfile.phone, customMessage), '_blank')
            }}
            onPlatformClick={() => handleOpenChat(selectedProfile.id)}
            cityName={cityMap[selectedProfile.city_id] || (cityNames.length === 1 ? cityNames[0] : 'Sua região')}
        />
      )}

      {/* Bottom Bar */}
      {selectedProviders.length > 0 && (
        <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-100 p-4 shadow-[0_-4px_6px_-1px_rgba(0,0,0,0.05)] z-20">
          <div className="max-w-7xl mx-auto flex flex-col sm:flex-row items-center gap-3">
             <div className="text-sm text-gray-600 hidden sm:block flex-1">
              {selectedProviders.length} empresas selecionadas
            </div>
            
            <div className="flex gap-3 w-full sm:w-auto font-medium">
              {/* Button A: WhatsApp List */}
              <Button
                fullWidth
                variant="outline"
                size="md"
                onClick={handleBulkWhatsApp}
                disabled={!customMessage.trim()}
                className={`
                  flex-1 sm:flex-none transition-all duration-300 gap-2 px-4
                  ${!customMessage.trim() 
                    ? 'border-gray-200 bg-gray-100 text-gray-400 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-600 cursor-not-allowed' 
                    : 'border-green-600 text-green-600 hover:bg-green-50 dark:border-green-500 dark:text-green-400 dark:hover:bg-green-900/20'
                  }
                `}
              >
                <WhatsAppIcon className="h-5 w-5" />
                WhatsApp
              </Button>

              {/* Button B: Platform Chat */}
              <Button
                fullWidth
                size="md"
                onClick={handleBulkChat}
                disabled={!customMessage.trim() || sending}
                className={`
                  flex-1 sm:flex-none transition-all duration-300 gap-2
                  ${!customMessage.trim()
                    ? 'bg-gray-300 text-gray-500 shadow-none dark:bg-gray-800 dark:text-gray-600 cursor-not-allowed'
                    : 'bg-brand-blue hover:bg-blue-700 text-white shadow-lg shadow-blue-500/30 hover:shadow-blue-600/40 dark:shadow-blue-900/50'
                  }
                `}
              >
                {sending ? (
                  'Enviando...' 
                ) : (
                  <>
                    <Logo size={30} showText={false} />
                    Chat ({selectedProviders.length})
                  </>
                )}
              </Button>
            </div>
          </div>
        </div>
      )}

      {/* ... Contact Modal Overlay remains ... */}

      {/* Modal de Lista de WhatsApp */}
      {showContactModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm p-4 animate-in fade-in duration-200">
          <div className="bg-white dark:bg-gray-900 rounded-2xl w-full max-w-md shadow-2xl p-6 relative animate-in zoom-in-95 duration-200 border dark:border-gray-800">
            <button 
              onClick={() => setShowContactModal(false)}
              className="absolute top-4 right-4 text-gray-400 hover:text-gray-600 dark:text-gray-500 dark:hover:text-gray-200"
            >
              ✕
            </button>

            <div className="text-center mb-6">
              <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-2">
                Falar com empresas
              </h3>
              <p className="text-sm text-gray-500 dark:text-gray-400">
                Clique abaixo para abrir a conversa no WhatsApp com cada empresa:
              </p>
            </div>

            <div className="space-y-3 max-h-[60vh] overflow-y-auto pr-2">
              {selectedProvidersData.map(p => (
                <ContactListItem
                  key={p.id}
                  provider={p}
                  message={customMessage}
                  chatSent={chatSentIds.includes(p.id)}
                />
              ))}
            </div>
            
            <div className="mt-6 pt-4 border-t border-gray-100 dark:border-gray-800">
               <p className="text-xs text-center text-gray-400 dark:text-gray-500">
                 Dica: Envie uma mensagem de cada vez.
               </p>
            </div>
          </div>
        </div>
      )}

      <LoginUpsellModal 
        isOpen={showLoginModal} 
        onClose={() => setShowLoginModal(false)}
        onLogin={() => {
           localStorage.setItem('yai-redirect-after-login', location.pathname + location.search + (location.search ? '&' : '?') + 'autoSend=true')
           setShowLoginModal(false)
           navigate('/login', { 
             state: { 
               from: location.pathname + location.search + (location.search ? '&' : '?') + 'autoSend=true',
               message: 'Faça login ou crie sua conta para enviar a mensagem aos prestadores.' 
             } 
           })
        }}
      />
    </div>
  )
}

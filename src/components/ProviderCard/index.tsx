import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { WhatsAppIcon } from '../Icons/WhatsAppIcon'
import { Check, X } from 'lucide-react'
import type { Provider } from '../../services/providers.service'
import { logContactEvent } from '../../services/providers.service'
import { useContactHistory } from '../../hooks/useContactHistory'
import { Checkbox } from '../Checkbox'
import { buildWhatsAppLink } from '../../utils/whatsapp'
import { LoginUpsellModal } from '../LoginUpsellModal'
import { ContactOptionsModal } from '../ContactOptionsModal'
import { ModalConfirm } from '../ModalConfirm'

interface ProviderCardProps {
  provider: Provider
  selected: boolean
  onToggle: (id: string) => void
  customMessage?: string
  chatSent?: boolean
  cityName?: string
  onLoginRequest: () => void
  onChatAction: (providerId: string) => void
  onProfileClick: (provider: Provider) => void
}

export function ProviderCard({ provider, selected, onToggle, customMessage, chatSent, cityName, onLoginRequest, onChatAction, onProfileClick }: ProviderCardProps) {
  const navigate = useNavigate()
  const { getStatus, setStatus, history } = useContactHistory()
  const [showContactModal, setShowContactModal] = useState(false)
  const [showUpsell, setShowUpsell] = useState(false)
  const [showRedirectionConfirm, setShowRedirectionConfirm] = useState(false)
  
  const isConfirmed = provider.confirmed || getStatus(provider.id) === 'confirmed'
  const status = isConfirmed ? 'confirmed' : getStatus(provider.id)

  const whatsappLink = buildWhatsAppLink(
    provider.whatsapp || provider.phone,
    customMessage || `Olá! 👋 Estou procurando um imóvel na região de ${cityName || provider.neighborhood}. Pode me ajudar?`
  )

  const handleContactClick = (e: React.MouseEvent) => {
    e.stopPropagation()
    e.preventDefault()
    
    // Always open modal to let user choose/re-choose
    setShowContactModal(true)
  }

  const handleWhatsAppAction = () => {
    setStatus(provider.id, 'opened')
    logContactEvent(provider.id, 'whatsapp_click')
  }

  const handlePlatformAction = () => {
    onLoginRequest()
  }

  const handleYes = (e: React.MouseEvent) => {
    e.stopPropagation()
    setStatus(provider.id, 'confirmed')
    logContactEvent(provider.id, 'whatsapp_confirmed')
    setShowUpsell(true)
  }

  const handleNo = (e: React.MouseEvent) => {
    e.stopPropagation()
    setStatus(provider.id, 'idle')
  }

  const handleChatBadgeClick = (e: React.MouseEvent) => {
    e.stopPropagation()
    onChatAction(provider.id)
  }

  const handleWhatsAppBadgeClick = (e: React.MouseEvent) => {
    e.stopPropagation()
    setShowRedirectionConfirm(true)
  }

  const confirmWhatsAppRedirect = () => {
    logContactEvent(provider.id, 'whatsapp_click') 
  }

  /*
  const handleClaim = async (e: React.MouseEvent) => {
     e.stopPropagation()
     try {
       if (!confirm('Virar dono desta empresa para testes?')) return
       const { claimProvider } = await import('../../services/providers.service')
       await claimProvider(provider.id)
       alert('Você agora é o dono! Acesse /provider para ver as mensagens.')
     } catch (err: any) {
       console.error(err)
       if (err.message === 'User not authenticated') {
         onLoginRequest()
         return
       }
       alert(`Erro ao virar dono: ${err.message || 'Erro desconhecido'}`)
     }
  }
  */


  // Styles based on status
  const statusStyles = {
    idle: selected 
      ? 'border-green-500 ring-1 ring-green-500 bg-green-50/10 dark:bg-green-900/10' 
      : 'border-gray-200 dark:border-gray-700 hover:border-green-200 dark:hover:border-green-800 bg-white dark:bg-gray-800',
      
    opened: 'border-yellow-400 bg-yellow-50 dark:bg-yellow-900/20 ring-1 ring-yellow-400 dark:ring-yellow-500/50',
    
    confirmed: 'border-green-200 dark:border-green-800 bg-green-50/50 dark:bg-green-900/20'
  }

  return (
    <>
      <div 
        className={`
          relative rounded-md border p-2 transition-all cursor-pointer group hover:shadow-md
          ${statusStyles[status]}
        `}
        onClick={() => onToggle(provider.id)}
      >
        <div className="flex items-center gap-3">
          <Checkbox 
            checked={selected} 
            readOnly
            className="mt-1 pointer-events-none"
          />
          
            <div className="flex-1 min-w-0 flex flex-col gap-1">
              {/* Row 1: Name and Badges */}
              <div className="flex items-center gap-2">
                 <button 
                  onClick={(e) => {
                    e.stopPropagation()
                    onProfileClick(provider)
                  }}
                  className="font-semibold text-[#0F0F96] dark:text-brand-yellow truncate flex-1 min-w-0 text-left hover:underline decoration-brand-yellow/50 underline-offset-2 transition-all" 
                  title={`Ver perfil de ${provider.name}`}
                 >
                   {provider.name}
                 </button>
                 
                 {/* Platform Chat Badge */}
                 {chatSent && (
                  <button
                    onClick={handleChatBadgeClick}
                    className="flex items-center gap-1 px-2 py-0.5 rounded-full bg-blue-100 border border-blue-200 text-brand-blue text-[10px] font-bold hover:bg-blue-200 transition-colors cursor-pointer" 
                    title="Abrir chat (Simulado)"
                  >
                    <span className="w-1.5 h-1.5 rounded-full bg-brand-blue animate-pulse" />
                    Chat
                  </button>
                 )}

                 {/* WhatsApp Confirmed Badge */}
                 {status === 'confirmed' && (
                  <button
                    onClick={handleWhatsAppBadgeClick}
                    className="flex items-center gap-1 px-2 py-0.5 rounded-full bg-green-100 border border-green-200 text-green-700 text-[10px] font-bold hover:bg-green-200 transition-colors cursor-pointer" 
                    title="Enviar nova mensagem no WhatsApp"
                  >
                    <Check className="h-3 w-3" />
                    Whatsapp
                  </button>
                 )}

                 {/* Dev: Test Claim (DESATIVADO - COMENTE PARA TESTAR)
                 <button
                   onClick={(e) => {
                      // handleClaim(e) // Descomente handleClaim acima também
                   }}
                   className="opacity-0 group-hover:opacity-20 hover:!opacity-100 px-2 py-0.5 text-[8px] bg-purple-100 text-purple-700 rounded border border-purple-200"
                   title="Desenvolvedor: Virar Dono desta Empresa"
                 >
                   Dev: Dono
                 </button>
                 */}
              </div>

              {/* Row 2: Neighborhood and Actions */}
              <div className="flex items-center justify-between gap-2">
                {/* Col 1: Neighborhood and City */}
                <div className="min-w-0 flex-1">
                  {(provider.neighborhood || cityName) && (
                    <p className="text-xs text-gray-500 truncate" title={[provider.neighborhood, cityName].filter(Boolean).join(' - ')}>
                      {[provider.neighborhood, cityName].filter(Boolean).join(' - ')}
                    </p>
                  )}
                </div>

                {/* Col 2: Action or Question */}
                <div className="flex items-center gap-2">
                  {status === 'opened' ? (
                     <div className="flex items-center gap-2 animate-in slide-in-from-right-2 duration-300">
                       <span className="text-[10px] tracking-wider text-yellow-600 font-bold">
                         Whatsapp enviado?
                       </span>
                       <div className="flex items-center gap-1">
                         <button
                           onClick={handleYes}
                           className="p-1 rounded-full bg-green-300 text-green-700 hover:bg-green-200 transition-colors shadow-sm"
                           title="Sim, enviada"
                         >
                           <Check className="h-3.5 w-3.5" />
                         </button>
                         <button
                           onClick={handleNo}
                           className="p-1 rounded-full bg-red-100 text-red-700 hover:bg-red-200 transition-colors shadow-sm"
                           title="Não enviada"
                         >
                           <X className="h-3.5 w-3.5" />
                         </button>
                       </div>
                     </div>
                  ) : (
                    <></>
                    // <button 
                    //   onClick={handleContactClick}
                    //   className={`
                    //     flex-shrink-0 p-2 rounded-full transition-colors
                    //     ${whatsappLink === '#' 
                    //       ? 'text-gray-300 cursor-not-allowed' 
                    //       : status === 'confirmed' 
                    //         ? 'text-green-600 bg-green-50 hover:bg-green-100'
                    //         : 'text-green-600 hover:bg-green-50 hover:text-green-700'
                    //     }
                    //   `}
                    //   title={whatsappLink === '#' ? 'Sem WhatsApp' : 'Entrar em contato'}
                    //   disabled={whatsappLink === '#'}
                    // >
                    //   <WhatsAppIcon className="h-5 w-5" />
                    // </button>
                  )}
                </div>
              </div>
            </div>
        </div>
      </div>

      <LoginUpsellModal 
        isOpen={showUpsell} 
        onClose={() => setShowUpsell(false)}
        onLogin={() => {
          navigate('/login')
          setShowUpsell(false)
        }}
      />

      <ContactOptionsModal 
        isOpen={showContactModal}
        onClose={() => setShowContactModal(false)}
        providerName={provider.name}
        whatsappLink={whatsappLink}
        onWhatsAppClick={handleWhatsAppAction}
        onPlatformClick={handlePlatformAction}
      />

      <ModalConfirm
        isOpen={showRedirectionConfirm}
        onClose={() => setShowRedirectionConfirm(false)}
        onConfirm={confirmWhatsAppRedirect}
        title="Redirecionar para WhatsApp?"
        description="Você será levado para o WhatsApp para enviar uma nova mensagem a esta empresa."
        confirmText="Sim, continuar"
        cancelText="Voltar"
      />
    </>
  )
}

import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { WhatsAppIcon } from '../Icons/WhatsAppIcon'
import { Check, X, Mail } from 'lucide-react'
import type { Provider } from '../../services/providers.service'
import { logContactEvent } from '../../services/providers.service'
import { useContactHistory } from '../../hooks/useContactHistory'
import { buildWhatsAppLink } from '../../utils/whatsapp'
import { LoginUpsellModal } from '../LoginUpsellModal'

interface ContactListItemProps {
  provider: Provider
  message: string
  chatSent?: boolean
}

export function ContactListItem({ provider, message, chatSent }: ContactListItemProps) {
  const navigate = useNavigate()
  const { history, setStatus } = useContactHistory()
  const [showUpsell, setShowUpsell] = useState(false)
  
  // Use API confirmed status as fallback if not in local history, 
  // or sync API status to local history on mount if needed.
  // Ideally, if API says confirmed, we treat it as confirmed.
  const isConfirmed = provider.confirmed || history[provider.id] === 'confirmed'
  const status = isConfirmed ? 'confirmed' : (history[provider.id] || 'idle')
  const hasWhatsApp = !!provider.whatsapp

  const handleWhatsAppAction = (e?: React.MouseEvent) => {
    e?.stopPropagation()
    e?.preventDefault()
    
    if (!hasWhatsApp) return
    if (status === 'opened') return

    const link = buildWhatsAppLink(provider.whatsapp || provider.phone, message)
    window.open(link, '_blank')
    setStatus(provider.id, 'opened')
    logContactEvent(provider.id, 'whatsapp_click')
  }

  const handleYes = (e: React.MouseEvent) => {
    e.preventDefault()
    e.stopPropagation()
    setStatus(provider.id, 'confirmed')
    logContactEvent(provider.id, 'whatsapp_confirmed')
    setShowUpsell(true)
  }

  const handleNo = (e: React.MouseEvent) => {
    e.preventDefault()
    e.stopPropagation()
    setStatus(provider.id, 'idle')
  }

  return (
    <>
      <div 
        className={`
          flex items-center gap-3 p-3 rounded-xl border transition-all group bg-white dark:bg-white
          ${hasWhatsApp ? 'cursor-pointer' : 'cursor-not-allowed opacity-70'}
          ${status === 'opened' ? 'border-yellow-400 bg-yellow-50 ring-1 ring-yellow-400' : hasWhatsApp ? 'border-gray-100 dark:border-gray-200 hover:shadow-sm hover:border-green-200' : 'border-gray-100 dark:border-gray-200 bg-gray-50'}
          ${status === 'confirmed' ? 'border-green-200 bg-green-50/50' : ''}
          ${status === 'confirmed' && chatSent ? 'opacity-60' : ''}
        `}
        onClick={handleWhatsAppAction}
      >
        <div className={`
          h-10 w-10 rounded-full flex items-center justify-center transition-colors
          ${!hasWhatsApp ? 'bg-gray-100 text-gray-400 border border-gray-200' : ''}
          ${hasWhatsApp && status === 'opened' ? 'bg-yellow-100 text-yellow-600' : ''}
          ${hasWhatsApp && status !== 'opened' && status !== 'confirmed' ? 'bg-white/10 text-brand-yellow border border-white/20 group-hover:bg-white/20 dark:bg-green-50 dark:text-green-600 dark:border-green-100' : ''}
          ${status === 'confirmed' ? 'bg-gray-200 text-gray-500 border-none' : ''}
        `}>
          {status === 'confirmed' ? <Check className="h-5 w-5" /> : hasWhatsApp ? <WhatsAppIcon className="h-5 w-5 fill-current" /> : <X className="h-5 w-5" />}
        </div>
        
        <div className="flex-1 min-w-0 flex flex-col gap-1">
          {/* Row 1: Name and Badges */}
          <div className="flex items-center gap-2">
            <h3 className={`font-semibold text-[#0F0F96] dark:text-[#0F0F96] truncate flex-1 min-w-0 ${status === 'confirmed' ? 'line-through text-gray-500' : ''}`} title={provider.name}>
              {provider.name}
            </h3>
            
            {/* Platform Chat Badge */}
            {chatSent && (
              <div className="flex items-center gap-1 px-2 py-0.5 rounded-full bg-blue-100 border border-blue-200 text-brand-blue text-[10px] font-bold" title="Chat enviado pela plataforma">
                <Mail className="h-3 w-3" />
                <span>Chat</span>
              </div>
            )}

            {/* WhatsApp Confirmed Badge */}
            {status === 'confirmed' && (
              <div className="flex items-center gap-1 px-2 py-0.5 rounded-full bg-green-100 border border-green-200 text-green-700 text-[10px] font-bold" title="WhatsApp enviado">
                <Check className="h-3 w-3" />
                <span>Whatsapp</span>
              </div>
            )}

            {/* No WhatsApp Badge - New! */}
            {!hasWhatsApp && (
               <div className="flex items-center gap-1 px-2 py-0.5 rounded-full bg-gray-100 border border-gray-200 text-gray-500 text-[10px] font-bold" title="Sem WhatsApp">
                 <X className="h-3 w-3" />
                 <span>Sem Zap</span>
               </div>
            )}
          </div>
          
          {/* Row 2: Neighborhood and Actions */}
          <div className="flex items-center justify-between gap-2">
            {/* Col 1: Neighborhood/Message */}
            <div className="min-w-0 flex-1">
              {!hasWhatsApp ? (
                <p className="text-xs text-red-500 font-medium truncate">
                  Este prestador não possui WhatsApp.
                </p>
              ) : (
                provider.neighborhood && (
                  <p className="text-xs text-gray-500 truncate">
                    {provider.neighborhood}
                  </p>
                )
              )}
            </div>
            
            {/* Col 2: Action or Question (Only when opened) */}
            {status === 'opened' && (
              <div className="flex items-center gap-2 animate-in slide-in-from-right-2 duration-300">
                <span className="text-[10px] tracking-wider text-yellow-600 font-bold">
                  Whatsapp enviado?
                </span>
                <div className="flex items-center gap-1">
                  <button 
                    onClick={handleYes}
                    className="p-1 rounded-full bg-green-300 text-green-700 hover:bg-green-200 transition-colors shadow-sm"
                    title="Sim"
                  >
                    <Check className="h-3.5 w-3.5" />
                  </button>
                  <button 
                    onClick={handleNo}
                    className="p-1 rounded-full bg-red-100 text-red-700 hover:bg-red-200 transition-colors shadow-sm"
                    title="Não"
                  >
                    <X className="h-3.5 w-3.5" />
                  </button>
                </div>
              </div>
            )}
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
    </>
  )
}

import { X, MessageSquare, Send } from 'lucide-react'
import { WhatsAppIcon } from '../Icons/WhatsAppIcon'
import { Button } from '../Button'

interface ContactOptionsModalProps {
  isOpen: boolean
  onClose: () => void
  providerName: string
  whatsappLink: string
  onWhatsAppClick: () => void
  onPlatformClick: () => void
}

export function ContactOptionsModal({ 
  isOpen, 
  onClose, 
  providerName,
  whatsappLink,
  onWhatsAppClick,
  onPlatformClick
}: ContactOptionsModalProps) {
  if (!isOpen) return null

  return (
    <div className="fixed inset-0 z-[60] flex items-center justify-center bg-black/50 backdrop-blur-sm p-4 animate-in fade-in duration-200">
      <div className="bg-white dark:bg-gray-900 rounded-2xl w-full max-w-sm shadow-2xl p-6 relative animate-in zoom-in-95 duration-200 border dark:border-gray-800">
        <button 
          onClick={onClose}
          className="absolute top-4 right-4 text-gray-400 hover:text-gray-600 dark:text-gray-500 dark:hover:text-gray-200"
        >
          <X className="h-5 w-5" />
        </button>

        <div className="text-center mb-6">
          <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-2">
            Como deseja falar com<br/>
            <span className="text-brand-blue dark:text-brand-yellow">{providerName}</span>?
          </h3>
          <p className="text-sm text-gray-500 dark:text-gray-400">
            Escolha a melhor forma de contato para você.
          </p>
        </div>

        <div className="space-y-3">
          {/* Option A: WhatsApp */}
          {/* Option A: WhatsApp */}
          <a
            href={whatsappLink}
            target="_blank" 
            rel="noopener noreferrer"
            onClick={() => {
              onWhatsAppClick()
              onClose()
            }}
            className="flex items-center justify-between w-full p-4 rounded-xl border border-green-100 bg-green-50 hover:bg-green-100 hover:border-green-200 dark:bg-green-900/20 dark:border-green-800 dark:hover:bg-green-900/30 transition-all group cursor-pointer text-left"
          >
            <div className="flex items-center gap-3">
              <div className="bg-green-500 text-white p-2 rounded-lg group-hover:scale-110 transition-transform">
                <WhatsAppIcon className="h-5 w-5 text-white fill-current" />
              </div>
              <div>
                <p className="font-semibold text-gray-900 dark:text-gray-100 text-sm">WhatsApp</p>
                <p className="text-xs text-green-700 dark:text-green-400">Resposta mais rápida</p>
              </div>
            </div>
            <Send className="h-4 w-4 text-green-600 dark:text-green-400 opacity-0 group-hover:opacity-100 transition-opacity -ml-4 group-hover:ml-0" />
          </a>

          {/* Option B: Platform */}
          <button
            onClick={() => {
              onPlatformClick()
              onClose()
            }}
            className="flex items-center justify-between w-full p-4 rounded-xl border border-gray-100 bg-gray-50 hover:bg-white hover:border-brand-blue/30 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 dark:hover:border-gray-500 hover:shadow-sm transition-all group cursor-pointer text-left"
          >
            <div className="flex items-center gap-3">
              <div className="bg-brand-blue text-white p-2 rounded-lg group-hover:scale-110 transition-transform">
                <MessageSquare className="h-5 w-5 text-white" />
              </div>
              <div>
                <p className="font-semibold text-gray-900 dark:text-white text-sm">Pela Plataforma</p>
                <p className="text-xs text-gray-500 dark:text-gray-400">Mais seguro e organizado</p>
              </div>
            </div>
            <Send className="h-4 w-4 text-brand-blue dark:text-brand-yellow opacity-0 group-hover:opacity-100 transition-opacity -ml-4 group-hover:ml-0" />
          </button>
        </div>

        <div className="mt-6 text-center">
            <p className="text-xs text-gray-400">
                Ao entrar em contato, você concorda com nossos termos.
            </p>
        </div>
      </div>
    </div>
  )
}

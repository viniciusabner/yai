import { X } from 'lucide-react'
import { Button } from '../Button'

interface LoginUpsellModalProps {
  isOpen: boolean
  onClose: () => void
  onLogin: () => void
}

export function LoginUpsellModal({ isOpen, onClose, onLogin }: LoginUpsellModalProps) {
  if (!isOpen) return null

  return (
    <div className="fixed inset-0 z-[60] flex items-center justify-center bg-black/60 backdrop-blur-sm p-4 animate-in fade-in duration-200">
      <div className="w-full max-w-md bg-white rounded-2xl shadow-xl overflow-hidden animate-in zoom-in-95 duration-200">
        
        {/* Header with Close Button */}
        <div className="p-4 border-b border-gray-100 flex justify-end">
          <button 
            onClick={onClose}
            className="text-gray-400 hover:text-gray-600 transition-colors p-1"
          >
            <X className="h-5 w-5" />
          </button>
        </div>

        {/* Content */}
        <div className="px-6 pb-8 pt-2 text-center space-y-4">
          <div className="h-16 w-16 bg-blue-50 text-blue-600 rounded-full flex items-center justify-center mx-auto mb-4">
             {/* Simple user icon or checkmark */}
             <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="lucide lucide-user-check"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><polyline points="16 11 18 13 22 9"/></svg>
          </div>

          <h2 className="text-2xl font-bold text-gray-900">
            Salve seu histórico!
          </h2>
          
          <p className="text-gray-600">
            Faça login para ter uma experiência melhor. Com o login você poderá controlar melhor o envio das suas mensagens e manter seu histórico sempre em dia.
          </p>

          <div className="pt-4 space-y-3">
             <Button fullWidth size="lg" onClick={onLogin} className="bg-blue-600 hover:bg-blue-700 text-white">
               Fazer Login
             </Button>
             
             <Button fullWidth variant="ghost" onClick={onClose} className="text-gray-500 hover:text-gray-700">
               Agora não
             </Button>
          </div>
        </div>

      </div>
    </div>
  )
}

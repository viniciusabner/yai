import { format } from 'date-fns'
import { ptBR } from 'date-fns/locale'
import { User, Store } from 'lucide-react'
import type { Conversation } from '../../services/messaging.service'

interface ConversationItemProps {
  conversation: Conversation
  isActive: boolean
  onClick: () => void
}

export function ConversationItem({ conversation, isActive, onClick }: ConversationItemProps) {
  const lastMessageTime = conversation.last_message 
    ? format(new Date(conversation.last_message.created_at), 'HH:mm', { locale: ptBR })
    : format(new Date(conversation.created_at), 'dd/MM', { locale: ptBR })

  return (
    <div 
      onClick={onClick}
      className={`
        w-full p-4 flex items-center gap-3 cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors border-b border-gray-100 dark:border-gray-800
        ${isActive ? 'bg-blue-50 dark:bg-blue-900/20 border-l-4 border-l-brand-blue' : 'border-l-4 border-l-transparent'}
      `}
    >
      {/* Avatar Placeholder */}
      <div className="flex-shrink-0 h-12 w-12 rounded-full bg-gray-100 dark:bg-gray-700 flex items-center justify-center text-gray-500 dark:text-gray-400">
        <Store className="h-6 w-6" />
      </div>

      <div className="flex-1 min-w-0 text-left">
        <div className="flex justify-between items-baseline mb-1">
          <h3 className="font-semibold text-gray-900 dark:text-white truncate pr-2">
            {conversation.provider.name}
          </h3>
          <span className="text-xs text-gray-400 font-medium whitespace-nowrap">
            {lastMessageTime}
          </span>
        </div>
        
        <p className="text-sm text-gray-500 dark:text-gray-400 truncate">
          {conversation.last_message?.content || 'Inicie a conversa...'}
        </p>
      </div>
    </div>
  )
}

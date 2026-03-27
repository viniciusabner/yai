import { format } from 'date-fns'
import { ptBR } from 'date-fns/locale'
import type { Message } from '../../services/messaging.service'

interface MessageBubbleProps {
  message: Message
  isMe: boolean
}

export function MessageBubble({ message, isMe }: MessageBubbleProps) {
  return (
    <div className={`flex w-full ${isMe ? 'justify-end' : 'justify-start'} mb-4`}>
      <div 
        className={`
          max-w-[75%] px-4 py-2 rounded-2xl shadow-sm relative group
          ${isMe 
            ? 'bg-[#0F0F96] text-white rounded-tr-none' 
            : 'bg-white dark:bg-gray-800 text-gray-800 dark:text-gray-100 border border-gray-100 dark:border-gray-700 rounded-tl-none'
          }
        `}
      >
        <p className="text-sm whitespace-pre-wrap break-words leading-relaxed">
          {message.content}
        </p>
        <div className={`
          text-[10px] mt-1 flex items-center justify-end
          ${isMe ? 'text-blue-200' : 'text-gray-400'}
        `}>
          {format(new Date(message.created_at), 'HH:mm', { locale: ptBR })}
          {/* {isMe && (
            <span className="ml-1">
              {message.read ? <CheckCheck className="h-3 w-3" /> : <Check className="h-3 w-3" />}
            </span>
          )} */}
        </div>
      </div>
    </div>
  )
}

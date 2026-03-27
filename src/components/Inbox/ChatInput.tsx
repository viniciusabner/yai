import { useState, useRef, useEffect } from 'react'
import { Send, Smile, Paperclip } from 'lucide-react'

interface ChatInputProps {
  onSend: (message: string) => void
  disabled?: boolean
}

export function ChatInput({ onSend, disabled }: ChatInputProps) {
  const [message, setMessage] = useState('')
  const textareaRef = useRef<HTMLTextAreaElement>(null)

  const handleSend = () => {
    if (!message.trim() || disabled) return
    onSend(message)
    setMessage('')
  }

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault()
      handleSend()
    }
  }

  // Auto-resize
  useEffect(() => {
    if (textareaRef.current) {
      textareaRef.current.style.height = 'auto'
      textareaRef.current.style.height = textareaRef.current.scrollHeight + 'px'
    }
  }, [message])

  return (
    <div className="p-4 bg-gray-50 dark:bg-gray-900 border-t border-gray-200 dark:border-gray-800">
      <div className="max-w-4xl mx-auto flex items-end gap-2 bg-white dark:bg-gray-800 p-2 rounded-2xl border border-gray-200 dark:border-gray-700 shadow-sm focus-within:border-brand-blue focus-within:ring-1 focus-within:ring-brand-blue transition-all">
        {/* Actions (Mock) */}
        <button className="p-2 text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 transition-colors rounded-full hover:bg-gray-100 dark:hover:bg-gray-700 hidden sm:block">
          <Smile className="h-5 w-5" />
        </button>
        <button className="p-2 text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 transition-colors rounded-full hover:bg-gray-100 dark:hover:bg-gray-700">
          <Paperclip className="h-5 w-5" />
        </button>

        <textarea
          ref={textareaRef}
          value={message}
          onChange={(e) => setMessage(e.target.value)}
          onKeyDown={handleKeyDown}
          disabled={disabled}
          rows={1}
          placeholder="Digite sua mensagem..."
          className="flex-1 max-h-32 min-h-[44px] py-3 px-2 bg-transparent border-none focus:ring-0 resize-none text-gray-900 dark:text-white placeholder:text-gray-400 text-sm scrollbar-thin scrollbar-thumb-gray-200"
        />

        <button 
          onClick={handleSend}
          disabled={!message.trim() || disabled}
          className={`
            p-3 rounded-xl flex items-center justify-center transition-all duration-200
            ${!message.trim() || disabled
              ? 'bg-gray-100 text-gray-400 dark:bg-gray-700 dark:text-gray-500 cursor-not-allowed'
              : 'bg-[#0F0F96] text-white hover:bg-blue-800 shadow-md transform active:scale-95'
            }
          `}
        >
          <Send className="h-5 w-5" />
        </button>
      </div>
    </div>
  )
}

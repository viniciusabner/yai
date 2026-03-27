import { useState, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, MessageSquare } from 'lucide-react'
import { supabase } from '../../services/supabase'
import { getConversations, getMessages, sendMessage, subscribeToMessages, markAsRead, type Conversation, type Message } from '../../services/messaging.service'
import { ConversationItem } from '../../components/Inbox/ConversationItem'
import { MessageBubble } from '../../components/Inbox/MessageBubble'
import { ChatInput } from '../../components/Inbox/ChatInput'

import { useMessagePoller } from '../../hooks/useMessagePoller'

export function Inbox() {
  const navigate = useNavigate()
  const [conversations, setConversations] = useState<Conversation[]>([])
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const [messages, setMessages] = useState<Message[]>([])

  // Polling for reliability
  useMessagePoller(selectedId, (fetchedMessages) => {
     setMessages(fetchedMessages)
     if (selectedId) markAsRead(selectedId)
  })
  const [loading, setLoading] = useState(true)
  const [messagesLoading, setMessagesLoading] = useState(false)
  const [currentUser, setCurrentUser] = useState<string | null>(null)
  
  const messagesEndRef = useRef<HTMLDivElement>(null)

  // Fetch Conversations
  useEffect(() => {
    async function loadData() {
      try {
        const { data: { user } } = await supabase.auth.getUser()
        if (!user) {
          navigate('/login')
          return
        }
        setCurrentUser(user.id)

        const data = await getConversations()
        setConversations(data)
        
        // Auto-select first conversation on Desktop if exists
        if (window.innerWidth >= 768 && data.length > 0 && !selectedId) {
            setSelectedId(data[0].id)
        }
      } catch (error) {
        console.error('Error loading inbox:', error)
      } finally {
        setLoading(false)
      }
    }
    loadData()
  }, [navigate])

  // Fetch Messages when selected
  useEffect(() => {
    if (!selectedId) return

    async function loadMessages() {
      setMessagesLoading(true)
      try {
        const data = await getMessages(selectedId!)
        setMessages(data)
        markAsRead(selectedId!)
      } catch (error) {
        console.error('Error loading messages:', error)
      } finally {
        setMessagesLoading(false)
      }
    }
    loadMessages()

    const subscription = subscribeToMessages(selectedId, (newMsg) => {
      setMessages(prev => {
        if (prev.some(m => m.id === newMsg.id)) return prev
        return [...prev, newMsg]
      })
    })

    return () => {
      subscription.unsubscribe()
    }
  }, [selectedId])

  // Scroll to bottom
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [messages])

  const handleSend = async (content: string) => {
    if (!selectedId) return
    try {
      const newMsg = await sendMessage(selectedId, content)
      setMessages(prev => {
        if (prev.some(m => m.id === newMsg.id)) return prev
        return [...prev, newMsg]
      })
    } catch (error) {
      console.error('Error sending message:', error)
      alert('Erro ao enviar mensagem')
    }
  }

  const selectedConversation = conversations.find(c => c.id === selectedId)

  return (
    <div className="flex h-[calc(100vh-64px)] overflow-hidden bg-white dark:bg-gray-950">
      {/* Sidebar List (Visible on mobile if no chat selected, always on desktop) */}
      <div className={`
        w-full md:w-80 lg:w-96 border-r border-gray-200 dark:border-gray-800 flex flex-col bg-white dark:bg-gray-900
        ${selectedId ? 'hidden md:flex' : 'flex'}
      `}>
        {/* Header */}
        <div className="p-4 border-b border-gray-200 dark:border-gray-800 bg-gray-50 dark:bg-gray-900 flex justify-between items-center">
            <h1 className="text-xl font-bold text-gray-800 dark:text-white flex items-center gap-2">
                Mensagens
            </h1>
            {/* Search Mock */}
            {/* <button className="p-2 text-gray-500 hover:bg-gray-200 rounded-full">
                <Search className="h-5 w-5" />
            </button> */}
        </div>

        {/* List */}
        <div className="flex-1 overflow-y-auto">
          {loading ? (
            <div className="p-8 text-center text-gray-500">Carregando conversas...</div>
          ) : conversations.length === 0 ? (
            <div className="p-8 text-center text-gray-500 flex flex-col items-center gap-4">
                <MessageSquare className="h-12 w-12 text-gray-300" />
                <p>Nenhuma conversa iniciada.</p>
                <button onClick={() => navigate('/')} className="text-brand-blue font-medium hover:underline">
                    Inicie uma busca
                </button>
            </div>
          ) : (
            conversations.map(conv => (
              <ConversationItem
                key={conv.id}
                conversation={conv}
                isActive={conv.id === selectedId}
                onClick={() => setSelectedId(conv.id)}
              />
            ))
          )}
        </div>
      </div>

      {/* Chat Area (Visible on mobile if chat selected, always on desktop) */}
      <div className={`
        flex-1 flex flex-col bg-[#efeae2] dark:bg-[#0b141a]
        ${!selectedId ? 'hidden md:flex' : 'flex'}
      `}>
        {selectedId && selectedConversation ? (
          <>
            {/* Chat Header */}
            <div className="h-16 px-4 flex items-center gap-4 bg-gray-50 dark:bg-gray-900 border-b border-gray-200 dark:border-gray-800 shadow-sm z-10">
              <button 
                onClick={() => setSelectedId(null)}
                className="md:hidden p-2 -ml-2 rounded-full hover:bg-gray-200 dark:hover:bg-gray-800"
              >
                <ArrowLeft className="h-5 w-5 text-gray-600 dark:text-gray-300" />
              </button>
              
              <div className="h-10 w-10 rounded-full bg-brand-blue/10 dark:bg-brand-blue/20 flex items-center justify-center text-brand-blue font-bold">
                 {selectedConversation.provider.name.charAt(0)}
              </div>
              
              <div className="flex-1 min-w-0">
                <h2 className="font-bold text-gray-900 dark:text-white truncate">
                  {selectedConversation.provider.name}
                </h2>
                <p className="text-xs text-gray-500 dark:text-gray-400 truncate">
                  {selectedConversation.provider.neighborhood} • {selectedConversation.provider.category || 'Serviços'}
                </p>
              </div>
            </div>

            {/* Messages */}
            <div className="flex-1 overflow-y-auto p-4 space-y-4 bg-[url('https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png')] dark:bg-[url('https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png')] bg-opacity-5 dark:bg-opacity-5 bg-repeat slide-in-from-bottom-2">
                 {/* Overlay to dim background pattern in dark mode? Or CSS blend? Simplify with just color for now if pattern is too messy. kept color above */}
                 
                 {messagesLoading ? (
                    <div className="flex justify-center py-8">
                        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-brand-blue"></div>
                    </div>
                 ) : messages.length === 0 ? (
                    <div className="text-center py-12 px-4">
                        <p className="bg-white/80 dark:bg-gray-800/80 inline-block px-4 py-2 rounded-full text-sm text-gray-600 dark:text-gray-300 shadow-sm">
                            Esta é o início da sua conversa com {selectedConversation.provider.name}.
                        </p>
                    </div>
                 ) : (
                    messages.map(msg => (
                        <MessageBubble 
                            key={msg.id} 
                            message={msg} 
                            isMe={msg.sender_id === currentUser} 
                        />
                    ))
                 )}
                 <div ref={messagesEndRef} />
            </div>

            {/* Input */}
            <ChatInput onSend={handleSend} disabled={messagesLoading} />
          </>
        ) : (
          <div className="hidden md:flex flex-1 items-center justify-center bg-gray-50 dark:bg-gray-950/50 flex-col gap-4 text-center p-8">
            <div className="bg-gray-100 dark:bg-gray-800 p-6 rounded-full">
                <MessageSquare className="h-16 w-16 text-gray-300 dark:text-gray-600" />
            </div>
            <div>
                <h3 className="text-xl font-medium text-gray-800 dark:text-gray-200">
                    Sua Inbox
                </h3>
                <p className="text-gray-500 dark:text-gray-400 mt-2 max-w-sm">
                    Selecione uma conversa ao lado para ver os detalhes e trocar mensagens.
                </p>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}

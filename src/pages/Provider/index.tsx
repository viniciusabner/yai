import { useState, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft } from 'lucide-react'
import { supabase } from '../../services/supabase'
import { getProviderConversations, getMessages, sendMessage, subscribeToMessages, markAsRead, type Message } from '../../services/messaging.service'
import { getMyProviders, type Provider } from '../../services/providers.service'
import { MessageBubble } from '../../components/Inbox/MessageBubble'
import { ChatInput } from '../../components/Inbox/ChatInput'
import { format } from 'date-fns'
import { ptBR } from 'date-fns/locale'



import { useMessagePoller } from '../../hooks/useMessagePoller'

export function ProviderInbox() {
  const navigate = useNavigate()
  const [conversations, setConversations] = useState<any[]>([]) 
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const [messages, setMessages] = useState<Message[]>([])
  
  // Polling
  useMessagePoller(selectedId, (fetchedMessages) => {
      setMessages(fetchedMessages)
      if (selectedId) markAsRead(selectedId)
  })

  const [loading, setLoading] = useState(true)
  const [messagesLoading, setMessagesLoading] = useState(false)
  const [currentUser, setCurrentUser] = useState<string | null>(null)
  const [myProvider, setMyProvider] = useState<Provider | null>(null)
  
  const messagesEndRef = useRef<HTMLDivElement>(null)

  // 1. Init: Load User first, then Provider data
  useEffect(() => {
    async function init() {
        try {
            const { data: { user } } = await supabase.auth.getUser()
            if (!user) {
                setLoading(false)
                return
            }
            setCurrentUser(user.id)

            const providers = await getMyProviders()
            if (providers.length === 0) {
                setLoading(false)
                return
            }
            setMyProvider(providers[0])
            
            const data = await getProviderConversations()
            setConversations(data || [])
            
        } catch (err) {
            console.error(err)
        } finally {
            setLoading(false)
        }
    }
    init()
  }, [])


  // Fetch Messages
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
      // Check if duplicate (e.g. if we appended manually)
      setMessages(prev => {
        if (prev.some(m => m.id === newMsg.id)) return prev
        return [...prev, newMsg]
      })
    })

    return () => {
      subscription.unsubscribe()
    }
  }, [selectedId])

  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [messages])

  const handleSend = async (content: string) => {
    if (!selectedId || !currentUser) return
    try {
      // Optimistic update (or wait for result)
      // We wait for result to get ID and timestamp
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

  if (loading) return <div className="p-8">Carregando painel...</div>

  if (!myProvider) {
    return (
        <div className="p-8 text-center max-w-md mx-auto mt-10">
            <h1 className="text-2xl font-bold mb-4">Área da Empresa</h1>
            <p className="text-gray-500 mb-6">
                Você ainda não possui nenhuma empresa vinculada a esta conta.
            </p>
            <p className="text-sm bg-yellow-50 p-4 rounded text-yellow-800 border border-yellow-200">
                Dica de Teste: Vá na busca, encontre um card e clique no botão secreto "Dev: Dono" (aparece ao passar o mouse) para virar dono daquela empresa.
            </p>
            <button onClick={() => navigate('/results')} className="mt-4 text-blue-600 underline">
                Voltar para a busca
            </button>
        </div>
    )
  }

  const selectedConversation = conversations.find(c => c.id === selectedId)

  return (
    <div className="flex h-[calc(100vh-64px)] overflow-hidden bg-white dark:bg-gray-950">
      {/* Sidebar List */}
      <div className={`
        w-full md:w-80 lg:w-96 border-r border-gray-200 dark:border-gray-800 flex flex-col bg-white dark:bg-gray-900
        ${selectedId ? 'hidden md:flex' : 'flex'}
      `}>
        <div className="p-4 border-b border-gray-200 dark:border-gray-800 bg-purple-50 dark:bg-gray-900 flex justify-between items-center">
            <div>
                <h1 className="text-xl font-bold text-gray-800 dark:text-white flex items-center gap-2">
                    {myProvider.name}
                </h1>
                <span className="text-xs text-purple-600 font-medium uppercase tracking-wide">Área do Prestador</span>
            </div>
        </div>

        <div className="flex-1 overflow-y-auto">
          {conversations.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
                Nenhuma mensagem recebida ainda.
            </div>
          ) : (
            conversations.map(conv => (
              <div 
                key={conv.id}
                onClick={() => setSelectedId(conv.id)}
                className={`
                    w-full p-4 flex items-center gap-3 cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors border-b border-gray-100 dark:border-gray-800
                    ${selectedId === conv.id ? 'bg-purple-50 dark:bg-purple-900/20 border-l-4 border-l-purple-500' : 'border-l-4 border-l-transparent'}
                `}
              >
                  <div className="flex-shrink-0 h-12 w-12 rounded-full bg-purple-100 dark:bg-gray-700 flex items-center justify-center text-purple-600 font-bold">
                    {conv.user?.full_name?.[0]?.toUpperCase() || 'U'}
                  </div>
                  <div className="flex-1 min-w-0 text-left">
                      <h3 className="font-semibold text-gray-900 dark:text-white truncate">
                          {conv.user?.full_name || `Usuário (${conv.user_id.slice(0,4)})`}
                      </h3>
                      <p className="text-xs text-gray-400">
                         {format(new Date(conv.created_at), 'dd/MM HH:mm', { locale: ptBR })}
                      </p>
                  </div>
              </div>
            ))
          )}
        </div>
      </div>

      {/* Chat Area */}
      <div className={`
        flex-1 flex flex-col bg-[#e5ddd5] dark:bg-[#0b141a]
        ${!selectedId ? 'hidden md:flex' : 'flex'}
      `}>
         {selectedId && (
             <>
                <div className="h-16 px-4 flex items-center gap-4 bg-white dark:bg-gray-900 border-b border-gray-200 dark:border-gray-800 shadow-sm z-10">
                    <button 
                        onClick={() => setSelectedId(null)}
                        className="md:hidden p-2 -ml-2 rounded-full hover:bg-gray-200 dark:hover:bg-gray-800"
                    >
                        <ArrowLeft className="h-5 w-5" />
                    </button>
                    <div className="font-bold text-gray-900 dark:text-white">
                        {selectedConversation.user?.full_name || 'Conversa com Cliente'}
                    </div>
                </div>

                <div className="flex-1 overflow-y-auto p-4 space-y-4">
                    {messages.map(msg => (
                        <MessageBubble 
                            key={msg.id} 
                            message={msg} 
                            // IF I AM THE SENDER, IT IS ME.
                            // BUT WAIT. In Provider View:
                            // Me = Provider = owner of provider in conversation.
                            // Does message.sender_id == currentUser?
                            // Yes, if I reply, I am sender_id (auth.uid).
                            // So isMe logic holds true!
                            isMe={msg.sender_id === currentUser} 
                        />
                    ))}
                    <div ref={messagesEndRef} />
                </div>
                
                <ChatInput onSend={handleSend} disabled={messagesLoading} />
             </>
         )}
      </div>
    </div>
  )
}

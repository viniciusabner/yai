import { useEffect, useRef } from 'react'
import { getMessages, type Message } from '../services/messaging.service'

export function useMessagePoller(
  conversationId: string | null,
  onNewMessages: (messages: Message[]) => void,
  intervalMs = 5000
) {
  const lastMessagesRef = useRef<string>('')

  useEffect(() => {
    if (!conversationId) return

    const poll = async () => {
      try {
        const messages = await getMessages(conversationId)
        
        if (messages) {
           const serialized = JSON.stringify(messages)
           if (serialized !== lastMessagesRef.current) {
             lastMessagesRef.current = serialized
             onNewMessages(messages)
           }
        }
      } catch (error) {
        console.error('Polling error:', error)
      }
    }

    // Initial poll
    poll()

    const intervalId = setInterval(poll, intervalMs)

    return () => clearInterval(intervalId)
  }, [conversationId, intervalMs, onNewMessages])
}

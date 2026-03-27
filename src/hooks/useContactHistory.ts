import { create } from 'zustand'
import { persist } from 'zustand/middleware'

export type ContactStatus = 'idle' | 'opened' | 'confirmed'

interface ContactHistoryState {
  history: Record<string, ContactStatus> // providerId -> status
  setStatus: (providerId: string, status: ContactStatus) => void
  getStatus: (providerId: string) => ContactStatus
}

export const useContactHistory = create<ContactHistoryState>()(
  persist(
    (set, get) => ({
      history: {},

      setStatus: (providerId, status) =>
        set((state) => ({
          history: {
            ...state.history,
            [providerId]: status,
          },
        })),

      getStatus: (providerId) => {
        return get().history[providerId] || 'idle'
      },
    }),
    {
      name: 'yai-history', // name of the item in the storage (must be unique)
    }
  )
)

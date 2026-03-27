import type { Provider } from '../../services/providers.service'
import { ProviderCard } from '../ProviderCard'
import { useSelectionStore } from '../../store/useSelectionStore'

interface ProviderListProps {
  providers: Provider[]
  loading: boolean
  cityName: string
  cityMap?: Record<string, string>
  customMessage?: string
  chatSentIds?: string[]
  onLoginRequest: () => void
  onChatAction: (providerId: string) => void
  onProfileClick: (provider: Provider) => void
}

export function ProviderList({ providers, loading, cityName, cityMap, customMessage, chatSentIds = [], onLoginRequest, onChatAction, onProfileClick }: ProviderListProps) {
  const { selectedProviders, toggleProvider } = useSelectionStore()

  if (loading) {
    return (
      <div className="space-y-4">
        {[1, 2, 3].map((i) => (
          <div key={i} className="h-32 w-full animate-pulse rounded-2xl bg-gray-100" />
        ))}
      </div>
    )
  }

  if (providers.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center py-12 text-center">
        <div className="h-16 w-16 rounded-md bg-gray-100 flex items-center justify-center mb-4">
          <span className="text-2xl">🏙️</span>
        </div>
        <h3 className="text-lg font-medium text-gray-900">Nenhuma empresa encontrada</h3>
        <p className="mt-1 text-gray-500">Tente buscar em outra cidade ou região.</p>
      </div>
    )
  }

  return (
    <div className="space-y-4 pb-24">
      
      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {providers.map((provider) => (
          <ProviderCard
            key={provider.id}
            provider={provider}
            cityName={cityMap ? cityMap[provider.city_id] : cityName}
            selected={selectedProviders.includes(provider.id)}
            onToggle={() => toggleProvider(provider.id)}
            customMessage={customMessage}
            chatSent={chatSentIds.includes(provider.id)}
            onLoginRequest={onLoginRequest}
            onChatAction={() => onChatAction(provider.id)}
            onProfileClick={onProfileClick}
          />
        ))}
      </div>
    </div>
  )
}

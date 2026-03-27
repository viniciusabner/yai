import { X, MapPin, Clock, MessageSquare, Globe } from 'lucide-react'
import { WhatsAppIcon } from '../Icons/WhatsAppIcon'
import { Button } from '../Button'
import * as Tabs from '@radix-ui/react-tabs'
import type { Provider } from '../../services/providers.service'

interface CompanyProfileModalProps {
  isOpen: boolean
  onClose: () => void
  provider: Provider
  onWhatsAppClick: () => void
  onPlatformClick: () => void
  cityName?: string
}

export function CompanyProfileModal({
  isOpen,
  onClose,
  provider,
  onWhatsAppClick,
  onPlatformClick,
  cityName
}: CompanyProfileModalProps) {
  if (!isOpen) return null

  const photos = provider.photos && provider.photos.length > 0 ? provider.photos : []
  
  // TODO: Implement real IsOpen logic based on provider.opening_hours

  const fullAddress = [
    provider.address,
    provider.neighborhood,
    cityName,
    provider.state || 'SP' // Fallback state if available or hardcoded
  ].filter(Boolean).join(', ')

  const mapsLink = `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(fullAddress)}`

  return (
    <div className="fixed inset-0 z-[60] flex items-center justify-center bg-black/50 backdrop-blur-sm p-0 sm:p-4 animate-in fade-in duration-200">
      <div className="bg-white dark:bg-gray-950 w-full h-full sm:h-[85vh] sm:max-w-2xl sm:rounded-2xl shadow-2xl flex flex-col relative animate-in zoom-in-95 duration-200 overflow-hidden">
        
        {/* Cover & Header */}
        <div className="relative h-48 bg-gradient-to-br from-brand-blue to-purple-900 flex-shrink-0">
            <button 
                onClick={onClose}
                className="absolute top-4 right-4 z-10 p-2 bg-black/20 hover:bg-black/40 rounded-full text-white backdrop-blur-sm transition-colors"
            >
                <X className="h-5 w-5" />
            </button>
            <div className="absolute -bottom-10 left-6 z-30">
                <div className="h-24 w-24 rounded-2xl bg-white dark:bg-gray-900 border-4 border-white dark:border-gray-950 shadow-lg flex items-center justify-center text-3xl font-bold text-brand-blue dark:text-brand-yellow shrink-0">
                    {provider.name.charAt(0).toUpperCase()}
                </div>
            </div>
        </div>

        {/* Content */}
        <div className="flex-1 overflow-y-auto pt-16 pb-24 px-6 relative">
            
            {/* Title Section */}
            <div className="mb-6">
                <div className="flex items-start justify-between">
                    <div>
                        <h2 className="text-2xl font-bold text-gray-900 dark:text-white leading-tight">
                            {provider.name}
                        </h2>
                        <p className="text-sm text-gray-500 dark:text-gray-400 font-medium">
                            {provider.category || 'Serviços'} • {provider.neighborhood}
                        </p>
                    </div>

                </div>
            </div>

            {/* Tabs */}
            <Tabs.Root defaultValue="about" className="flex flex-col gap-6">
                <Tabs.List className="flex border-b border-gray-100 dark:border-gray-800" aria-label="Company details">
                    <Tabs.Trigger 
                        value="about"
                        className="px-4 py-2 text-sm font-medium text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 border-b-2 border-transparent data-[state=active]:border-brand-blue data-[state=active]:text-brand-blue dark:data-[state=active]:border-brand-yellow dark:data-[state=active]:text-brand-yellow transition-all"
                    >
                        Sobre
                    </Tabs.Trigger>
                    <Tabs.Trigger 
                        value="photos" 
                        className="px-4 py-2 text-sm font-medium text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 border-b-2 border-transparent data-[state=active]:border-brand-blue data-[state=active]:text-brand-blue dark:data-[state=active]:border-brand-yellow dark:data-[state=active]:text-brand-yellow transition-all"
                    >
                        Fotos
                    </Tabs.Trigger>
                    <Tabs.Trigger 
                        value="reviews" 
                        className="px-4 py-2 text-sm font-medium text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200 border-b-2 border-transparent data-[state=active]:border-brand-blue data-[state=active]:text-brand-blue dark:data-[state=active]:border-brand-yellow dark:data-[state=active]:text-brand-yellow transition-all"
                    >
                        Avaliações
                    </Tabs.Trigger>
                </Tabs.List>

                <Tabs.Content value="about" className="space-y-6 outline-none animate-in fade-in slide-in-from-bottom-2 duration-300">
                    <div className="space-y-4 text-gray-600 dark:text-gray-300 text-sm leading-relaxed">
                        <p>
                            {provider.description}
                        </p>
                        
                        <div className="grid grid-cols-1 gap-3 py-2">
                             {/* Address Link */}
                             <a 
                                href={mapsLink}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="flex items-center gap-3 p-3 bg-gray-50 dark:bg-gray-900 rounded-xl hover:bg-blue-50 dark:hover:bg-gray-800 transition-colors group"
                             >
                                 <MapPin className="h-5 w-5 text-gray-400 group-hover:text-brand-blue" />
                                 <div>
                                     <p className="font-medium text-gray-900 dark:text-white group-hover:text-brand-blue transition-colors">Endereço</p>
                                     <p className="text-xs text-gray-500 group-hover:text-gray-700 dark:group-hover:text-gray-300">
                                        {fullAddress}
                                     </p>
                                 </div>
                             </a>

                             <div className="flex items-center gap-3 p-3 bg-gray-50 dark:bg-gray-900 rounded-xl">
                                 <Clock className="h-5 w-5 text-gray-400" />
                                 <div>
                                     <p className="font-medium text-gray-900 dark:text-white">Horário</p>
                                     <p className="text-xs text-gray-500">
                                        {provider.opening_hours ? '09:00 - 18:00 (Seg a Sex)' : 'Horário a confirmar'}
                                     </p>
                                 </div>
                             </div>
                             {provider.website && (
                                <a href={provider.website} target="_blank" rel="noreferrer" className="flex items-center gap-3 p-3 bg-gray-50 dark:bg-gray-900 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors">
                                    <Globe className="h-5 w-5 text-gray-400" />
                                    <div>
                                        <p className="font-medium text-gray-900 dark:text-white">Site</p>
                                        <p className="text-xs text-blue-500 truncate max-w-[200px]">{provider.website}</p>
                                    </div>
                                </a>
                             )}
                        </div>
                    </div>
                </Tabs.Content>
                
                <Tabs.Content value="photos" className="outline-none animate-in fade-in slide-in-from-bottom-2 duration-300">
                    {photos.length > 0 ? (
                        <div className="grid grid-cols-2 gap-2">
                            {photos.map((photoUrl, i) => (
                                <div key={i} className="aspect-square bg-gray-100 dark:bg-gray-900 rounded-xl overflow-hidden group">
                                    <img 
                                        src={photoUrl} 
                                        alt={`Foto ${i + 1} de ${provider.name}`}
                                        className="w-full h-full object-cover transition-transform group-hover:scale-105"
                                    />
                                </div>
                            ))}
                        </div>
                    ) : (
                        <div className="flex flex-col items-center justify-center py-12 text-center bg-gray-50 dark:bg-gray-900 rounded-xl border border-dashed border-gray-200 dark:border-gray-800">
                             <div className="h-12 w-12 rounded-full bg-gray-100 dark:bg-gray-800 flex items-center justify-center mb-3">
                                 <span className="text-xl">📷</span>
                             </div>
                             <p className="text-sm font-medium text-gray-900 dark:text-white">Galeria em breve</p>
                             <p className="text-xs text-gray-500 max-w-[200px]">Estamos atualizando as fotos desta empresa.</p>
                        </div>
                    )}
                </Tabs.Content>

                <Tabs.Content value="reviews" className="outline-none animate-in fade-in slide-in-from-bottom-2 duration-300">
                    <div className="flex flex-col items-center justify-center py-12 text-center bg-gray-50 dark:bg-gray-900 rounded-xl border border-dashed border-gray-200 dark:border-gray-800">
                         <div className="h-12 w-12 rounded-full bg-gray-100 dark:bg-gray-800 flex items-center justify-center mb-3">
                             <span className="text-xl">💬</span>
                         </div>
                         <p className="text-sm font-medium text-gray-900 dark:text-white">Avaliações em breve</p>
                         <p className="text-xs text-gray-500 max-w-[200px]">Os comentários detalhados estarão disponíveis em breve.</p>
                    </div>
                </Tabs.Content>
            </Tabs.Root>

        </div>

        {/* Footer Actions */}
        <div className="p-4 border-t border-gray-100 dark:border-gray-800 bg-white dark:bg-gray-950 flex flex-col gap-2 z-20">
             {!provider.whatsapp && (
                 <p className="text-xs text-center text-red-500 font-medium">
                     Este prestador não possui WhatsApp cadastrado.
                 </p>
             )}
             <div className="flex gap-3">
                 <Button 
                    variant="outline" 
                    size="lg" 
                    className={`flex-1 gap-2 ${!provider.whatsapp ? 'border-gray-200 text-gray-400 cursor-not-allowed bg-gray-50' : 'border-green-500 text-green-600 hover:bg-green-50 dark:hover:bg-green-900/20'}`}
                    onClick={provider.whatsapp ? onWhatsAppClick : undefined}
                    disabled={!provider.whatsapp}
                 >
                     {provider.whatsapp ? <WhatsAppIcon className="h-5 w-5" /> : <X className="h-5 w-5" />}
                     {provider.whatsapp ? 'WhatsApp' : 'Sem WhatsApp'}
                 </Button>
                 <Button 
                    size="lg" 
                    className="flex-1 gap-2 bg-brand-blue hover:bg-brand-blue/90 text-white"
                    onClick={onPlatformClick}
                 >
                     <MessageSquare className="h-5 w-5" />
                     Chat
                 </Button>
             </div>
        </div>

      </div>
    </div>
  )
}

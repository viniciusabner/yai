import { useEffect, useState } from 'react'
import { useLocation } from 'react-router-dom'
import { MapPin } from 'lucide-react'
import { useSelectionStore } from '../../store/useSelectionStore'
import { getCities } from '../../services/cities.service'

export function SelectedCitiesBar() {
  const { selectedCities, openCityModal } = useSelectionStore()
  const [cityNames, setCityNames] = useState<string[]>([])
  const location = useLocation()
  const isHome = location.pathname === '/'

  useEffect(() => {
    if (selectedCities.length > 0) {
      getCities().then(cities => {
        const selected = cities.filter(c => selectedCities.includes(c.id)).map(c => c.name)
        setCityNames(selected)
      })
    } else {
      setCityNames([])
    }
  }, [selectedCities])

  if (location.pathname !== '/' && location.pathname !== '/results') return null

  return (
    <div className={`px-6 pt-2 pb-2 bg-white dark:bg-gray-900 border-b border-gray-100 dark:border-gray-800 shadow-sm z-30 ${isHome ? 'sticky top-16' : ''}`}>
      <button
        onClick={openCityModal}
        className="flex items-center gap-1.5 text-sm text-gray-600 dark:text-gray-300 cursor-pointer hover:text-blue-600 transition-colors group w-full text-left"
        title={cityNames.length > 0 ? `Buscando em: ${cityNames.join(', ')}` : 'Selecione as cidades'}
      >
        <MapPin className="h-4 w-4 flex-shrink-0 text-blue-500 group-hover:text-blue-600" />
        {cityNames.length > 0 ? (
          <div className="flex-1 min-w-0 flex items-center gap-1.5">
            <span className="font-medium truncate">
              Em {cityNames.join(', ')}
            </span>
            <span className="text-[10px] bg-blue-100 text-blue-700 dark:bg-blue-900/40 dark:text-blue-300 font-bold px-1.5 py-0.5 rounded-md flex-shrink-0 shadow-sm border border-blue-200 dark:border-blue-800">
              {cityNames.length}
            </span>
          </div>
        ) : (
          <span className="font-medium text-gray-700 dark:text-gray-300">Selecione onde buscar</span>
        )}
      </button>
    </div>
  )
}

import { useEffect, useState } from 'react'
import { ChevronDown, MapPin } from 'lucide-react'
import { useSelectionStore } from '../../store/useSelectionStore'
import { getCities, type City } from '../../services/cities.service'

export function CitySelect() {
  const [cities, setCities] = useState<City[]>([])
  const [loading, setLoading] = useState(true)
  const { selectedCity, setSelectedCity } = useSelectionStore()

  useEffect(() => {
    getCities()
      .then(setCities)
      .catch((err) => console.error('Failed to load cities', err))
      .finally(() => setLoading(false))
  }, [])

  return (
    <div className="relative">
      <MapPin className="absolute left-3 top-1/2 h-5 w-5 -translate-y-1/2 text-gray-400" />
      <select
        value={selectedCity}
        onChange={(e) => setSelectedCity(e.target.value)}
        disabled={loading}
        className="h-14 w-full appearance-none rounded-xl border border-gray-200 bg-white pl-10 pr-10 text-lg shadow-sm text-gray-900 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20 disabled:bg-gray-50"
      >
        <option value="" disabled>
          {loading ? 'Carregando cidades...' : 'Selecione sua cidade'}
        </option>
        {cities.map((city) => (
          <option key={city.id} value={city.id}>
            {city.name}
          </option>
        ))}
      </select>
      <ChevronDown className="absolute right-4 top-1/2 h-5 w-5 -translate-y-1/2 text-gray-400 pointer-events-none" />
    </div>
  )
}

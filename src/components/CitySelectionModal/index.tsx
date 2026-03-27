import { useEffect, useState } from 'react'
import { X, MapPin } from 'lucide-react'
import { useSelectionStore } from '../../store/useSelectionStore'
import { getCities, type City } from '../../services/cities.service'
import { Button } from '../Button'

export function CitySelectionModal() {
  const { isCityModalOpen, closeCityModal, toggleCity, selectedCities } = useSelectionStore()
  const [cities, setCities] = useState<City[]>([])

  useEffect(() => {
    getCities().then(setCities)
  }, [])

  if (!isCityModalOpen) return null

  return (
    <div className="fixed inset-0 z-[60] flex items-start justify-center bg-black/60 backdrop-blur-sm p-4 animate-in fade-in duration-200">
      <div className="w-full max-w-md bg-white rounded-2xl shadow-xl overflow-hidden animate-in slide-in-from-top-10 duration-200 max-h-[90vh] flex flex-col mt-4 sm:mt-10">
        <div className="p-6 pb-4 border-b border-gray-100 flex justify-between items-center bg-white sticky top-0 z-10">
          <div>
            <h2 className="text-xl font-bold text-gray-900 flex items-center gap-2">
              <MapPin className="h-5 w-5 text-blue-600" />
              Onde quer procurar?
            </h2>
            <p className="text-sm text-gray-500 mt-1">Selecione uma ou mais cidades</p>
          </div>
          <button
            onClick={closeCityModal}
            className="text-gray-400 hover:text-gray-600 transition-colors p-2 -mr-2 rounded-full hover:bg-gray-100"
          >
            <X className="h-6 w-6" />
          </button>
        </div>

        <div className="p-4 overflow-y-auto flex-1">
          <div className="space-y-3">
            {cities.map((city) => {
              const isSelected = selectedCities.includes(city.id)
              
              return (
                <label
                  key={city.id}
                  className={`flex flex-col p-4 rounded-xl border-2 transition-all cursor-pointer ${
                    isSelected 
                      ? 'border-blue-600 bg-blue-50/50' 
                      : 'border-gray-100 hover:border-gray-200 bg-white'
                  }`}
                >
                  <div className="flex items-center gap-3">
                    <div className={`w-6 h-6 rounded-md flex flex-shrink-0 items-center justify-center border transition-colors ${
                      isSelected 
                        ? 'bg-blue-600 border-blue-600' 
                        : 'border-gray-300 bg-white'
                    }`}>
                      {isSelected && <svg className="w-4 h-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" /></svg>}
                    </div>
                    <div className="flex flex-col">
                      <span className={`font-semibold text-base ${isSelected ? 'text-blue-900' : 'text-gray-900'}`}>
                        {city.name}
                      </span>
                      <span className="text-sm text-gray-500">São Paulo</span>
                    </div>
                  </div>
                  {/* Invisible checkbox for accessibility */}
                  <input
                    type="checkbox"
                    className="sr-only"
                    checked={isSelected}
                    onChange={() => toggleCity(city.id)}
                  />
                </label>
              )
            })}
          </div>
        </div>

        <div className="p-4 border-t border-gray-100 bg-gray-50 sticky bottom-0 z-10">
          <Button 
            onClick={closeCityModal} 
            className="w-full h-12 text-base font-semibold"
            disabled={selectedCities.length === 0}
          >
            {selectedCities.length === 0 
              ? 'Selecione pelo menos uma cidade' 
              : `Confirmar (${selectedCities.length} selecionada${selectedCities.length > 1 ? 's' : ''})`
            }
          </Button>
        </div>
      </div>
    </div>
  )
}

import { create } from 'zustand'

export type MacroSegment = 'home' | 'auto' | 'health' | 'pet' | 'education' | 'events' | 'sustainability' | 'digital';

interface SelectionState {
  macroSegment: MacroSegment
  setMacroSegment: (segment: MacroSegment) => void
  selectedCities: string[]
  selectedCategory: string | null
  selectedProviders: string[]
  isCityModalOpen: boolean
  isProfileModalOpen: boolean
  customMessage: string
  toggleCity: (cityId: string) => void
  setSelectedCategory: (category: string | null) => void
  setCustomMessage: (message: string) => void
  openCityModal: () => void
  closeCityModal: () => void
  openProfileModal: () => void
  closeProfileModal: () => void
  toggleProvider: (providerId: string) => void
  selectProviders: (providers: string[]) => void
  clearSelection: () => void
  clearCities: () => void
}

export const useSelectionStore = create<SelectionState>((set) => ({
  macroSegment: 'home',
  selectedCities: [],
  selectedCategory: null,
  selectedProviders: [],
  isCityModalOpen: false,
  isProfileModalOpen: false,
  customMessage: '',

  setMacroSegment: (segment) => set({ macroSegment: segment }),

  toggleCity: (id) =>
    set((state) => {
      const isSelected = state.selectedCities.includes(id)
      if (isSelected) {
        return { selectedCities: state.selectedCities.filter((c) => c !== id) }
      } else {
        return { selectedCities: [...state.selectedCities, id] }
      }
    }),
    
  clearCities: () => set({ selectedCities: [] }),

  setSelectedCategory: (category) => set({ selectedCategory: category }),
  setCustomMessage: (message) => set({ customMessage: message }),
  openCityModal: () => set({ isCityModalOpen: true }),
  closeCityModal: () => set({ isCityModalOpen: false }),
  openProfileModal: () => set({ isProfileModalOpen: true }),
  closeProfileModal: () => set({ isProfileModalOpen: false }),

  toggleProvider: (id) =>
    set((state) => {
      const isSelected = state.selectedProviders.includes(id)
      if (isSelected) {
        return { selectedProviders: state.selectedProviders.filter((p) => p !== id) }
      } else {
        return { selectedProviders: [...state.selectedProviders, id] }
      }
    }),
  
  selectProviders: (providers) => set({ selectedProviders: providers }),

  clearSelection: () => set({ selectedProviders: [] }),
}))

import { create } from 'zustand'
import { persist } from 'zustand/middleware'

export type MacroSegment = 'home' | 'auto' | 'health' | 'pet' | 'education' | 'events' | 'sustainability' | 'digital';

interface SelectionState {
  macroSegment: MacroSegment
  setMacroSegment: (segment: MacroSegment) => void
  selectedCities: string[]
  setCities: (cityIds: string[]) => void
  selectedCategory: string | null
  selectedProviders: string[]
  isCityModalOpen: boolean
  isProfileModalOpen: boolean
  customMessage: string
  pendingProviderClaim: { id: string; name: string; category: string } | null
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
  setPendingProviderClaim: (claim: { id: string; name: string; category: string } | null) => void
}

export const useSelectionStore = create<SelectionState>()(
  persist(
    (set) => ({
      macroSegment: 'home',
      selectedCities: [],
      selectedCategory: null,
      selectedProviders: [],
      isCityModalOpen: false,
      isProfileModalOpen: false,
      customMessage: '',
      pendingProviderClaim: null,

      setMacroSegment: (segment) => set({ macroSegment: segment }),
      setPendingProviderClaim: (claim) => set({ pendingProviderClaim: claim }),

      toggleCity: (id) =>
        set((state) => {
          const isSelected = state.selectedCities.includes(id)
          if (isSelected) {
            return { selectedCities: state.selectedCities.filter((c) => c !== id) }
          } else {
            return { selectedCities: [...state.selectedCities, id] }
          }
        }),
        
      setCities: (ids) => set({ selectedCities: ids }),

      clearCities: () => set({ selectedCities: [] }),

      setSelectedCategory: (category) => set((state) => {
        if (state.selectedCategory !== category) {
          return { selectedCategory: category, customMessage: '', selectedProviders: [] }
        }
        return { selectedCategory: category }
      }),
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
    }),
    {
      name: 'yai-selection-storage',
      partialize: (state) => ({
        selectedCities: state.selectedCities,
        macroSegment: state.macroSegment,
        selectedCategory: state.selectedCategory,
        selectedProviders: state.selectedProviders,
        customMessage: state.customMessage
      }),
    }
  )
)

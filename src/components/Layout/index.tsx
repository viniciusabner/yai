import { Outlet } from 'react-router-dom'
import { Header } from '../Header'
import { ToastProvider } from '../Toast'
import { Footer } from '../Footer'
import { SelectedCitiesBar } from './SelectedCitiesBar'
import { CitySelectionModal } from '../CitySelectionModal'

export function Layout() {
  return (
    <ToastProvider>
      <div className="min-h-screen flex flex-col w-full">
        <CitySelectionModal />
        <Header />
        <SelectedCitiesBar />
        <main className="flex-1 flex flex-col">
          <Outlet />
        </main>
        <Footer />
      </div>
    </ToastProvider>
  )
}

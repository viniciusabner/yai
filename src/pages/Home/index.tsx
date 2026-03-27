import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import {
  Search, MapPin,
  Home as HomeIcon, Car, Heart, Dog, BookOpen, PartyPopper, Leaf,
  Hammer, Waves, Wrench, Truck, Activity, Stethoscope, Scissors as ScissorsIcon, Monitor, Cpu, Sun, Bike
} from 'lucide-react'
import { useSelectionStore } from '../../store/useSelectionStore'
import { mergeAnonymousHistory } from '../../services/auth.service'
import { CATEGORIES } from '../../constants/categories'
import { supabase } from '../../services/supabase'

export function Home() {
  const navigate = useNavigate()
  const { selectedCities, setSelectedCategory, openCityModal, isCityModalOpen, macroSegment, setMacroSegment } = useSelectionStore()
  const [searchTerm, setSearchTerm] = useState('')
  const [pendingCategory, setPendingCategory] = useState<string | null>(null)
  const [isLogged, setIsLogged] = useState<boolean | null>(null)

  useEffect(() => {
    mergeAnonymousHistory()
    supabase.auth.getUser().then(({ data }) => setIsLogged(!!data.user))
  }, [])

  useEffect(() => {
    if (selectedCities.length > 0) {
      // Se havia uma categoria pendente, processa agora que as cidades foram selecionadas
      if (pendingCategory) {
        setSelectedCategory(pendingCategory)
        navigate('/results')
        setPendingCategory(null)
      }
    }
  }, [selectedCities, pendingCategory, setSelectedCategory, navigate])

  // Clear pending category if modal is closed without selecting a city
  useEffect(() => {
    if (!isCityModalOpen && selectedCities.length === 0) {
      setPendingCategory(null)
    }
  }, [isCityModalOpen, selectedCities])

  const handleSearch = () => {
    if (selectedCities.length === 0) {
      openCityModal()
      return
    }
    navigate('/results')
  }

  const handleCategoryClick = (categoryId: string) => {
    if (selectedCities.length === 0) {
      setPendingCategory(categoryId)
      openCityModal()
      return
    }

    setSelectedCategory(categoryId)
    navigate('/results')
  }

  const categories = CATEGORIES.filter(cat => cat.macroSegment === macroSegment);

  return (
    <div className="flex-1 flex flex-col bg-gray-50 dark:bg-gray-900 pb-20">

      {/* Hero Section */}
      <div className="px-6 pt-6 pb-2 text-center">
        <h4 className="text-xl font-bold text-[#0F0F96] dark:text-white leading-tight">
          Encontre empresas ou prestadores de serviços e fale com eles com mais facilidade.
        </h4>
      </div>

      {/* Search Bar Area */}
      <div className="px-6 py-2 max-w-2xl mx-auto">
        <div className="flex items-center gap-2 bg-white dark:bg-gray-800 p-2 rounded-2xl shadow-sm border border-gray-100 dark:border-gray-700">
          <Search className="h-5 w-5 text-gray-400 ml-2" />
          <input
            type="text"
            placeholder="O que você está procurando?"
            className="flex-1 bg-transparent border-none focus:ring-0 text-gray-900 dark:text-white placeholder-gray-400"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            onKeyDown={(e) => e.key === 'Enter' && handleSearch()}
          />
          <div 
            onClick={openCityModal}
            className="relative border-l border-gray-200 dark:border-gray-700 pl-2 cursor-pointer"
          >
            <MapPin className={`h-5 w-5 ${selectedCities.length > 0 ? 'text-green-600' : 'text-gray-400'}`} />
          </div>
        </div>
      </div>

      {/* Recrutamento de Profissionais CTA */}
      {isLogged !== true && (
        <div className="mt-4 px-6 max-w-7xl mx-auto">
          <div 
            onClick={() => navigate('/para-profissionais')}
            className="bg-gradient-to-r from-blue-600 to-indigo-700 rounded-3xl p-5 shadow-lg relative overflow-hidden cursor-pointer group hover:shadow-xl transition-all"
          >
            {/* Fundo abstrato/Glow */}
            <div className="absolute -top-10 -right-10 w-40 h-40 bg-white/10 rounded-full blur-3xl group-hover:bg-white/20 transition-all duration-500"></div>
            
            <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 relative z-10">
              <div>
                <h3 className="text-white font-bold text-lg leading-tight mb-1">
                  É profissional ou tem empresa?
                </h3>
                <p className="text-blue-100 text-sm max-w-md">
                  Anuncie seus serviços <strong className="text-yellow-400 font-bold">grátis</strong> e receba orçamentos diretamente no WhatsApp e no Chat Interno do Yai.
                </p>
              </div>
              <button className="whitespace-nowrap bg-yellow-400 hover:bg-yellow-300 text-indigo-900 font-bold py-2.5 px-6 rounded-xl transition-colors w-full sm:w-auto text-sm shadow-md">
                Criar Perfil Grátis
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Macro Segment Tabs (iFood Style) */}
      <div className="px-6 pb-4 mt-4 flex gap-3 overflow-x-auto hide-scrollbar md:justify-center md:flex-wrap max-w-7xl mx-auto w-full">
        <button 
          onClick={() => setMacroSegment('home')}
          className={`relative w-[120px] h-12 rounded-2xl p-2 flex flex-col justify-start overflow-hidden transition-all flex-shrink-0 border shadow-sm ${
            macroSegment === 'home' 
              ? 'border-blue-500 ring-1 ring-blue-500 bg-blue-50/50 dark:bg-blue-900/20' 
              : 'border-gray-100 bg-white dark:bg-gray-800 dark:border-gray-700 opacity-90 hover:opacity-100 hover:border-blue-200'
          }`}
        >
          <span className={`text-[13px] font-bold text-left z-10 leading-tight ${macroSegment === 'home' ? 'text-blue-800 dark:text-blue-400' : 'text-gray-800 dark:text-gray-200'}`}>
            Casa &<br/>Serviços
          </span>
          <div className="absolute -bottom-2 -right-2 w-12 h-12 bg-blue-100 dark:bg-blue-900/50 rounded-full flex items-center justify-center transform -rotate-12">
            <HomeIcon className="h-6 w-6 text-blue-600 dark:text-blue-400" />
          </div>
        </button>
        
        <button 
          onClick={() => setMacroSegment('auto')}
          className={`relative w-[120px] h-12 rounded-2xl p-2 flex flex-col justify-start overflow-hidden transition-all flex-shrink-0 border shadow-sm ${
            macroSegment === 'auto' 
              ? 'border-orange-500 ring-1 ring-orange-500 bg-orange-50/50 dark:bg-orange-900/20' 
              : 'border-gray-100 bg-white dark:bg-gray-800 dark:border-gray-700 opacity-90 hover:opacity-100 hover:border-orange-200'
          }`}
        >
          <span className={`text-[13px] font-bold text-left z-10 leading-tight ${macroSegment === 'auto' ? 'text-orange-800 dark:text-orange-400' : 'text-gray-800 dark:text-gray-200'}`}>
            Veículos &<br/>Mecânica
          </span>
          <div className="absolute -bottom-2 -right-2 w-12 h-12 bg-orange-100 dark:bg-orange-900/50 rounded-full flex items-center justify-center transform rotate-12">
            <Car className="h-6 w-6 text-orange-600 dark:text-orange-400" />
          </div>
        </button>

        <button 
          onClick={() => setMacroSegment('health')}
          className={`relative w-[120px] h-12 rounded-2xl p-2 flex flex-col justify-start overflow-hidden transition-all flex-shrink-0 border shadow-sm ${
            macroSegment === 'health' 
              ? 'border-rose-500 ring-1 ring-rose-500 bg-rose-50/50 dark:bg-rose-900/20' 
              : 'border-gray-100 bg-white dark:bg-gray-800 dark:border-gray-700 opacity-90 hover:opacity-100 hover:border-rose-200'
          }`}
        >
          <span className={`text-[13px] font-bold text-left z-10 leading-tight ${macroSegment === 'health' ? 'text-rose-800 dark:text-rose-400' : 'text-gray-800 dark:text-gray-200'}`}>
            Saúde &<br/>Bem-Estar
          </span>
          <div className="absolute -bottom-2 -right-2 w-12 h-12 bg-rose-100 dark:bg-rose-900/50 rounded-full flex items-center justify-center transform -rotate-12">
            <Heart className="h-5 w-5 text-rose-600 dark:text-rose-400" />
          </div>
        </button>

        <button 
          onClick={() => setMacroSegment('pet')}
          className={`relative w-[120px] h-12 rounded-2xl p-2 flex flex-col justify-start overflow-hidden transition-all flex-shrink-0 border shadow-sm ${
            macroSegment === 'pet' 
              ? 'border-teal-500 ring-1 ring-teal-500 bg-teal-50/50 dark:bg-teal-900/20' 
              : 'border-gray-100 bg-white dark:bg-gray-800 dark:border-gray-700 opacity-90 hover:opacity-100 hover:border-teal-200'
          }`}
        >
          <span className={`text-[13px] font-bold text-left z-10 leading-tight ${macroSegment === 'pet' ? 'text-teal-800 dark:text-teal-400' : 'text-gray-800 dark:text-gray-200'}`}>
           Mundo<br/>Pet
          </span>
          <div className="absolute -bottom-2 -right-2 w-12 h-12 bg-teal-100 dark:bg-teal-900/50 rounded-full flex items-center justify-center transform rotate-12">
            <Dog className="h-5 w-5 text-teal-600 dark:text-teal-400" />
          </div>
        </button>

        <button 
          onClick={() => setMacroSegment('education')}
          className={`relative w-[120px] h-12 rounded-2xl p-2 flex flex-col justify-start overflow-hidden transition-all flex-shrink-0 border shadow-sm ${
            macroSegment === 'education' 
              ? 'border-emerald-500 ring-1 ring-emerald-500 bg-emerald-50/50 dark:bg-emerald-900/20' 
              : 'border-gray-100 bg-white dark:bg-gray-800 dark:border-gray-700 opacity-90 hover:opacity-100 hover:border-emerald-200'
          }`}
        >
          <span className={`text-[13px] font-bold text-left z-10 leading-tight ${macroSegment === 'education' ? 'text-emerald-800 dark:text-emerald-400' : 'text-gray-800 dark:text-gray-200'}`}>
           Educação &<br/>Cursos
          </span>
          <div className="absolute -bottom-2 -right-2 w-12 h-12 bg-emerald-100 dark:bg-emerald-900/50 rounded-full flex items-center justify-center transform -rotate-12">
            <BookOpen className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
          </div>
        </button>

        <button 
          onClick={() => setMacroSegment('events')}
          className={`relative w-[120px] h-12 rounded-2xl p-2 flex flex-col justify-start overflow-hidden transition-all flex-shrink-0 border shadow-sm ${
            macroSegment === 'events' 
              ? 'border-indigo-500 ring-1 ring-indigo-500 bg-indigo-50/50 dark:bg-indigo-900/20' 
              : 'border-gray-100 bg-white dark:bg-gray-800 dark:border-gray-700 opacity-90 hover:opacity-100 hover:border-indigo-200'
          }`}
        >
          <span className={`text-[13px] font-bold text-left z-10 leading-tight ${macroSegment === 'events' ? 'text-indigo-800 dark:text-indigo-400' : 'text-gray-800 dark:text-gray-200'}`}>
           Festas &<br/>Eventos
          </span>
          <div className="absolute -bottom-2 -right-2 w-12 h-12 bg-indigo-100 dark:bg-indigo-900/50 rounded-full flex items-center justify-center transform -rotate-12">
            <PartyPopper className="h-5 w-5 text-indigo-600 dark:text-indigo-400" />
          </div>
        </button>

        <button 
          onClick={() => setMacroSegment('sustainability')}
          className={`relative w-[120px] h-12 rounded-2xl p-2 flex flex-col justify-start overflow-hidden transition-all flex-shrink-0 border shadow-sm ${
            macroSegment === 'sustainability' 
              ? 'border-emerald-600 ring-1 ring-emerald-600 bg-emerald-50/50 dark:bg-emerald-900/20' 
              : 'border-gray-100 bg-white dark:bg-gray-800 dark:border-gray-700 opacity-90 hover:opacity-100 hover:border-emerald-200'
          }`}
        >
          <span className={`text-[13px] font-bold text-left z-10 leading-tight ${macroSegment === 'sustainability' ? 'text-emerald-800 dark:text-emerald-400' : 'text-gray-800 dark:text-gray-200'}`}>
           Sustentab. &<br/>Mobilidade
          </span>
          <div className="absolute -bottom-2 -right-2 w-12 h-12 bg-emerald-100 dark:bg-emerald-900/50 rounded-full flex items-center justify-center transform rotate-12">
            <Leaf className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
          </div>
        </button>
      </div>

      {/* Banners Carousel */}
      <div className="mt-6 px-6 pb-4 overflow-x-auto hide-scrollbar max-w-7xl mx-auto w-full">
        <div className="flex md:grid md:grid-cols-2 lg:grid-cols-3 gap-4 md:gap-6 w-max md:w-full">
          {macroSegment === 'home' && (
            <>
              {/* Main Banner */}
              <div
                onClick={() => handleCategoryClick('imobiliaria')}
                className="w-72 md:w-full h-40 rounded-3xl bg-cover bg-center relative overflow-hidden shadow-lg cursor-pointer group"
                style={{ backgroundImage: 'url(https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=800&q=80)' }}
              >
                <div className="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent flex items-end p-5">
                  <div className="flex items-center gap-2">
                    <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                      <HomeIcon className="h-5 w-5" />
                    </div>
                    <span className="text-white font-bold text-lg">Imobiliárias</span>
                  </div>
                </div>
              </div>

              {/* Third Banner - Reformas */}
              <div
                onClick={() => handleCategoryClick('pedreiro')}
                className="w-72 md:w-full h-40 rounded-3xl bg-cover bg-center relative overflow-hidden shadow-lg cursor-pointer group"
                style={{ backgroundImage: 'url(https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=800&q=80)' }}
              >
                <div className="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent flex items-end p-5">
                  <div className="flex items-center gap-2">
                    <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                      <Hammer className="h-5 w-5" />
                    </div>
                    <span className="text-white font-bold text-lg">Reformas & Obras</span>
                  </div>
                </div>
              </div>

              {/* Fourth Banner - Desentupidoras */}
              <div
                onClick={() => handleCategoryClick('desentupidora')}
                className="w-72 md:w-full h-40 rounded-3xl bg-cover bg-center relative overflow-hidden shadow-lg cursor-pointer group"
                style={{ backgroundImage: 'url(https://images.unsplash.com/photo-1585704032915-c3400ca199e7?w=800&q=80)' }}
              >
                <div className="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent flex items-end p-5">
                  <div className="flex items-center gap-2">
                    <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                      <Waves className="h-5 w-5" />
                    </div>
                    <span className="text-white font-bold text-lg">Desentupidoras</span>
                  </div>
                </div>
              </div>
            </>
          )}

          {macroSegment === 'auto' && (
            <>
              {/* Auto Banner 1 - Lojas */}
              <button
                onClick={() => handleCategoryClick('automoveis')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300 delay-150"
              >
                <div className="absolute inset-0 bg-teal-900/60 z-10 transition-colors group-hover:bg-teal-900/70" />
                <img src="https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=800&q=80" alt="Compre seu Carro" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Car className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Compre seu Carro</span>
                </div>
              </button>
              {/* Auto Banner 2 - Mecânica */}
              <button
                onClick={() => handleCategoryClick('mecanica')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300"
              >
                <div className="absolute inset-0 bg-slate-900/60 z-10 transition-colors group-hover:bg-slate-900/70" />
                <img src="https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?w=800&q=80" alt="Oficinas de Confiança" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Wrench className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Oficinas de Confiança</span>
                </div>
              </button>

              {/* Auto Banner 3 - Guincho */}
              <button
                onClick={() => handleCategoryClick('guincho')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300 delay-75"
              >
                <div className="absolute inset-0 bg-orange-900/60 z-10 transition-colors group-hover:bg-orange-900/70" />
                <img src="https://images.unsplash.com/photo-1532288075304-4c4eff15f33a?w=800&q=80" alt="SOS Guincho" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Truck className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">SOS Guincho 24h</span>
                </div>
              </button>
            </>
          )}

          {macroSegment === 'health' && (
            <>
              {/* Health Banner 1 - Terapias */}
              <button
                onClick={() => handleCategoryClick('psicologia')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300 delay-150"
              >
                <div className="absolute inset-0 bg-rose-900/60 z-10 transition-colors group-hover:bg-rose-900/70" />
                <img src="https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=800&q=80" alt="Terapias" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Heart className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Cuidando da Mente</span>
                </div>
              </button>
              {/* Health Banner 2 - Fitness */}
              <button
                onClick={() => handleCategoryClick('personal_trainer')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300"
              >
                <div className="absolute inset-0 bg-emerald-900/60 z-10 transition-colors group-hover:bg-emerald-900/70" />
                <img src="https://images.unsplash.com/photo-1540420773420-3366772f4999?w=800&q=80" alt="Bem Estar" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Activity className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Vida Saudável</span>
                </div>
              </button>

              {/* Health Banner 3 - Clínicas */}
              <button
                onClick={() => handleCategoryClick('odontologia')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300 delay-75"
              >
                <div className="absolute inset-0 bg-cyan-900/60 z-10 transition-colors group-hover:bg-cyan-900/70" />
                <img src="https://images.unsplash.com/photo-1584515933487-779d40e1322b?w=800&q=80" alt="Clínicas" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Stethoscope className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Especialidades</span>
                </div>
              </button>
            </>
          )}

          {macroSegment === 'pet' && (
            <>
              {/* Pet Banner 1 - Banho */}
              <button
                onClick={() => handleCategoryClick('banho_tosa')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300 delay-150"
              >
                <div className="absolute inset-0 bg-amber-900/60 z-10 transition-colors group-hover:bg-amber-900/70" />
                <img src="https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?w=800&q=80" alt="Banho e Tosa" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <ScissorsIcon className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Banho e Tosa</span>
                </div>
              </button>
              {/* Pet Banner 2 - Vet */}
              <button
                onClick={() => handleCategoryClick('veterinario')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300"
              >
                <div className="absolute inset-0 bg-blue-900/60 z-10 transition-colors group-hover:bg-blue-900/70" />
                <img src="https://images.unsplash.com/photo-1628009368231-7bb7cbcb8127?w=800&q=80" alt="Veterinários" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Stethoscope className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Clínica Veterinária</span>
                </div>
              </button>

              {/* Pet Banner 3 - Creche */}
              <button
                onClick={() => handleCategoryClick('hotel_pet')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300 delay-75"
              >
                <div className="absolute inset-0 bg-teal-900/60 z-10 transition-colors group-hover:bg-teal-900/70" />
                <img src="https://images.unsplash.com/photo-1587300003388-59208cb962cd?w=800&q=80" alt="Hotel e Creche" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Dog className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Hotéis & Creches</span>
                </div>
              </button>
            </>
          )}

          {macroSegment === 'digital' && (
            <>
              {/* Digital Banner 1 - Digital */}
              <button
                onClick={() => handleCategoryClick('gestao_trafego')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300 delay-75"
              >
                <div className="absolute inset-0 bg-blue-900/60 z-10 transition-colors group-hover:bg-blue-900/70" />
                <img src="https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&q=80" alt="Digital" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Monitor className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Publicidade e Marketing</span>
                </div>
              </button>
            </>
          )}

          {macroSegment === 'education' && (
            <>
              {/* Education Banner 1 - Cursos */}
              <button
                onClick={() => handleCategoryClick('idiomas')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300"
              >
                <div className="absolute inset-0 bg-emerald-900/60 z-10 transition-colors group-hover:bg-emerald-900/70" />
                <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800&q=80" alt="Cursos" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <BookOpen className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Escolas de Idiomas</span>
                </div>
              </button>

              {/* Education Banner 2 - Técnicos */}
              <button
                onClick={() => handleCategoryClick('cursos_profissionalizantes')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300 delay-75"
              >
                <div className="absolute inset-0 bg-blue-900/60 z-10 transition-colors group-hover:bg-blue-900/70" />
                <img src="https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&q=80" alt="Digital" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Cpu className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Cursos Técnicos</span>
                </div>
              </button>
            </>
          )}

          {macroSegment === 'events' && (
            <>
              {/* Events Banner 1 - Decoração */}
              <button
                onClick={() => handleCategoryClick('decoracao_festas')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300"
              >
                <div className="absolute inset-0 bg-indigo-900/60 z-10 transition-colors group-hover:bg-indigo-900/70" />
                <img src="https://images.unsplash.com/photo-1530103043960-ef38714abb15?w=800&q=80" alt="Decoração" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <PartyPopper className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Tudo para sua Festa</span>
                </div>
              </button>
            </>
          )}

          {macroSegment === 'sustainability' && (
            <>
              {/* Sustainability Banner 1 - Energia Solar */}
              <button
                onClick={() => handleCategoryClick('energia_solar')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300"
              >
                <div className="absolute inset-0 bg-yellow-900/60 z-10 transition-colors group-hover:bg-yellow-900/70" />
                <img src="https://images.unsplash.com/photo-1509391366360-fe5bb65858ea?w=800&q=80" alt="Energia Solar" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Sun className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Energia Solar Agora</span>
                </div>
              </button>

              {/* Sustainability Banner 2 - Bicicletas */}
              <button
                onClick={() => handleCategoryClick('reparo_bicicletas')}
                className="snap-start shrink-0 relative w-64 md:w-full h-32 rounded-2xl overflow-hidden group animate-in fade-in duration-300 delay-75"
              >
                <div className="absolute inset-0 bg-emerald-900/60 z-10 transition-colors group-hover:bg-emerald-900/70" />
                <img src="https://images.unsplash.com/photo-1485965120184-e220f15ef923?w=800&q=80" alt="Bicicletas" className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" />
                <div className="absolute flex items-end gap-2 bottom-3 left-4 z-20 text-white font-bold truncate pr-4 text-sm w-full">
                  <div className="bg-white/20 backdrop-blur-md p-1.5 rounded-lg text-white">
                    <Bike className="h-5 w-5" />
                  </div>
                  <span className="truncate drop-shadow-md">Oficina de Bikes</span>
                </div>
              </button>
            </>
          )}
        </div>
      </div>

      <div className="mt-8 px-6 min-h-[300px] max-w-7xl mx-auto">
        <h2 className="text-lg font-bold text-gray-900 dark:text-white mb-4">
          {macroSegment === 'home' && 'Serviços para Casa'}
          {macroSegment === 'auto' && 'Serviços Automotivos'}
          {macroSegment === 'health' && 'Bem-Estar & Saúde'}
          {macroSegment === 'pet' && 'Mundo Pet'}
          {macroSegment === 'education' && 'Educação & Cursos'}
          {macroSegment === 'events' && 'Festas & Eventos'}
          {macroSegment === 'sustainability' && 'Sustentabilidade & Mobilidade'}
        </h2>
        
        <div className="grid grid-cols-3 md:grid-cols-4 lg:grid-cols-6 xl:grid-cols-8 gap-4" key={macroSegment}>
          {categories.map((cat, index) => (
            <button
              key={cat.id}
              onClick={() => handleCategoryClick(cat.id)}
              className={`flex flex-col items-center gap-2 p-3 rounded-2xl transition-all duration-300 hover:scale-105 active:scale-95 cursor-pointer animate-in zoom-in-95 fade-in relative`}
              style={{ animationDelay: `${index * 25}ms` }}
            >
              <div className={`h-14 w-14 rounded-2xl ${cat.bg} flex items-center justify-center shadow-sm`}>
                <cat.icon className={`h-7 w-7 ${cat.color}`} />
              </div>
              <span className="text-xs font-medium text-gray-600 dark:text-gray-400 text-center leading-tight">
                {cat.name}
              </span>
            </button>
          ))}
        </div>
      </div>
    </div>
  )
}

import { useState, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { LogOut, LogIn, UserPlus, Sun, Moon, MessageSquare, Store } from 'lucide-react'
import { supabase } from '../../services/supabase'
import { Button } from '../Button'
import { useTheme } from '../../hooks/useTheme'
import { Logo } from '../Logo'
import { CompleteProfileModal } from '../CompleteProfileModal'
import { CompanyProfileModal } from '../CompanyProfileModal'
import { useSelectionStore } from '../../store/useSelectionStore'
import { CITIES } from '../../constants/cities'

export function Header() {
  const navigate = useNavigate()
  const { isDark, toggleTheme } = useTheme()
  const { isProfileModalOpen, openProfileModal, closeProfileModal } = useSelectionStore()
  const [user, setUser] = useState<any>(null)
  const [showMenu, setShowMenu] = useState(false)
  const [myProvider, setMyProvider] = useState<any>(null)
  const [showMyAdModal, setShowMyAdModal] = useState(false)

  // Listen to Auth State
  useEffect(() => {
    // Check initial user
    supabase.auth.getUser().then(({ data }) => {
      setUser(data.user)
      checkOnboarding(data.user?.id)
    })

    // Subscribe to changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null)
      if (session?.user) checkOnboarding(session.user.id)
    })

    return () => subscription.unsubscribe()
  }, [])

  const checkOnboarding = async (userId: string | undefined) => {
      if (!userId) return
      const { data } = await supabase.from('profiles').select('onboarding_completed, role').eq('id', userId).single()
      
      // If onboarding_completed is FALSE (or null), show modal
      if (data && data.onboarding_completed === false) {
          openProfileModal()
      }

      if (data && data.role === 'provider') {
          const { data: providerData } = await supabase.from('providers').select('*').eq('owner_id', userId).single()
          if (providerData) setMyProvider(providerData)
      }
  }

  const handleLogout = async () => {
    await supabase.auth.signOut()
    setShowMenu(false)
    navigate('/')
  }
  const [unreadCount, setUnreadCount] = useState(0)

  // Poll unread count
  useEffect(() => {
    if (!user) return
    
    // Initial fetch
    import('../../services/messaging.service').then(({ getUnreadCount }) => {
        getUnreadCount().then(setUnreadCount)
    })

    const interval = setInterval(() => {
        import('../../services/messaging.service').then(({ getUnreadCount }) => {
            getUnreadCount().then(setUnreadCount)
        })
    }, 10000)

    return () => clearInterval(interval)
  }, [user])

  return (
    <header className="sticky top-0 z-50 w-full border-b border-gray-200 dark:border-gray-800 bg-[#f7f7f7] dark:bg-gray-900 transition-colors duration-300">
      <div className="mx-auto flex h-16 max-w-7xl items-center justify-between px-4 sm:px-6 lg:px-8">
        
        {/* Left: Logo */}
        <div className="flex items-center">
          <Link to="/" className="flex items-center">
            <Logo variant={isDark ? 'dark-yellow' : 'yellow'} />
          </Link>
        </div>

        {/* Right: Auth & Theme */}
        <div className="flex items-center gap-2 md:gap-4">
          
          <button 
            onClick={() => user ? navigate('/inbox') : navigate('/login')}
            className="p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors text-main relative"
            title="Minhas Mensagens"
          >
            <MessageSquare className="h-5 w-5" />
            {unreadCount > 0 && (
                <span className="absolute top-0 right-0 h-4 w-4 bg-red-500 rounded-full text-[10px] text-white flex items-center justify-center font-bold animate-pulse">
                    {unreadCount > 9 ? '9+' : unreadCount}
                </span>
            )}
          </button>

          <button 
            onClick={toggleTheme}
            className="p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors text-main"
            title={isDark ? "Modo Claro" : "Modo Escuro"}
          >
            {isDark ? <Sun className="h-5 w-5" /> : <Moon className="h-5 w-5" />}
          </button>

          {user ? (
            <div className="relative">
              <button 
                onClick={() => setShowMenu(!showMenu)}
                className="flex items-center gap-2 rounded-full p-1 hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
              >
                 <div className="h-8 w-8 rounded-full bg-brand-yellow/20 text-brand-blue dark:text-brand-yellow dark:bg-brand-blue flex items-center justify-center font-bold border border-brand-yellow/30">
                    {user.user_metadata?.full_name?.charAt(0).toUpperCase() || user.email?.charAt(0).toUpperCase()}
                 </div>
              </button>
              
              {showMenu && (
                <div className="absolute right-0 mt-2 w-48 origin-top-right rounded-md bg-white dark:bg-gray-800 py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none animate-in fade-in zoom-in-95 duration-100">
                  <div className="px-4 py-2 text-xs text-gray-500 dark:text-gray-400 border-b border-gray-100 dark:border-gray-800 mb-1">
                    Logado como<br/>
                    <span className="font-medium text-main truncate block">{user.email}</span>
                  </div>
                  
                  {myProvider && (
                    <button
                      onClick={() => {
                          setShowMyAdModal(true)
                          setShowMenu(false)
                      }}
                      className="flex w-full items-center px-4 py-2 text-sm text-brand-blue dark:text-brand-yellow hover:bg-gray-50 dark:hover:bg-gray-800 font-medium"
                    >
                      <Store className="mr-2 h-4 w-4" />
                      Visualizar Vitrine
                    </button>
                  )}
                  
                  <button
                    onClick={() => {
                        openProfileModal()
                        setShowMenu(false)
                    }}
                    className="flex w-full items-center px-4 py-2 text-sm text-main hover:bg-gray-50 dark:hover:bg-gray-800"
                  >
                    <UserPlus className="mr-2 h-4 w-4" />
                    Editar Perfil
                  </button>

                  <button
                    onClick={handleLogout}
                    className="flex w-full items-center px-4 py-2 text-sm text-main hover:bg-gray-50 dark:hover:bg-gray-800"
                  >
                    <LogOut className="mr-2 h-4 w-4" />
                    Sair
                  </button>
                </div>
              )}

              {/* Profile Completion Check */}
              <CompleteProfileModal 
                userId={user.id} 
                isOpen={isProfileModalOpen}
                onClose={closeProfileModal}
              />

              {/* My Ad Preview Modal */}
              {myProvider && (
                <CompanyProfileModal 
                  isOpen={showMyAdModal}
                  onClose={() => setShowMyAdModal(false)}
                  provider={myProvider}
                  onWhatsAppClick={() => {}}
                  onPlatformClick={() => {}}
                  cityName={CITIES.find(c => c.id === myProvider.city_slug)?.name || 'Sua cidade'}
                />
              )}
            </div>
          ) : (
             <div className="flex items-center gap-2">
               {/* Mobile: Icons */}
               <div className="flex sm:hidden items-center gap-1">
                 <Button variant="ghost" size="sm" onClick={() => navigate('/login')} className="px-2 text-main" title="Entrar">
                   <LogIn className="h-5 w-5" />
                 </Button>
                 <Button variant="ghost" size="sm" onClick={() => navigate('/register')} className="px-2 text-brand-blue dark:text-brand-yellow" title="Cadastrar">
                   <UserPlus className="h-5 w-5" />
                 </Button>
               </div>

               {/* Desktop: Text Buttons */}
               <div className="hidden sm:flex items-center gap-2">
                 <Button variant="ghost" onClick={() => navigate('/login')} className="text-main hover:text-brand-blue/80">
                   Entrar
                 </Button>
                 <Button onClick={() => navigate('/register')} className="bg-brand-yellow hover:bg-brand-yellow/90 text-brand-blue font-semibold">
                   Cadastrar
                 </Button>
               </div>
             </div>
          )}
        </div>
      </div>
    </header>
  )
}


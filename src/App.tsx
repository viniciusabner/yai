import { useEffect } from 'react'
import { Router } from './app/router'
import { supabase } from './services/supabase'

function App() {
  useEffect(() => {
    const { data: { subscription } } = supabase.auth.onAuthStateChange((event, session) => {
      if (event === 'SIGNED_IN' && session) {
        const redirect = localStorage.getItem('yai-redirect-after-login')
        if (redirect) {
          localStorage.removeItem('yai-redirect-after-login')
          
          let redirectPath = redirect
          // @ts-ignore
          const baseRoute = import.meta.env.BASE_URL
          
          if (baseRoute !== '/' && !redirectPath.startsWith(baseRoute)) {
             const cleanRedirect = redirectPath.startsWith('/') ? redirectPath.substring(1) : redirectPath
             redirectPath = `${baseRoute}${cleanRedirect}`
          }

          window.location.href = redirectPath
        }
      }
    })

    return () => {
      subscription.unsubscribe()
    }
  }, [])

  return <Router />
}

export default App

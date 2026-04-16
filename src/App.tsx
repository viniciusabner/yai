import { useEffect, useState } from 'react'
import { Router } from './app/router'
import { supabase } from './services/supabase'
import { checkEmailProviderMatch } from './services/claim.service'
import { useSelectionStore } from './store/useSelectionStore'

function App() {
  const setPendingProviderClaim = useSelectionStore((s) => s.setPendingProviderClaim)
  const [user, setUser] = useState<any>(null)

  useEffect(() => {
    console.log('[APP_DEBUG] Initializing auth...')
    
    // Initial session
    supabase.auth.getSession().then(({ data: { session } }) => {
      console.log('[APP_DEBUG] Initial session:', session?.user?.email)
      setUser(session?.user ?? null)
    })

    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
      console.log('[APP_DEBUG] Auth Event:', event, session?.user?.email)
      setUser(session?.user ?? null)

      if (event === 'SIGNED_IN' && session) {
        // Handle redirect queue (only on SIGNED_IN event to avoid loops)
        const redirect = localStorage.getItem('yai-redirect-after-login')
        if (redirect) {
          console.log('[APP_DEBUG] Redirect found, preparing to jump to:', redirect)
          localStorage.removeItem('yai-redirect-after-login')
          
          let redirectPath = redirect
          // @ts-ignore
          const baseRoute = import.meta.env.BASE_URL
          
          if (baseRoute !== '/' && !redirectPath.startsWith(baseRoute)) {
             const cleanRedirect = redirectPath.startsWith('/') ? redirectPath.substring(1) : redirectPath
             redirectPath = `${baseRoute}${cleanRedirect}`
          }

          console.log('[APP_DEBUG] Executing redirect...')
          window.location.href = redirectPath
        }
      }
    })

    return () => {
      subscription.unsubscribe()
    }
  }, [])

  // Seperate effect for Claim Check to avoid blocking the Auth Event loop
  useEffect(() => {
    if (user?.email) {
      console.log('[APP_DEBUG] User email detected, checking provider matches...')
      checkEmailProviderMatch(user.email).then(match => {
        if (match) {
          console.log('[APP_DEBUG] Match found! Setting pending claim.')
          setPendingProviderClaim({ id: match.id, name: match.name, category: match.category })
        }
      }).catch(err => console.error('[APP_DEBUG] Claim check error:', err))
    }
  }, [user?.email, setPendingProviderClaim])

  return <Router />
}

export default App

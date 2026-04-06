import { useState, useEffect } from 'react'
import { Link, useNavigate, useLocation } from 'react-router-dom'
import { ArrowLeft, AlertCircle } from 'lucide-react'
import { signInWithGoogle, signInWithPassword } from '../../services/auth.service'
import { Button } from '../../components/Button'

export function Login() {
  const navigate = useNavigate()
  const location = useLocation()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [rememberMe, setRememberMe] = useState(true)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [infoMessage, setInfoMessage] = useState('')

  useEffect(() => {
    if (location.state?.message) {
      setInfoMessage(location.state.message)
    }
  }, [location.state])

  // ... rest of logic ...

  const stateFrom = location.state?.from
  const from = (typeof stateFrom === 'string' ? stateFrom : stateFrom?.pathname) || '/'

  // ... rest of logic ...

  const handleGoogleLogin = async () => {
    try {
      setLoading(true)
      await signInWithGoogle()
      navigate(from, { replace: true })
    } catch (err: any) {
      setError(err.message)
      setLoading(false)
    }
  }

  const handleEmailLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    try {
      setLoading(true)
      setError('')
      await signInWithPassword(email, password, rememberMe)
      
      // Merge history if needed?
      // await mergeAnonymousHistory() // Assuming this is desirable
      
      navigate(from, { replace: true })
    } catch (err: any) {
      setError(err.message)
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 dark:bg-gray-900 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <div className="flex justify-center mb-6">
           <button onClick={() => navigate('/')} className="p-2 rounded-full bg-white dark:bg-gray-800 shadow-sm hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
             <ArrowLeft className="h-6 w-6 text-gray-500 dark:text-gray-400" />
           </button>
        </div>
        <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900 dark:text-white">
          Entre na sua conta
        </h2>
        <p className="mt-2 text-center text-sm text-gray-600 dark:text-gray-400">
          Ou{' '}
          <Link to="/register" className="font-medium text-green-600 hover:text-green-500 dark:text-green-500 dark:hover:text-green-400">
            crie uma nova conta
          </Link>
        </p>

        {infoMessage && (
          <div className="mt-6 rounded-md bg-blue-50 dark:bg-blue-900/20 p-4 border border-blue-200 dark:border-blue-800/50">
            <div className="flex">
              <div className="flex-shrink-0">
                <AlertCircle className="h-5 w-5 text-blue-400 dark:text-blue-500" aria-hidden="true" />
              </div>
              <div className="ml-3">
                <h3 className="text-sm font-medium text-blue-800 dark:text-blue-300">{infoMessage}</h3>
              </div>
            </div>
          </div>
        )}
      </div>

      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white dark:bg-gray-800 py-8 px-4 shadow sm:rounded-lg sm:px-10 space-y-6">
          
          <Button 
            fullWidth 
            variant="outline"
            onClick={handleGoogleLogin}
            className="flex justify-center items-center gap-2 dark:text-gray-200 dark:border-gray-600 dark:hover:bg-gray-700"
          >
            <svg className="h-5 w-5" aria-hidden="true" viewBox="0 0 24 24">
              <path
                d="M12.0003 20.41c1.6601 0 3.32-.42 5.03-1.42 2.37-1.37 3.97-4.04 3.97-7H12v4.06h4.55c-.2 1.07-.76 2.05-1.57 2.76-.85.73-1.93 1.15-3.1 1.15-2.22 0-4.03-1.51-4.72-3.56-.16-.5-.25-1.04-.25-1.59 0-.55.09-1.09.25-1.59.69-2.05 2.5-3.56 4.72-3.56 1.14 0 2.18.39 3.01 1.04l2.97-2.92c-1.74-1.55-4.05-2.43-5.98-2.43-4.5 0-8.38 3.12-9.75 7.17-.32.96-.5 1.98-.5 3.03 0 1.05.18 2.07.5 3.03 1.37 4.05 5.25 7.17 9.75 7.17z"
                fill="currentColor"
              />
            </svg>
            Entrar com Google
          </Button>

          <div className="relative">
            <div className="absolute inset-0 flex items-center">
              <div className="w-full border-t border-gray-300 dark:border-gray-600" />
            </div>
            <div className="relative flex justify-center text-sm">
              <span className="px-2 bg-white dark:bg-gray-800 text-gray-500 dark:text-gray-400">Ou use seu email</span>
            </div>
          </div>

          <form className="space-y-6" onSubmit={handleEmailLogin}>
            <div>
              <label htmlFor="email" className="block text-sm font-medium text-gray-700 dark:text-gray-300">
                Email
              </label>
              <div className="mt-1">
                <input
                  id="email"
                  name="email"
                  type="email"
                  autoComplete="email"
                  required
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-md shadow-sm placeholder-gray-400 dark:placeholder-gray-500 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-green-500 focus:border-green-500 sm:text-sm"
                />
              </div>
            </div>

            <div>
              <label htmlFor="password" className="block text-sm font-medium text-gray-700 dark:text-gray-300">
                Senha
              </label>
              <div className="mt-1">
                <input
                  id="password"
                  name="password"
                  type="password"
                  autoComplete="current-password"
                  required
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-md shadow-sm placeholder-gray-400 dark:placeholder-gray-500 bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-green-500 focus:border-green-500 sm:text-sm"
                />
              </div>
            </div>

            <div className="flex items-center justify-between">
              <div className="flex items-center">
                <input
                  id="remember-me"
                  name="remember-me"
                  type="checkbox"
                  className="h-4 w-4 text-green-600 focus:ring-green-500 border-gray-300 dark:border-gray-600 rounded bg-white dark:bg-gray-700"
                  checked={rememberMe}
                  onChange={(e) => setRememberMe(e.target.checked)}
                />
                <label htmlFor="remember-me" className="ml-2 block text-sm text-gray-900 dark:text-gray-300">
                  Lembrar de mim
                </label>
              </div>

              <div className="text-sm">
                <a onClick={() => navigate('/reset-password')} className="font-medium text-green-600 hover:text-green-500 dark:text-green-500 dark:hover:text-green-400 cursor-pointer">
                  Esqueceu sua senha?
                </a>
              </div>
            </div>

            {error && (
              <div className="rounded-md bg-red-50 dark:bg-red-900/20 p-4 border border-red-200 dark:border-red-800/50">
                <div className="flex">
                  <div className="ml-3">
                    <h3 className="text-sm font-medium text-red-800 dark:text-red-300">{error}</h3>
                  </div>
                </div>
              </div>
            )}

            <div>
              <Button
                type="submit"
                fullWidth
                disabled={loading}
                className="bg-green-600 hover:bg-green-700 text-white dark:bg-green-600 dark:hover:bg-green-700"
              >
                {loading ? 'Entrando...' : 'Entrar'}
              </Button>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}

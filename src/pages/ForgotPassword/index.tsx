import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { ArrowLeft, Mail, CheckCircle, AlertCircle } from 'lucide-react'
import { Button } from '../../components/Button'
import { resetPasswordForEmail } from '../../services/auth.service'

export function ForgotPassword() {
  const navigate = useNavigate()
  const [email, setEmail] = useState('')
  const [loading, setLoading] = useState(false)
  const [success, setSuccess] = useState(false)
  const [error, setError] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    try {
      setLoading(true)
      setError('')
      await resetPasswordForEmail(email)
      setSuccess(true)
    } catch (err: any) {
      if (err.message.includes('Too many requests')) {
         setError('Muitas tentativas. Aguarde um pouco e tente novamente.')
      } else {
         setError('Ocorreu um erro. Verifique o email digitado.')
      }
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <div className="flex justify-center mb-6">
           <button onClick={() => navigate('/login')} className="p-2 rounded-full bg-white shadow-sm hover:bg-gray-50 transition-colors">
             <ArrowLeft className="h-6 w-6 text-gray-500" />
           </button>
        </div>
        
        <h2 className="mt-2 text-center text-3xl font-extrabold text-gray-900">
          Recuperar senha
        </h2>
        <p className="mt-2 text-center text-sm text-gray-600">
          Digite seu email para receber o link de redefinição.
        </p>
      </div>

      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
          
          {success ? (
            <div className="text-center space-y-4 animate-in fade-in duration-500">
                <div className="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-green-100">
                    <CheckCircle className="h-6 w-6 text-green-600" />
                </div>
                <h3 className="text-lg font-medium text-gray-900">Email enviado!</h3>
                <p className="text-sm text-gray-500">
                    Verifique sua caixa de entrada (e spam) para redefinir sua senha.
                </p>
                <div className="pt-4">
                    <Button fullWidth onClick={() => navigate('/login')} variant="outline">
                        Voltar para o Login
                    </Button>
                </div>
            </div>
          ) : (
            <form className="space-y-6" onSubmit={handleSubmit}>
                <div>
                <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                    Email
                </label>
                <div className="mt-1 relative rounded-md shadow-sm">
                    <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <Mail className="h-5 w-5 text-gray-400" aria-hidden="true" />
                    </div>
                    <input
                    id="email"
                    name="email"
                    type="email"
                    autoComplete="email"
                    required
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="focus:ring-brand-blue focus:border-brand-blue block w-full pl-10 sm:text-sm border-gray-300 rounded-md py-2"
                    placeholder="seu@email.com"
                    />
                </div>
                </div>

                {error && (
                <div className="rounded-md bg-red-50 p-4">
                    <div className="flex">
                    <div className="flex-shrink-0">
                        <AlertCircle className="h-5 w-5 text-red-400" aria-hidden="true" />
                    </div>
                    <div className="ml-3">
                        <h3 className="text-sm font-medium text-red-800">{error}</h3>
                    </div>
                    </div>
                </div>
                )}

                <div>
                <Button
                    type="submit"
                    fullWidth
                    disabled={loading}
                    className="bg-brand-blue hover:bg-blue-700 text-white"
                >
                    {loading ? 'Enviando...' : 'Enviar link de recuperação'}
                </Button>
                </div>
            </form>
          )}
        </div>
      </div>
    </div>
  )
}

import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Rocket, MessageCircle, DollarSign, CheckCircle2 } from 'lucide-react'
import { supabase } from '../../services/supabase'
import { useSelectionStore } from '../../store/useSelectionStore'

export function ForProfessionals() {
  const navigate = useNavigate()
  const { openProfileModal } = useSelectionStore()
  const [isLogged, setIsLogged] = useState(false)

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => setIsLogged(!!data.user))
  }, [])

  const handleCtaClick = () => {
    if (isLogged) {
      openProfileModal()
    } else {
      navigate('/register')
    }
  }

  return (
    <div className="flex-1 bg-gray-50 dark:bg-gray-900 pb-20">
      {/* Hero Section */}
      <div className="bg-indigo-700 text-white pt-16 pb-20 px-6 relative overflow-hidden">
        <div className="absolute -top-20 -right-20 w-64 h-64 bg-white/10 rounded-full blur-3xl"></div>
        <div className="absolute bottom-10 -left-10 w-40 h-40 bg-blue-500/20 rounded-full blur-2xl"></div>
        
        <div className="max-w-4xl mx-auto relative z-10 text-center">
          <h1 className="text-3xl md:text-5xl font-bold mb-6">
            Multiplique seus clientes anunciando no Yai
          </h1>
          <p className="text-indigo-100 text-lg md:text-xl mb-8 max-w-2xl mx-auto">
            A plataforma com o cadastro mais rápido do ABC. Publique seus serviços gratuitamente e comece a ser visto hoje mesmo.
          </p>
          <button 
            onClick={handleCtaClick}
            className="bg-yellow-400 hover:bg-yellow-300 text-indigo-900 font-bold text-lg py-4 px-10 rounded-2xl shadow-lg transition-transform hover:scale-105 active:scale-95 duration-200"
          >
            {isLogged ? 'Acessar Meu Perfil de Serviço' : 'Quero Anunciar Grátis'}
          </button>
        </div>
      </div>

      {/* Benefits */}
      <div className="max-w-5xl mx-auto px-6 -mt-10 relative z-20">
        <div className="grid md:grid-cols-3 gap-6">
          <div className="bg-white dark:bg-gray-800 p-6 rounded-3xl shadow-xl border border-gray-100 dark:border-gray-700">
            <div className="w-14 h-14 bg-blue-100 dark:bg-blue-900/40 rounded-2xl flex items-center justify-center mb-5">
              <Rocket className="h-7 w-7 text-blue-600 dark:text-blue-400" />
            </div>
            <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-3">Perfil em 2 Minutos</h3>
            <p className="text-gray-600 dark:text-gray-400">
              Nada de formulários infinitos. Preencha seu nome, selecione a categoria e cidade, e seu negócio já estará na vitrine.
            </p>
          </div>

          <div className="bg-white dark:bg-gray-800 p-6 rounded-3xl shadow-xl border border-gray-100 dark:border-gray-700">
            <div className="w-14 h-14 bg-green-100 dark:bg-green-900/40 rounded-2xl flex items-center justify-center mb-5">
              <MessageCircle className="h-7 w-7 text-green-600 dark:text-green-400" />
            </div>
            <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-3">Contato Direto</h3>
            <p className="text-gray-600 dark:text-gray-400">
              Receba os pedidos de orçamento diretamente no nosso <strong className="text-green-600 dark:text-green-400">Chat Interno</strong> ou no seu WhatsApp. Fale direto com o cliente.
            </p>
          </div>

          <div className="bg-white dark:bg-gray-800 p-6 rounded-3xl shadow-xl border border-gray-100 dark:border-gray-700">
            <div className="w-14 h-14 bg-yellow-100 dark:bg-yellow-900/40 rounded-2xl flex items-center justify-center mb-5">
              <DollarSign className="h-7 w-7 text-yellow-600 dark:text-yellow-400" />
            </div>
            <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-3">0% de Comissão</h3>
            <p className="text-gray-600 dark:text-gray-400">
              Você não paga mensalidade e nem comissão por serviço fechado. O lucro do seu trabalho é 100% seu.
            </p>
          </div>
        </div>
      </div>

      {/* How it works */}
      <div className="max-w-4xl mx-auto px-6 mt-20 text-center">
        <h2 className="text-2xl md:text-3xl font-bold text-gray-900 dark:text-white mb-10">Como Funciona?</h2>
        
        <div className="space-y-6 text-left">
          <div className="flex gap-4 items-start">
            <CheckCircle2 className="h-6 w-6 text-indigo-600 shrink-0 mt-0.5" />
            <div>
              <h4 className="text-lg font-bold text-gray-900 dark:text-white">Passo 1: Crie sua conta grátis</h4>
              <p className="text-gray-600 dark:text-gray-400 mt-1">Basta entrar com seu e-mail ou conta do Google. É rápido e seguro.</p>
            </div>
          </div>
          
          <div className="flex gap-4 items-start">
            <CheckCircle2 className="h-6 w-6 text-indigo-600 shrink-0 mt-0.5" />
            <div>
              <h4 className="text-lg font-bold text-gray-900 dark:text-white">Passo 2: Monte sua Vitrine</h4>
              <p className="text-gray-600 dark:text-gray-400 mt-1">Diga qual serviço você presta e em quais cidades. O Yai possui dezenas de categorias ativas.</p>
            </div>
          </div>
          
          <div className="flex gap-4 items-start">
            <CheckCircle2 className="h-6 w-6 text-indigo-600 shrink-0 mt-0.5" />
            <div>
              <h4 className="text-lg font-bold text-gray-900 dark:text-white">Passo 3: Receba contatos</h4>
              <p className="text-gray-600 dark:text-gray-400 mt-1">Sempre que alguém da sua região buscar pelo seu serviço, você poderá ser listado e receber contatos via Chat Interno.</p>
            </div>
          </div>
        </div>

        <div className="mt-12">
          <button 
            onClick={handleCtaClick}
            className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold text-lg py-3 px-8 rounded-xl shadow-md transition-colors w-full sm:w-auto"
          >
            {isLogged ? 'Acessar Meu Perfil de Serviço' : 'Começar Agora'}
          </button>
        </div>
      </div>
    </div>
  )
}

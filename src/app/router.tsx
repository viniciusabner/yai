import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { Home } from '../pages/Home'
import { Results } from '../pages/Results'
import { Login } from '../pages/Login'
import { Register } from '../pages/Register'
import { Inbox } from '../pages/Inbox'
import { ProviderInbox as ProviderAction } from '../pages/Provider'
import { Layout } from '../components/Layout'
import { InstitutionalPage } from '../pages/Institutional'
import { ForgotPassword } from '../pages/ForgotPassword'
import { ForProfessionals } from '../pages/ForProfessionals'

const router = createBrowserRouter([
  {
    path: '/',
    element: <Layout />,
    children: [
      {
        path: '/',
        element: <Home />,
      },
      {
        path: '/results',
        element: <Results />,
      },
      {
        path: '/inbox',
        element: <Inbox />,
      },
      {
        path: '/provider',
        element: <ProviderAction />, 
      },
      {
        path: '/para-profissionais',
        element: <ForProfessionals />,
      },
      // Institutional Routes
      {
        path: '/about',
        element: (
             <InstitutionalPage title="Sobre Nós">
                <p>Somos a <strong>Yai</strong>, a nova forma de conectar quem precisa com quem sabe fazer.</p>
                <p>Nossa missão é simplificar a busca por prestadores de serviços qualificados, oferecendo uma plataforma ágil, segura e transparente.</p>
                <h3 className="mt-4 font-bold">Nossa História</h3>
                <p>Nascemos da necessidade de encontrar profissionais de confiança de forma rápida. O que começou como uma lista de contatos, hoje é uma plataforma completa que ajuda milhares de pessoas a resolverem seus problemas do dia a dia.</p>
             </InstitutionalPage>
        )
      },
      {
        path: '/help',
        element: (
            <InstitutionalPage title="Ajuda e FAQ">
               <h3 className="mt-4 font-bold">Como funciona?</h3>
               <p>Basta buscar pelo serviço desejado, filtrar por sua cidade e escolher o profissional que mais lhe agrada.</p>
               <h3 className="mt-4 font-bold">É gratuito?</h3>
               <p>Sim! Para quem busca serviços, a plataforma é 100% gratuita.</p>
               <h3 className="mt-4 font-bold">Como falar com o suporte?</h3>
               <p>Envie um email para suporte@yai.com.br.</p>
            </InstitutionalPage>
       )
      },
      {
        path: '/seguranca',
        element: (
            <InstitutionalPage title="Dicas de Segurança" lastUpdated="22/01/2026">
                <ul className="list-disc pl-5 space-y-2">
                    <li>Sempre verifique as avaliações do prestador antes de contratar.</li>
                    <li>Prefira realizar pagamentos após a conclusão do serviço ou conforme acordado em contrato.</li>
                    <li>Mantenha as conversas dentro da plataforma sempre que possível (em breve).</li>
                    <li>Desconfie de preços muito abaixo do mercado.</li>
                </ul>
            </InstitutionalPage>
       )
      },
      {
        path: '/termos',
        element: (
            <InstitutionalPage title="Termos de Uso" lastUpdated="01/01/2026">
                <p>Ao utilizar nossos serviços, você concorda com os termos descritos abaixo...</p>
                <p>(Texto legal padrão em construção)</p>
            </InstitutionalPage>
       )
      },
      {
        path: '/privacidade',
        element: (
            <InstitutionalPage title="Política de Privacidade" lastUpdated="01/01/2026">
                <p>Respeitamos sua privacidade e protegemos seus dados pessoais.</p>
                <p>Coletamos apenas as informações necessárias para conectar você aos prestadores.</p>
            </InstitutionalPage>
       )
      },
      {
        path: '/propriedade-intelectual',
        element: (
            <InstitutionalPage title="Propriedade Intelectual">
                <p>Todas as marcas, logos e conteúdos apresentados nesta plataforma são de propriedade de seus respectivos donos.</p>
            </InstitutionalPage>
       )
      },
    ]
  },
  {
    path: '/login',
    element: <Login />,
  },
  {
    path: '/register',
    element: <Register />,
  },
  {
    path: '/forgot-password',
    element: <ForgotPassword />,
  },
])

export function Router() {
  return <RouterProvider router={router} />
}

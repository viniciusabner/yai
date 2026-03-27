import { Link } from 'react-router-dom'
import { Logo } from '../Logo'
import { Mail } from 'lucide-react'

export function Footer() {
  const currentYear = new Date().getFullYear()

  return (
    <footer className="bg-white dark:bg-gray-900 border-t border-gray-100 dark:border-gray-800 pt-12 pb-8 transition-colors">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-12 mb-12">
          
          {/* Brand Column */}
          <div className="space-y-4">
            <Logo variant="dark-yellow" /> 
            <p className="text-sm text-gray-500 dark:text-gray-400 leading-relaxed max-w-xs">
              Conectando você aos melhores profissionais e empresas da sua região de forma simples, rápida e segura.
            </p>
          </div>

          {/* Links Column (Grid of 3) */}
          <div className="grid grid-cols-2 sm:grid-cols-3 gap-8">
             {/* Institucional */}
             <div>
                <h3 className="font-bold text-gray-900 dark:text-white mb-4">Institucional</h3>
                <ul className="space-y-3 text-sm">
                  <li>
                    <Link to="/about" className="text-gray-500 dark:text-gray-400 hover:text-brand-blue dark:hover:text-brand-yellow transition-colors flex items-center gap-2">
                      Sobre nós
                    </Link>
                  </li>
                  <li>
                    <Link to="/help" className="text-gray-500 dark:text-gray-400 hover:text-brand-blue dark:hover:text-brand-yellow transition-colors flex items-center gap-2">
                      Ajuda e FAQ
                    </Link>
                  </li>
                  <li>
                    <Link to="/seguranca" className="text-gray-500 dark:text-gray-400 hover:text-brand-blue dark:hover:text-brand-yellow transition-colors flex items-center gap-2">
                      Dicas de Segurança
                    </Link>
                  </li>
                </ul>
              </div>

              {/* Legal */}
              <div>
                <h3 className="font-bold text-gray-900 dark:text-white mb-4">Legal</h3>
                <ul className="space-y-3 text-sm">
                  <li>
                    <Link to="/termos" className="text-gray-500 dark:text-gray-400 hover:text-brand-blue dark:hover:text-brand-yellow transition-colors flex items-center gap-2">
                      Termos de Uso
                    </Link>
                  </li>
                  <li>
                    <Link to="/privacidade" className="text-gray-500 dark:text-gray-400 hover:text-brand-blue dark:hover:text-brand-yellow transition-colors flex items-center gap-2">
                      Política de Privacidade
                    </Link>
                  </li>
                  <li>
                    <Link to="/propriedade-intelectual" className="text-gray-500 dark:text-gray-400 hover:text-brand-blue dark:hover:text-brand-yellow transition-colors flex items-center gap-2">
                      Propriedade Intelectual
                    </Link>
                  </li>
                </ul>
              </div>

              {/* Contato */}
              <div>
                <h3 className="font-bold text-gray-900 dark:text-white mb-4">Fale Conosco</h3>
                <ul className="space-y-3 text-sm">
                  <li className="flex items-start gap-3 text-gray-500 dark:text-gray-400">
                    <Mail className="h-5 w-5 shrink-0 text-brand-blue dark:text-brand-yellow" />
                    <span className="break-all">suporte@yai.com.br</span>
                  </li>
                  <li className="text-xs text-gray-400 mt-4">
                    Atendimento de Seg. a Sex. das 9h às 18h
                  </li>
                </ul>
              </div>
          </div>
        </div>

        <div className="border-t border-gray-100 dark:border-gray-800 pt-8 flex flex-col md:flex-row items-center justify-between gap-4">
          <p className="text-xs text-gray-400 dark:text-gray-500 text-center md:text-left">
            &copy; {currentYear} Yai Serviços. Todos os direitos reservados.
          </p>
          <div className="flex items-center gap-6 text-xs text-gray-400 dark:text-gray-500">
            <span>Feito com ❤️ em SP</span>
          </div>
        </div>
      </div>
    </footer>
  )
}

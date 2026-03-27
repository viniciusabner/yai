import { useEffect } from 'react'

interface InstitutionalPageProps {
  title: string
  lastUpdated?: string
  children: React.ReactNode
}

export function InstitutionalPage({ title, lastUpdated, children }: InstitutionalPageProps) {
    useEffect(() => {
        window.scrollTo(0, 0)
    }, [])

  return (
    <div className="bg-gray-50 dark:bg-gray-900 min-h-screen py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-3xl mx-auto bg-white dark:bg-gray-800 rounded-2xl shadow-sm border border-gray-100 dark:border-gray-700 p-8 sm:p-12 animate-in fade-in duration-500">
        
        <div className="mb-8 border-b border-gray-100 dark:border-gray-700 pb-8">
            <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-2">{title}</h1>
            {lastUpdated && (
                <p className="text-sm text-gray-500 dark:text-gray-400">
                    Última atualização: {lastUpdated}
                </p>
            )}
        </div>

        <div className="prose prose-blue dark:prose-invert max-w-none text-gray-600 dark:text-gray-300">
            {children}
        </div>
      </div>
    </div>
  )
}

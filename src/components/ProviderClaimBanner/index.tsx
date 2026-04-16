import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { Building2, X, ArrowRight, Loader2 } from 'lucide-react'
import { useSelectionStore } from '../../store/useSelectionStore'
import { claimProviderByEmail } from '../../services/claim.service'
import { supabase } from '../../services/supabase'

export function ProviderClaimBanner() {
  const navigate = useNavigate()
  const pendingProviderClaim = useSelectionStore((s) => s.pendingProviderClaim)
  const setPendingProviderClaim = useSelectionStore((s) => s.setPendingProviderClaim)
  const [loading, setLoading] = useState(false)
  const [claimed, setClaimed] = useState(false)

  if (!pendingProviderClaim || claimed) return null

  const handleClaim = async () => {
    setLoading(true)
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) { setLoading(false); return }

    const success = await claimProviderByEmail(pendingProviderClaim.id, user.id)
    if (success) {
      setClaimed(true)
      setPendingProviderClaim(null)
      navigate('/provider')
    }
    setLoading(false)
  }

  const handleDismiss = () => {
    setPendingProviderClaim(null)
  }

  return (
    <div className="fixed top-0 left-0 right-0 z-50 bg-gradient-to-r from-emerald-600 to-teal-600 text-white shadow-lg">
      <div className="max-w-4xl mx-auto px-4 py-3 flex items-center gap-3">
        <Building2 size={20} className="shrink-0" />
        <div className="flex-1 min-w-0">
          <p className="text-sm font-semibold truncate">
            Encontramos a empresa <span className="font-bold">"{pendingProviderClaim.name}"</span> vinculada a este e-mail!
          </p>
          <p className="text-xs text-emerald-100">
            Quer assumir o controle e responder seus clientes?
          </p>
        </div>
        <button
          onClick={handleClaim}
          disabled={loading}
          className="flex items-center gap-1.5 bg-white text-emerald-700 font-semibold text-xs px-3 py-1.5 rounded-full hover:bg-emerald-50 transition-colors shrink-0"
        >
          {loading ? (
            <Loader2 size={14} className="animate-spin" />
          ) : (
            <>
              Assumir controle
              <ArrowRight size={14} />
            </>
          )}
        </button>
        <button
          onClick={handleDismiss}
          className="text-emerald-100 hover:text-white transition-colors shrink-0"
          aria-label="Fechar"
        >
          <X size={18} />
        </button>
      </div>
    </div>
  )
}

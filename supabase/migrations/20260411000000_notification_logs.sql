-- Migration: Create notification_logs table
-- Purpose: Track every email/whatsapp sent per provider per message
-- so we can detect providers who haven't responded after 24h
-- and trigger a follow-up via email or WhatsApp.

CREATE TABLE IF NOT EXISTS public.notification_logs (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  provider_id UUID NOT NULL REFERENCES public.providers(id) ON DELETE CASCADE,
  message_id  UUID REFERENCES public.messages(id) ON DELETE SET NULL,
  channel     TEXT NOT NULL CHECK (channel IN ('email', 'whatsapp', 'manual')),
  sent_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  resent      BOOLEAN NOT NULL DEFAULT false,
  resent_at   TIMESTAMPTZ
);

-- Index for fast lookup of unreplied leads older than 24h
CREATE INDEX IF NOT EXISTS idx_notif_logs_provider_resent
  ON public.notification_logs (provider_id, resent, sent_at);

-- RLS: only service role can read/write this table
ALTER TABLE public.notification_logs ENABLE ROW LEVEL SECURITY;

-- Allow the edge function (service role) full access
CREATE POLICY "service_role_access" ON public.notification_logs
  USING (true) WITH CHECK (true);

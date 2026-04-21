import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.38.4'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )

    const resendApiKey = Deno.env.get('RESEND_API_KEY') ?? ''
    const isTestMode = Deno.env.get('TEST_MODE') === 'true'
    const testEmail = Deno.env.get('TEST_EMAIL_OVERRIDE') ?? ''
    const twentyFourHoursAgo = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString()

    // Find all logs older than 24h that have NOT been resent and whose provider has no owner_id
    const { data: logs, error } = await supabaseAdmin
      .from('notification_logs')
      .select(`
        id,
        provider_id,
        message_id,
        providers:provider_id (
          name,
          email,
          owner_id
        )
      `)
      .eq('channel', 'email')
      .eq('resent', false)
      .lt('sent_at', twentyFourHoursAgo)

    if (error) throw error

    // Filter only unclaimed providers
    const unreplied = (logs || []).filter((log: any) => !log.providers?.owner_id)

    console.log(`Found ${unreplied.length} unreplied leads to follow up on.`)

    let sent = 0
    for (const log of unreplied) {
      const provider = log.providers as any
      if (!provider?.email && !isTestMode) {
        console.log(`Skipping provider ${log.provider_id} — no email and not in test mode`)
        continue
      }

      const finalEmail = isTestMode && testEmail ? testEmail : provider.email
      if (!finalEmail) continue

      const subject = `⏰ ${provider.name}, você ainda tem um cliente esperando sua resposta!`
      const htmlBody = `
        <div style="font-family: sans-serif; max-width: 600px; margin: 0 auto; color: #1a1a1a;">
          <h2 style="color: #059669;">Oi, ${provider.name}!</h2>
          <p>Há mais de <strong>24 horas</strong>, um cliente enviou uma mensagem para a sua empresa pelo <strong>Yai</strong> — e ainda está aguardando sua resposta!</p>
          <p>Clientes que recebem resposta rápida têm <strong>3x mais chance</strong> de fechar negócio.</p>
          <div style="margin: 24px 0; text-align: center;">
            <a href="https://viniciusabner.github.io/yai/register?from=email_reminder" 
               style="background: #059669; color: white; padding: 14px 28px; border-radius: 8px; text-decoration: none; font-weight: bold; font-size: 16px;">
              💬 Responder agora
            </a>
          </div>
          <p style="color: #6b7280; font-size: 13px;">Esta é uma mensagem de lembrete do Yai. Se não quiser mais receber e-mails, entre em contato com suporte@yai.com.br.</p>
        </div>
      `

      const res = await fetch('https://api.resend.com/emails', {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${resendApiKey}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          from: 'Yai Leads <onboarding@resend.dev>',
          to: finalEmail,
          subject,
          html: htmlBody
        })
      })

      if (res.ok) {
        // Mark as resent
        await supabaseAdmin
          .from('notification_logs')
          .update({ resent: true, resent_at: new Date().toISOString() })
          .eq('id', log.id)

        console.log(`Reminder sent to: ${finalEmail} for provider: ${provider.name}`)
        sent++
      } else {
        const errTxt = await res.text()
        console.error(`Failed to send reminder for ${log.id}:`, errTxt)
      }
    }

    return new Response(JSON.stringify({ success: true, reminders_sent: sent }), {
      status: 200,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' }
    })

  } catch (error: any) {
    console.error('Reminder function error:', error)
    return new Response(JSON.stringify({ error: error.message }), {
      status: 400,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' }
    })
  }
})

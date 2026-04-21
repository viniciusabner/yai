import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.38.4'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req: Request) => {
  // Handle CORS preflight requests
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const payload = await req.json()
    console.log('Webhook payload received:', payload)

    // Ensure it's an INSERT trigger on messages table
    if (payload.type !== 'INSERT' || payload.table !== 'messages') {
      return new Response('Not an insert on messages', { status: 200, headers: corsHeaders })
    }

    const message = payload.record

    // Initialize Supabase Admin Client to bypass RLS
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    )

    // 1. Fetch Conversation to get provider
    const { data: conversation, error: convError } = await supabaseAdmin
      .from('conversations')
      .select('provider_id')
      .eq('id', message.conversation_id)
      .single()

    if (convError || !conversation) {
      console.error('Error fetching conversation:', convError)
      throw new Error('Conversation not found')
    }

    // 2. Fetch Provider details
    const { data: provider, error: provError } = await supabaseAdmin
      .from('providers')
      .select('name, email, owner_id')
      .eq('id', conversation.provider_id)
      .single()

    if (provError || !provider) {
      console.error('Error fetching provider:', provError)
      throw new Error('Provider not found')
    }

    // ********** TEST OVERRIDE LOGIC **********
    const isTestMode = Deno.env.get('TEST_MODE') === 'true'
    const testOverrideEmail = Deno.env.get('TEST_EMAIL_OVERRIDE') // e.g. viniciusabnerdev@gmail.com
    
    // If the provider has no generic email and we are NOT in test mode, we log and exit
    const targetEmail = provider.email
    if (!targetEmail && !isTestMode) {
      console.log(`Provider ${provider.name} has no email and test mode is off. Skipping.`)
      return new Response('No email for provider', { status: 200, headers: corsHeaders })
    }

    let finalEmail = targetEmail || 'fake-provider@email.com'
    if (isTestMode && testOverrideEmail) {
      console.log(`TEST_MODE IS ON. Redirecting email from ${targetEmail || 'NO_MAIL'} to ${testOverrideEmail}`)
      finalEmail = testOverrideEmail
    }
    // *****************************************

    // Determine the Copy based on Registration Status
    const isRegistered = provider.owner_id !== null
    
    // Choose subject and html body
    const subject = isRegistered
        ? 'Nova mensagem de cliente no Yai! 💬'
        : 'Tem cliente querendo fechar orçamento com você no Yai! 🚀'

    // Template HTML simples
    const htmlBody = `
      <div style="font-family: sans-serif; max-w: 600px; margin: 0 auto; color: #333;">
        <h2>Olá, equipe da <strong>${provider.name}</strong>! 👋</h2>
        <p>Temos uma ótima notícia! Um usuário da sua região acabou de enviar uma mensagem solicitando um orçamento através da nossa plataforma <strong>Yai</strong>.</p>
        
        <div style="border-left: 4px solid #16a34a; padding-left: 15px; margin: 20px 0; font-style: italic; color: #555;">
            "${message.content}"
        </div>

        <p>Não deixe seu cliente esperando. Tempo é dinheiro!</p>
        
        ${isRegistered 
          ? `<p><a href="https://viniciusabner.github.io/yai/login" style="display:inline-block; padding: 12px 24px; background-color: #16a34a; color: white; text-decoration: none; border-radius: 6px; font-weight: bold;">Ver Mensagem na Plataforma</a></p>`
          : `<p>Vimos que você ainda não tem o domínio do seu perfil na Yai. É grátis e rápido. Registre-se abaixo para liberar as mensagens:</p>
             <p><a href="https://viniciusabner.github.io/yai/register" style="display:inline-block; padding: 12px 24px; background-color: #2563eb; color: white; text-decoration: none; border-radius: 6px; font-weight: bold;">Criar Conta Grátis para Responder</a></p>`
        }
        
        <hr style="margin: 30px 0; border: none; border-top: 1px solid #eee;" />
        <p style="font-size: 12px; color: #999;">Esta é uma mensagem automática da plataforma Yai. <br />
        ${isTestMode ? `<strong>AVISO: MODO DE TESTE ATIVADO! Destinatário original: ${targetEmail}</strong>` : ''}</p>
      </div>
    `

    // Send the email using Resend HTTP API
    const resendApiKey = Deno.env.get('RESEND_API_KEY')
    if (!resendApiKey) {
        throw new Error('RESEND_API_KEY is not defined')
    }

    const res = await fetch('https://api.resend.com/emails', {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${resendApiKey}`,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            from: 'Yai Leads <onboarding@resend.dev>', // E-mail padrão de testes do Resend
            to: finalEmail,
            subject: subject,
            html: htmlBody
        })
    })

    if (!res.ok) {
        const errPayload = await res.text()
        console.error('Resend API failed:', errPayload)
        throw new Error('Failed to send email via Resend')
    }

    console.log('Email sent successfully to', finalEmail)

    // Log this notification so the reminder job can track unreplied leads
    try {
      await supabaseAdmin.from('notification_logs').insert({
        provider_id: provider.id,
        message_id: message.id,
        channel: 'email',
        sent_at: new Date().toISOString(),
        resent: false
      })
    } catch (logError) {
      console.error('Failed to insert notification_log (non-fatal):', logError)
    }

    return new Response(JSON.stringify({ success: true, target: finalEmail }), { 
      status: 200, 
      headers: { ...corsHeaders, 'Content-Type': 'application/json' } 
    })


  } catch (error: any) {
    console.error('Function error:', error)
    return new Response(JSON.stringify({ error: error.message }), { 
      status: 400, 
      headers: { ...corsHeaders, 'Content-Type': 'application/json' } 
    })
  }
})

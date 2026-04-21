# Deploying and Configuring the Lead Notification Edge Function

To deploy the lead notification emailer, follow these steps using your terminal and Supabase Dashboard.

## 1. Deploy the Function
First, make sure you have the Supabase CLI installed, and you are logged in (`npx supabase login`).
Then run:

\`\`\`bash
npx supabase functions deploy notify_provider_lead
\`\`\`

## 2. Set the Secrets
This function relies on certain environment variables to configure Resend and test routing safely.
Run the following in your terminal, replacing the dummy values with your actual Resend API key:

\`\`\`bash
npx supabase secrets set RESEND_API_KEY=re_sua_chave_aqui
npx supabase secrets set TEST_MODE=true
npx supabase secrets set TEST_EMAIL_OVERRIDE=viniciusabnerdev@gmail.com
\`\`\`

*(When you are ready to go live and send emails to the real providers, simply change `TEST_MODE=false`)*

## 3. Create the Database Webhook
In your Supabase Dashboard:
1. Go to **Database** -> **Webhooks**.
2. Click **Create a new Hook**.
3. **Name**: `trigger_lead_notification`
4. **Table**: `messages`
5. **Events**: Tick only `Insert`.
6. **Type of Hook**: `Supabase Edge Function`
7. **Edge Function**: Select `notify_provider_lead` from the dropdown.
8. **Method**: `POST`
9. Save!

Now, every time a user sends a message successfully on Yai, this function will automatically run in the background, build the dynamic business Email (knowing if they are registered or not), and send the results to your test inbox!

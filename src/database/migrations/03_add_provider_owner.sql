-- Add owner_id to providers table
ALTER TABLE public.providers 
ADD COLUMN IF NOT EXISTS owner_id uuid REFERENCES auth.users(id);

-- Enable RLS on providers
ALTER TABLE public.providers ENABLE ROW LEVEL SECURITY;

-- 1. Regra de Leitura (Público)
DROP POLICY IF EXISTS "Public providers are viewable by everyone" ON public.providers;

CREATE POLICY "Public providers are viewable by everyone"
ON public.providers
FOR SELECT
USING (true);

-- 2. Regra de Atualização
DROP POLICY IF EXISTS "Users can update their own providers" ON public.providers;

CREATE POLICY "Users can update their own providers"
ON public.providers
FOR UPDATE
USING (auth.uid() = owner_id)
WITH CHECK (auth.uid() = owner_id);

-- 2. Claiming Policy (Allow testing)
DROP POLICY IF EXISTS "Users can claim unowned providers" ON public.providers;

CREATE POLICY "Users can claim unowned providers"
ON public.providers
FOR UPDATE
USING (owner_id IS NULL)
WITH CHECK (owner_id = auth.uid());

-- 3. Conversation Policies
DROP POLICY IF EXISTS "Users can view their own conversations" ON public.conversations;
DROP POLICY IF EXISTS "Users can view conversations as user or provider" ON public.conversations;

CREATE POLICY "Users can view conversations as user or provider"
ON public.conversations
FOR SELECT
USING (
  auth.uid() = user_id OR 
  EXISTS (
    SELECT 1 FROM public.providers 
    WHERE id = conversations.provider_id 
    AND owner_id = auth.uid()
  )
);

-- 4. Message Policies (View)
DROP POLICY IF EXISTS "Users can view messages in their conversations" ON public.messages;
DROP POLICY IF EXISTS "Users and Providers can view messages" ON public.messages;

CREATE POLICY "Users and Providers can view messages"
ON public.messages
FOR SELECT
USING (
  EXISTS (
    SELECT 1 FROM public.conversations c
    LEFT JOIN public.providers p ON p.id = c.provider_id
    WHERE c.id = messages.conversation_id
    AND (c.user_id = auth.uid() OR p.owner_id = auth.uid())
  )
);

-- 5. Message Policies (Insert)
DROP POLICY IF EXISTS "Users can insert messages in their conversations" ON public.messages;
DROP POLICY IF EXISTS "Users and Providers can insert messages" ON public.messages;

CREATE POLICY "Users and Providers can insert messages"
ON public.messages
FOR INSERT
WITH CHECK (
  EXISTS (
    SELECT 1 FROM public.conversations c
    LEFT JOIN public.providers p ON p.id = c.provider_id
    WHERE c.id = messages.conversation_id
    AND (c.user_id = auth.uid() OR p.owner_id = auth.uid())
  )
  AND auth.uid() = sender_id
);

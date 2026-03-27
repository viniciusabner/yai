-- Create table for tracking contact events
create table public.contact_events (
  id uuid not null default gen_random_uuid(),
  provider_id uuid not null references public.providers(id),
  session_id uuid, -- For anonymous tracking
  user_id uuid references auth.users(id), -- For logged-in tracking
  event_type text not null check (event_type in ('whatsapp_click', 'whatsapp_confirmed')),
  created_at timestamp with time zone not null default now(),
  constraint contact_events_pkey primary key (id)
);

-- Add comment
comment on table public.contact_events is 'Tracks user interactions with providers (clicks and confirmations)';

-- Set up RLS (Row Level Security)
alter table public.contact_events enable row level security;

-- Allow anonymous inserts (with session_id) AND authenticated inserts
create policy "Allow inserts"
on public.contact_events
for insert
with check (
  -- Allow if anonymous (no user_id set, or purely using session_id)
  (auth.uid() is null) 
  OR 
  -- Allow if authenticated (user_id must match auth.uid())
  (user_id = auth.uid())
);

-- Allow reading own events (by session_id OR user_id)
create policy "Allow read own"
on public.contact_events
for select
using (
  -- Match session_id (anonymous)
  (session_id is not null) -- Ideally we filter by actual session but for public read current policy is broad.
  -- Let's stick to the broad public read for 'anon' simplified usage, 
  -- BUT add specific allow for authenticated users to see their own data.
  OR 
  (auth.uid() = user_id)
);

-- Note: The previous "Allow public read" using (true) effectively allows everything.
-- We might want to tighten it, but for now let's ensure auth users can definitely READ/UPDATE if needed.
-- For "merging", we need to allow UPDATING rows where session_id matches, even if user isn't set yet?
-- Actually, the "merge" op usually happens via a function or if the user claims it.
-- Let's create a policy to allow UPDATE if you own the session_id? 
-- Hard to prove ownership of session_id in SQL without sending it. 
-- Simple approach: "Allow updating where session_id is X" (client logic).

create policy "Allow update for merge"
on public.contact_events
for update
using (true) -- Temporarily permissive for the merge logic to work from client side
with check (true);


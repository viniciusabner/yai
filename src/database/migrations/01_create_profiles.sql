-- Create a table for public profiles (if it doesn't exist)
create table if not exists public.profiles (
  id uuid not null references auth.users on delete cascade,
  full_name text,
  whatsapp text,
  avatar_url text,
  updated_at timestamp with time zone default timezone('utc'::text, now()),
  
  primary key (id)
);

-- Ensure RLS is enabled
alter table public.profiles enable row level security;

-- Re-create policies (Drop first to avoid errors)
drop policy if exists "Public profiles are viewable by everyone." on profiles;
create policy "Public profiles are viewable by everyone."
  on profiles for select
  using ( true );

drop policy if exists "Users can insert their own profile." on profiles;
create policy "Users can insert their own profile."
  on profiles for insert
  with check ( auth.uid() = id );

drop policy if exists "Users can update own profile." on profiles;
create policy "Users can update own profile."
  on profiles for update
  using ( auth.uid() = id );

-- Function to handle new user signup
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, full_name, avatar_url, whatsapp)
  values (
    new.id, 
    new.raw_user_meta_data->>'full_name', 
    new.raw_user_meta_data->>'avatar_url',
    new.raw_user_meta_data->>'whatsapp'
  )
  on conflict (id) do update
  set 
    full_name = excluded.full_name,
    avatar_url = excluded.avatar_url,
    whatsapp = coalesce(profiles.whatsapp, excluded.whatsapp); -- Keep existing whatsapp if present
  return new;
end;
$$;

-- Trigger the function every time a user is created
drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

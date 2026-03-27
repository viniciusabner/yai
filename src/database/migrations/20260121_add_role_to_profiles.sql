-- Add Role to Profiles Table

ALTER TABLE public.profiles 
ADD COLUMN IF NOT EXISTS role TEXT DEFAULT 'client';

-- Validation check constraint
ALTER TABLE public.profiles 
ADD CONSTRAINT check_role CHECK (role IN ('client', 'provider'));

-- Comment
COMMENT ON COLUMN public.profiles.role IS 'User role: client (hire services) or provider (offer services)';

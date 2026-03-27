-- Add Onboarding Completed Flag to Profiles Table

ALTER TABLE public.profiles 
ADD COLUMN IF NOT EXISTS onboarding_completed BOOLEAN DEFAULT FALSE;

COMMENT ON COLUMN public.profiles.onboarding_completed IS 'Flag to indicate if the user has completed the initial onboarding wizard (Role Selection)';

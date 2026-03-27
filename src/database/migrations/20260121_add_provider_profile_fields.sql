-- Add Profile Fields to Providers Table

ALTER TABLE public.providers 
ADD COLUMN IF NOT EXISTS description TEXT,
ADD COLUMN IF NOT EXISTS rating NUMERIC(3, 1) DEFAULT 0, -- Ex: 4.8
ADD COLUMN IF NOT EXISTS review_count INTEGER DEFAULT 0,
ADD COLUMN IF NOT EXISTS photos TEXT[] DEFAULT '{}', -- Array of URLs
ADD COLUMN IF NOT EXISTS opening_hours JSONB DEFAULT '{}'; -- Ex: {"seg": "09:00-18:00"}

-- Add comment for documentation
COMMENT ON COLUMN public.providers.description IS 'Full description of the business';
COMMENT ON COLUMN public.providers.rating IS 'Google Maps rating derived';
COMMENT ON COLUMN public.providers.photos IS 'List of public photo URLs';

-- Add Rio Grande da Serra to cities table
INSERT INTO public.cities (name, slug, state)
VALUES 
  ('Rio Grande da Serra', 'rio-grande-da-serra', 'SP')
ON CONFLICT (slug) DO NOTHING;

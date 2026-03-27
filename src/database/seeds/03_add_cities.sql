-- Add Diadema and Ribeirão Pires to cities table
INSERT INTO public.cities (id, name, slug, state)
VALUES 
  (gen_random_uuid(), 'Diadema', 'diadema', 'SP'),
  (gen_random_uuid(), 'Ribeirão Pires', 'ribeirao-pires', 'SP')
ON CONFLICT (slug) DO NOTHING;

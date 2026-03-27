-- Fix inconsistent category names
UPDATE public.providers SET category = 'imobiliaria' WHERE category = 'Imobiliária';
UPDATE public.providers SET category = 'automoveis' WHERE category = 'Automotivo';
UPDATE public.providers SET category = 'domestic' WHERE category = 'Serviços Gerais';
UPDATE public.providers SET category = 'beauty' WHERE category = 'Beleza e Estética';
UPDATE public.providers SET category = 'construction' WHERE category = 'Construção';
UPDATE public.providers SET category = 'education' WHERE category = 'Educação';
UPDATE public.providers SET category = 'health' WHERE category = 'Saúde';
UPDATE public.providers SET category = 'technology' WHERE category = 'Tecnologia';
UPDATE public.providers SET category = 'food' WHERE category = 'Gastronomia';

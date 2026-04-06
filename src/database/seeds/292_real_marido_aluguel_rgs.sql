-- 292_real_marido_aluguel_rgs.sql
-- MARIDO DE ALUGUEL — Rio Grande da Serra
-- Fonte: Pesquisa manual Google/Maps
-- Total: 2 registros (apenas prestadores locais verificados)
-- Obs: Os existentes (marido-de-aluguel-sp e sos-solucoes) são mantidos.
--       Cronoshare, StarOfService, Doutor Resolve, Master House, Assistência Litt foram descartados (plataformas nacionais).
--       Cidade muito pequena para esta categoria — poucos resultados locais verificáveis.

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Marido de Aluguel SP',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11978869531',
  '11978869531',
  null,
  'manual_google',
  true,
  now(),
  'marido-de-aluguel-sp-rio-grande-da-serra',
  'marido_aluguel',
  'https://www.socorramemaridodealuguel.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'SOS Soluções',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11969456072',
  '11969456072',
  'contato@sosreformasereparos.com.br',
  'manual_google',
  true,
  now(),
  'sos-solucoes-rio-grande-da-serra',
  'marido_aluguel',
  'https://www.sosreformasereparos.com.br',
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;

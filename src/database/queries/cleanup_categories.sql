-- ATENÇÃO: Isso deletará TODOS os prestadores destas categorias.
-- Como existe uma constraint na tabela contact_events, precisamos limpar os eventos primeiro.

-- 1. Remover eventos de contato relacionados
DELETE FROM public.contact_events
WHERE provider_id IN (
    SELECT id FROM public.providers WHERE category IN (
        'jardineiro', 
        'dedetizadora',
        'pintor',
        'montador_moveis',
        'gesseiro',
        'vidraceiro',
        'tecnico_ar_condicionado',
        'serralheiro'
    )
);

-- 2. Remover os prestadores
DELETE FROM public.providers 
WHERE category IN (
    'jardineiro', 
    'dedetizadora',
    'pintor',
    'montador_moveis',
    'gesseiro',
    'vidraceiro',
    'tecnico_ar_condicionado',
    'serralheiro'
);

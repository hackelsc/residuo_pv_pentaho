-- Participação de MG e SP na potência (2011–2025) e no resíduo projetado (2011–2054)
WITH pot AS (
    SELECT SUM(CASE WHEN uf IN ('MG', 'SP') THEN potencia_total_kw END) AS mg_sp,
           SUM(potencia_total_kw) AS total
    FROM public.gdgc_tratado
    WHERE ano_geracao BETWEEN 2011 AND 2025
),
res AS (
    SELECT SUM(CASE WHEN uf IN ('MG', 'SP') THEN residuo_gerado_kg END) AS mg_sp,
           SUM(residuo_gerado_kg) AS total
    FROM public.gdgc_calculos
    WHERE ano_residuo BETWEEN 2011 AND 2054
)
SELECT ROUND(100 * pot.mg_sp::numeric / pot.total::numeric, 1) AS pct_potencia,
       ROUND(100 * res.mg_sp::numeric / res.total::numeric, 1) AS pct_residuo
FROM pot, res;
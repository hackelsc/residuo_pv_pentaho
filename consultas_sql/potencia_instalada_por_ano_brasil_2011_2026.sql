-- Potência fotovoltaica instalada no Brasil por ano (Tabela 6)
SELECT ano_geracao,
       ROUND(SUM(potencia_total_kw)::numeric / 1e6, 2) AS potencia_gw
FROM public.gdgc_tratado
WHERE ano_geracao BETWEEN 2011 AND 2026
GROUP BY ano_geracao
ORDER BY ano_geracao;
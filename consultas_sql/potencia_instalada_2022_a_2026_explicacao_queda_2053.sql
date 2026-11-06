SELECT ano_geracao,
       ROUND(SUM(CASE WHEN fonte='GD' THEN potencia_kw END)/1e6, 2) AS gd_gw,
       ROUND(SUM(CASE WHEN fonte='GC' THEN potencia_kw END)/1e6, 2) AS gc_gw,
       ROUND(SUM(potencia_kw)/1e6, 2) AS total_gw
FROM (
    SELECT ano_geracao, potencia_kw, 'GD' AS fonte FROM public.gd_tratado
    UNION ALL
    SELECT ano_geracao, potencia_kw, 'GC' AS fonte FROM public.gc_tratado
) t
WHERE ano_geracao BETWEEN 2022 AND 2026
GROUP BY ano_geracao
ORDER BY ano_geracao;
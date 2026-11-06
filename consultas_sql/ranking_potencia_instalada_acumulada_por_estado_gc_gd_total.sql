SELECT uf,
       ROUND(SUM(CASE WHEN fonte = 'GD' THEN potencia_kw END)/1e6, 1) AS gd_gw,
       ROUND(SUM(CASE WHEN fonte = 'GC' THEN potencia_kw END)/1e6, 1) AS gc_gw,
       ROUND(SUM(potencia_kw)/1e6, 1) AS total_gw
FROM (
    SELECT uf, potencia_kw, 'GD' AS fonte FROM public.gd_tratado
    WHERE ano_geracao BETWEEN 2011 AND 2025
    UNION ALL
    SELECT uf, potencia_kw, 'GC' AS fonte FROM public.gc_tratado
    WHERE ano_geracao BETWEEN 2011 AND 2025
) t
GROUP BY uf
ORDER BY total_gw DESC;
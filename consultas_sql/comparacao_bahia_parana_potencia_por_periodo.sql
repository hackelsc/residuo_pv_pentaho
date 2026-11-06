-- Potência instalada na BA e no PR por período (seção 3, Figura 1)
SELECT uf,
       ROUND(SUM(CASE WHEN ano_geracao BETWEEN 2011 AND 2025 THEN potencia_total_kw END)::numeric / 1e6, 1) AS gw_2011_2025,
       ROUND(SUM(CASE WHEN ano_geracao IN (2023, 2025)        THEN potencia_total_kw END)::numeric / 1e6, 1) AS gw_2023_e_2025,
       ROUND(SUM(CASE WHEN ano_geracao BETWEEN 2019 AND 2022 THEN potencia_total_kw END)::numeric / 1e6, 1) AS gw_2019_2022
FROM public.gdgc_tratado
WHERE uf IN ('BA', 'PR')
GROUP BY uf;
SELECT 
    t22.SEDE_CODIGO AS codigo_sede,
    t22.total_act_2022,
    t23.total_act_2023,
    (t23.total_act_2023 - t22.total_act_2022) AS diferencia,
    CASE 
        WHEN t23.total_act_2023 > t22.total_act_2022 THEN 'CRECIÓ'
        WHEN t23.total_act_2023 < t22.total_act_2022 THEN 'DECRECIÓ'
        ELSE 'SIN CAMBIO'
    END AS tendencia
FROM 
    (SELECT sede_codigo, COUNT(*) total_act_2022
     FROM tic_2022
     GROUP BY sede_codigo) t22
INNER JOIN 
    (SELECT sede_codigo, COUNT(*) total_act_2023
     FROM tic_2023
     GROUP BY sede_codigo) t23
ON t22.sede_codigo = t23.sede_codigo
WHERE t22.total_act_2022 >= 2
ORDER BY diferencia DESC
LIMIT 30;

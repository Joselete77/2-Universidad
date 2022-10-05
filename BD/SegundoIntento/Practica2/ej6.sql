SELECT
    partido, count(partido)
FROM 
    consultas_datos
GROUP BY partido
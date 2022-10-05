SELECT 
    nombrecompleto, max(certidumbre)
FROM
    partidos
JOIN 
    consultas_datos
ON
    consultas_datos.partido = partidos.idpartido
GROUP BY nombrecompleto
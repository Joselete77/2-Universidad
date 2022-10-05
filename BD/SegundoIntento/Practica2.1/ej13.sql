SELECT
    nombrecompleto,avg(certidumbre)
FROM
    partidos
JOIN
    consultas_datos
ON
    partidos.idpartido = consultas_datos.partido
WHERE
    respuesta = 'No' AND certidumbre > 0.6
GROUP BY nombrecompleto

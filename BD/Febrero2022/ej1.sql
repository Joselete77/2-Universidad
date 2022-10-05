SELECT
    nombrecompleto nombre, count(partido) veces
FROM
    partidos
JOIN
    consultas_datos
ON
    partidos.idpartido = consultas_datos.partido
WHERE
    consultas_datos.respuesta = 'No' AND 
    consultas_datos.certidumbre > 0.1 AND
    consultas_datos.certidumbre < 0.6
GROUP BY partidos.nombrecompleto

SELECT
    nombrecompleto, count(partido) conteo
FROM
    partidos
JOIN
    consultas_datos
ON
    partidos.idpartido = consultas_datos.partido
WHERE
    respuesta = 'Si' and certidumbre > 0.8
GROUP BY nombrecompleto
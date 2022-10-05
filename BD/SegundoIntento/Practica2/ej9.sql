SELECT
    nombrecompleto, count(partido)
FROM
    partidos
JOIN
    consultas_datos
ON
    partidos.idpartido = consultas_datos.partido
HAVING
    count(partido) > 10
GROUP BY nombrecompleto
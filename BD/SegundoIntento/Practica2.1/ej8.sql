SELECT
    nombrecompleto, count(votante) conteo
FROM
    votantes
JOIN
    consultas
ON
    votantes.dni = consultas.votante
HAVING
    count(evento) > 3
GROUP BY nombrecompleto
ORDER BY count(evento) DESC
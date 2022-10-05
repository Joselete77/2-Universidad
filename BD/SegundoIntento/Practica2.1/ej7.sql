SELECT
    dni
FROM
    votantes
JOIN
    consultas
ON
    consultas.votante = votantes.dni
HAVING
    count(votante) > 3
GROUP BY dni
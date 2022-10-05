SELECT
    dni, count(votante)
FROM
    votantes
JOIN
    consultas
ON
    votantes.dni = consultas.votante
HAVING
    count(votante) > (
        SELECT
            avg(count(votante))
        FROM
            consultas
        GROUP BY votante
    )
GROUP BY dni
ORDER BY count(votante) DESC
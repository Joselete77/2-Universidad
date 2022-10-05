SELECT
    dni, count(votante)
FROM
    votantes
JOIN
    consultas
ON
    votantes.dni = consultas.votante
GROUP BY dni
ORDER BY count(votante) DESC

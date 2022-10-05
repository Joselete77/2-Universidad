SELECT 
    nombrecompleto nombre, count(votante) cuenta
FROM
    votantes
JOIN
    consultas
ON
    votantes.dni = consultas.votante
WHERE
    dni LIKE '%10%'
GROUP BY nombrecompleto
HAVING
    count(votante) > 3
ORDER BY cuenta ASC

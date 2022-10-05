SELECT
    nombrecompleto
FROM
    votantes
JOIN 
    consultas
ON
    votantes.dni = consultas.votante
WHERE
    situacionlaboral = 'Activo' 
HAVING
    count(votante) < (
        SELECT
            avg(count(votante))
        FROM
            consultas
        GROUP BY votante
    )
GROUP BY nombrecompleto
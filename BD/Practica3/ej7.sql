SELECT nombrecompleto
FROM votantes
JOIN consultas
ON votantes.dni = consultas.votante
HAVING count(votante) > (
    SELECT
        AVG(count(votante))
    FROM
        consultas
    GROUP BY 
        votante
)
GROUP BY nombrecompleto

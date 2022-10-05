SELECT dni, count(votante)
FROM votantes
JOIN consultas
ON votantes.dni = consultas.votante
HAVING COUNT(votante) > (
    SELECT 
        AVG(count(votante))
    FROM 
        consultas
    GROUP BY
        votante
)
GROUP BY dni 
ORDER BY count(votante) DESC
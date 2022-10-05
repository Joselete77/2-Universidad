SELECT nombrecompleto
FROM votantes
JOIN consultas
ON votantes.dni = consultas.votante
WHERE votantes.situacionlaboral LIKE 'Activo'
HAVING count(votante) < (SELECT avg(COUNT(votante)) FROM consultas GROUP BY votante) 
GROUP BY nombrecompleto
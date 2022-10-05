SELECT nombrecompleto 
FROM votantes
JOIN consultas
ON votantes.dni = consultas.votante
HAVING COUNT(evento)>3
GROUP BY nombrecompleto
ORDER BY count(evento) ASC

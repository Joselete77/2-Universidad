SELECT dni
FROM votantes
JOIN consultas
ON votantes.dni = consultas.votante
HAVING COUNT(evento)>3
GROUP BY dni

SELECT nombrecompleto
FROM partidos, consultas_datos 
WHERE partido = idpartido
GROUP BY nombrecompleto
HAVING count(partido)>10
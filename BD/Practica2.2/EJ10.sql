SELECT nombrecompleto, MAX(certidumbre)
FROM partidos
JOIN consultas_datos 
ON partidos.idpartido = consultas_datos.partido
GROUP BY nombrecompleto
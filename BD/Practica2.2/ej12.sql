SELECT nombrecompleto, AVG(certidumbre)
FROM votantes
JOIN consultas
ON votantes.dni = consultas.votante
JOIN consultas_datos
ON consultas.idconsulta = consultas_datos.consulta
WHERE respuesta='Si'
HAVING AVG(certidumbre)>0.5 AND AVG(certidumbre)<0.8
GROUP BY nombrecompleto
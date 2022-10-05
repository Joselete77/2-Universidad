SELECT nombrecompleto, count(partido) "conteo"
FROM partidos, consultas_datos
WHERE idpartido = partido AND respuesta = 'Si' AND certidumbre > 0.8
GROUP BY nombrecompleto
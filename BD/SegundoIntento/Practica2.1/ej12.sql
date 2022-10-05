SELECT
    nombrecompleto, avg(certidumbre)
FROM
    votantes
JOIN
    consultas
ON
    votantes.dni = consultas.votante
JOIN
    consultas_datos
ON
    consultas.idconsulta = consultas_datos.consulta
WHERE
    respuesta = 'Si'
HAVING
    avg(certidumbre) > 0.5 AND avg(certidumbre) < 0.8
GROUP BY nombrecompleto
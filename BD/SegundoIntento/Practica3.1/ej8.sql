SELECT 
    nombre
FROM
    localidades
JOIN
    votantes
ON
    localidades.idlocalidad = votantes.localidad
HAVING
    AVG(decode(estudiossuperiores, 'Ninguno', 0, 'Basicos', 1, 'Superiores', 2, 'Doctorado', 3)) > ALL (
        SELECT
            AVG(decode(estudiossuperiores, 'Ninguno', 0, 'Basicos', 1, 'Superiores', 2, 'Doctorado', 3))
        FROM
            votantes
        JOIN
            localidades
        ON
            votantes.localidad = localidades.idlocalidad
        GROUP BY provincia
    )
GROUP BY nombre
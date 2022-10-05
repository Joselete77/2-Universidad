SELECT nombre
FROM localidades
JOIN votantes
ON localidades.idlocalidad = votantes.localidad
HAVING AVG(decode(estudiossuperiores, 'Ninguno', 0, 'Basicos', 1, 'Superiores', 2, 'Doctorado', 3)) > ALL (
    SELECT
        AVG(decode(estudiossuperiores, 'Ninguno', 0, 'Basicos', 1, 'Superiores', 2, 'Doctorado', 3))
    FROM
        localidades, votantes
    WHERE
        localidades.idlocalidad = votantes.localidad
    GROUP BY
        localidades.provincia
)
GROUP BY localidades.nombre 
ORDER BY AVG(decode(estudiossuperiores, 'Ninguno', 0, 'Basicos', 1, 'Superiores', 2, 'Doctorado', 3)) desc

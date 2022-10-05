SELECT
    nombre
FROM
    localidades
JOIN
    votantes
ON
    localidades.idlocalidad = votantes.localidad
GROUP BY nombre
ORDER BY avg(decode(estudiossuperiores,'Ninguno',0,'Básicos',1,'Superiores',2,'Doctorado',3)) DESC
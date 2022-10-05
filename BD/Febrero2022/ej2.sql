SELECT
    nombre, avg(decode(estudiossuperiores,'Ninguno',0,'Básicos',1,'Superiores',2,'Doctorado',3)) media
FROM 
    localidades
JOIN 
    votantes
ON
    localidades.idlocalidad = votantes.localidad
GROUP BY nombre
HAVING
    avg(decode(estudiossuperiores,'Ninguno',0,'Básicos',1,'Superiores',2,'Doctorado',3)) > (
        SELECT
            avg(decode(estudiossuperiores,'Ninguno',0,'Básicos',1,'Superiores',2,'Doctorado',3))
        FROM 
            votantes
        JOIN 
            localidades
        ON
            localidades.idlocalidad = votantes.localidad
        JOIN
            provincias
        ON
            localidades.provincia = provincias.idprovincia
    )
    
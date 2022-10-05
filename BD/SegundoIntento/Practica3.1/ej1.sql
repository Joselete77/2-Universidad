SELECT
    substr(nombrecompleto,1,INSTR(nombrecompleto,' ')) nombre , localidades.nombre localidad, provincias.comunidad comunidad
FROM
    votantes
JOIN
    localidades
ON
    votantes.localidad = localidades.idlocalidad
JOIN    
    provincias
ON
    localidades.provincia = provincias.idprovincia
WHERE
    localidades.idlocalidad LIKE decode(votantes.localidad, 1, votantes.localidad, 3, votantes.localidad, 9, votantes.localidad)

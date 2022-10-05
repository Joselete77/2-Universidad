SELECT
    nombrecompleto, nombre
FROM
    votantes, localidades
WHERE
    localidades.idlocalidad LIKE decode(votantes.localidad,1,9,2,9,3,9,votantes.localidad)
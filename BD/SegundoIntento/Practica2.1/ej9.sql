SELECT 
    nombrecompleto, nombre
FROM
    votantes
JOIN 
    localidades
ON
    votantes.localidad = localidades.idlocalidad
JOIN
    consultas
ON
    votantes.dni = consultas.votante
WHERE
    numerohabitantes > 300000


SELECT nombrecompleto, nombre
FROM votantes
JOIN localidades
ON votantes.localidad = localidades.idlocalidad
WHERE numerohabitantes>300000

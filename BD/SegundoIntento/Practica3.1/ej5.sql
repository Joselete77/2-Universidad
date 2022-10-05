SELECT
    localidades.nombre, localidades.numerohabitantes, provincias.comunidad
FROM
    localidades
JOIN
    provincias
ON
    localidades.provincia = provincias.idprovincia
WHERE
    localidades.provincia LIKE decode(provincias.idprovincia,1,provincias.idprovincia,2,provincias.idprovincia,3,provincias.idprovincia) AND
    localidades.numerohabitantes > ANY(SELECT numerohabitantes FROM localidades WHERE provincia=4)
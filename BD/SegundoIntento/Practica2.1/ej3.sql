SELECT
    localidades.nombre, provincias.nombre
FROM
    localidades
JOIN
    provincias
ON 
    localidades.provincia = provincias.idprovincia
WHERE
    substr(to_char(localidades.numerohabitantes),-1,1) LIKE to_char(localidades.provincia)
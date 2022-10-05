SELECT localidades.nombre "Localidad", localidades.numerohabitantes "Habitantes", provincias.comunidad "Comunidad"
FROM localidades
JOIN provincias
ON localidades.provincia = provincias.idprovincia
WHERE provincias.idprovincia LIKE decode(provincias.idprovincia, 1, provincias.idprovincia, 2, provincias.idprovincia, 3, provincias.idprovincia)
AND localidades.numerohabitantes > ANY(SELECT numerohabitantes FROM localidades WHERE provincia=4)
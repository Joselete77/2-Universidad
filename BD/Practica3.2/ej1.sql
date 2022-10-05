SELECT substr(nombrecompleto,1,instr(nombrecompleto,' ')) "Nombre",localidades.nombre "Localidad", comunidad "Comunidad"
FROM votantes, localidades, provincias
WHERE votantes.localidad = localidades.idlocalidad 
AND localidades.provincia = provincias.idprovincia
AND localidades.idlocalidad LIKE decode(votantes.localidad, 1,  votantes.localidad, 3, votantes.localidad, 9, votantes.localidad)
SELECT nombrecompleto, nombre
FROM votantes, localidades
WHERE localidades.idlocalidad LIKE decode(votantes.localidad,1,9,2,9,3,9,votantes.localidad)
/*Decode funciona como un if/else, compara la localidad del votante si es 1 se convierte en 9, si es 2 es 9... si no es ninguno se queda con esa localidad*/
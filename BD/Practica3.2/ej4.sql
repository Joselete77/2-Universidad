SELECT nombrecompleto, localidad, decode(SIGN(18-TRUNC((SYSDATE-fechanacimiento)/365)),1,'Menor de edad', 'Mayor de edad') "Mayoria de edad"
FROM votantes
WHERE localidad IN (2,4,8);
/*TAMBIEN SE PUEDE HACER CON DECODE -> WHERE localidad LIKE decode(localidad,2,localidad,4,localidad,8,localidad)*/
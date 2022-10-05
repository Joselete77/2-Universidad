SELECT
    nombrecompleto, localidad, decode(SIGN(18-trunc((sysdate-fechanacimiento)/365)),1,'Menor de edad','Mayor de edad') "Mayoria de edad"
FROM
    votantes
WHERE
    localidad IN(2,4,8)
    
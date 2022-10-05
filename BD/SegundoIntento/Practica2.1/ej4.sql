SELECT
    nombrecompleto
FROM
    votantes
WHERE
    substr(to_char(telefono),-1,1) LIKE substr(to_char(dni),-1,1)
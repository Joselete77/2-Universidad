SELECT
    nombrecompleto
FROM
    votantes
WHERE
    substr(dni,-1,1) = localidad+1
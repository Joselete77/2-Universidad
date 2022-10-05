SELECT
    dni
FROM
    votantes
WHERE
    telefono LIKE '%6%6%'and telefono NOT LIKE '%6%6%6%'
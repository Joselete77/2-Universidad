SELECT
    dni
FROM
    votantes
WHERE
    telefono LIKE '%6%66%' OR telefono LIKE '%66%6%' OR telefono LIKE '%666%' AND telefono NOT LIKE '%6%6%6%6%'
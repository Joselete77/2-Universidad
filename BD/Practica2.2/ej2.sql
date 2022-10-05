SELECT dni
FROM votantes
WHERE TO_CHAR(telefono) LIKE '%66%6%'
OR TO_CHAR(telefono) LIKE  '%6%66%'
OR TO_CHAR(telefono) LIKE  '%666%'
AND TO_CHAR(telefono) NOT LIKE '%6%6%6%6%';
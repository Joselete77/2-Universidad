SELECT nombrecompleto
FROM votantes
WHERE nombrecompleto LIKE '%s%' AND fechanacimiento < '12/2/1990'
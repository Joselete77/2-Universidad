SELECT nombrecompleto 
FROM votantes
WHERE substr(to_char(dni),-1,1) = (localidad+1)

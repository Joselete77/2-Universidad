set serveroutput on;

DECLARE
CURSOR c IS SELECT dni, count(votante) veces
FROM votantes
JOIN consultas
ON votantes.dni = consultas.votante
GROUP BY dni 
HAVING 
count(votante) > (
    SELECT 
        avg(count(votante)) 
    FROM 
        consultas
    GROUP BY
        votante
    ) 
ORDER BY count(votante) DESC;

BEGIN
    FOR linea IN c LOOP
        dbms_output.put_line(linea.dni ||' ha participado '||linea.veces||' veces');
    END LOOP;
END;
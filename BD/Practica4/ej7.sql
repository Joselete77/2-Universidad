set serveroutput on;

DECLARE
v_apellido1 votantes.nombrecompleto%TYPE;
v_apellido2 votantes.nombrecompleto%TYPE;

BEGIN
SELECT 
    substr(nombrecompleto,INSTR(nombrecompleto,' '),INSTR(nombrecompleto,' ')-2) 
INTO 
    v_apellido1 
FROM 
    votantes 
WHERE 
    fechanacimiento = (
        SELECT
            max(fechanacimiento)
        FROM 
            votantes
        WHERE
            fechanacimiento < (
            SELECT
                max(fechanacimiento)
            FROM 
                votantes
            )
    );
    
SELECT 
    substr(nombrecompleto,INSTR(nombrecompleto,' '), INSTR(nombrecompleto,' ')+2) 
INTO
    v_apellido2
FROM 
    votantes
WHERE
    fechanacimiento = (
        SELECT
            max(fechanacimiento)
        FROM votantes
    );

DBMS_OUTPUT.PUT_LINE('El hijo se llama Juan'||v_apellido1||v_apellido2);

END;
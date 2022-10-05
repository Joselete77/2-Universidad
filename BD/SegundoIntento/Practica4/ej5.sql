set serveroutput on;

DECLARE
v_nombre votantes.nombrecompleto%type;
v_dni votantes.dni%type;

BEGIN
    SELECT 
        nombrecompleto, dni
    INTO
        v_nombre, v_dni
    FROM
        votantes
    WHERE
        fechanacimiento = (
            SELECT
                min(fechanacimiento)
            FROM
                votantes
        );
    dbms_output.put_line('El señor '||v_nombre||' con dni '||v_dni||' es el votante mas longevo');
END;
set serveroutput on;

DECLARE
j_nombre votantes.nombrecompleto%type;
j_correo votantes.email%type;
v_nombre votantes.nombrecompleto%type;
v_correo votantes.email%type;

BEGIN
    SELECT 
        nombrecompleto, email
    INTO
        j_nombre, j_correo
    FROM
        votantes
    WHERE
        fechanacimiento = (
            SELECT
                max(fechanacimiento)
            FROM
                votantes
        );
    SELECT 
        nombrecompleto, email
    INTO
        v_nombre, v_correo
    FROM
        votantes
    WHERE
        fechanacimiento = (
            SELECT
                min(fechanacimiento)
            FROM
                votantes
        );
    dbms_output.put_line(v_nombre||' -- Email: '||v_correo);
    dbms_output.put_line(j_nombre||' -- Email: '||j_correo);
END;

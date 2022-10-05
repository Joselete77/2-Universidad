set serveroutput on;

DECLARE
a_apellido votantes.nombrecompleto%type;
b_apellido votantes.nombrecompleto%type;

BEGIN
    SELECT
        substr(nombrecompleto,INSTR(nombrecompleto,' '),INSTR(nombrecompleto,' ')-2) 
    INTO
        a_apellido
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
        b_apellido
    FROM
        votantes
    WHERE
        fechanacimiento = (
            SELECT
                max(fechanacimiento)
            FROM 
                votantes
        );
    dbms_output.put_line('El hijo se llama Juan'||a_apellido||b_apellido);
END;
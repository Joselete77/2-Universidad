set serveroutput on;

DECLARE
CURSOR c IS SELECT nombreCompleto FROM votantesantiguos;
numero NUMBER := 0;

BEGIN
    FOR linea IN c LOOP
        dbms_output.put_line('Se han insertado a '||linea.nombrecompleto);
        numero := numero +1;
    END LOOP;
    dbms_output.put_line('Se han insertado un total de '||numero||' votantes');
END;
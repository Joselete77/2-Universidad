set serveroutput on;

DECLARE
CURSOR c IS SELECT dni FROM votantes ORDER BY dni DESC;
dniN votantes.dni%type;

BEGIN
    FOR linea IN c LOOP
        IF dniN IS NULL THEN dniN := linea.dni;
        ELSE
            dbms_output.put_line(dniN||' va antes que '||linea.dni);
            dniN := linea.dni;
        END IF;
    END LOOP;
dbms_output.put_line(dniN||' es el menor');
END;
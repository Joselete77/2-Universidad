set serveroutput on;

DECLARE
CURSOR c IS SELECT dni FROM votantes ORDER BY dni DESC;
dniA votantes.dni%type;

BEGIN
    FOR fila IN c LOOP
        IF dniA is NULL THEN dniA := fila.dni;
        ELSE
            dbms_output.put_line(dniA||' antes '||fila.dni);
            dniA := fila.dni;
        END IF;
    END LOOP;
dbms_output.put_line(dniA||' es el menor');
END;
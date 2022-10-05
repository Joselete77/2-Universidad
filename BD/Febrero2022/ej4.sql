set serveroutput on;

DECLARE
CURSOR c IS SELECT dni FROM votantes ORDER BY dni DESC;
dniA votantes.dni%type;

BEGIN
    FOR linea IN c LOOP
        IF dniA is null then 
            dniA := linea.dni;
        ELSE
            IF  MOD(dniA,2) = 0 AND MOD(linea.dni,2) = 0 then
                dbms_output.put_line(dniA||' va antes que '||linea.dni);
                dniA := linea.dni;
            END IF;
        END IF;
    END LOOP;
END;

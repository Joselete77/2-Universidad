set serveroutput on;

DECLARE
CURSOR c IS SELECT idlocalidad, numerohabitantes FROM localidades ORDER BY idlocalidad ASC;
a NUMBER :=0;
contador NUMBER := 0;
localidades NUMBER := 0;

BEGIN
    FOR linea IN c LOOP
        contador := contador+1;
        IF contador < 3 THEN
            a := linea.numerohabitantes + a;
        END IF;
    END LOOP;
    
    FOR linea in c LOOP
        IF linea.numerohabitantes > a THEN
            localidades := localidades + 1;
        END IF;
    END LOOP;

dbms_output.put_line('Hay '||localidades||' ciudades con mas habitantes de '||a||' habitantes, que es la suma de las dos localidades con IDs mas pequeños');
END;
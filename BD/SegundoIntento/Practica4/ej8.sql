set serveroutput on;

DECLARE 
CURSOR c IS SELECT numerohabitantes, idlocalidad FROM localidades ORDER BY idlocalidad ASC;
habitantes NUMBER :=0;
ciudades NUMBER :=0;

BEGIN
    FOR linea IN c LOOP
        habitantes := habitantes + linea.numerohabitantes;
        
        if linea.idlocalidad > 1 then EXIT;
        END IF;
    END LOOP;
    
    FOR i IN c LOOP
        if i.numerohabitantes > habitantes THEN
            ciudades := ciudades + 1;
        end if;
    end loop;
dbms_output.put_line('Hay '||ciudades||' con mas habitantes de '||habitantes||' habitantes, que es la suma de las dos localidades con IDs mas pequeños');
END;
        
        
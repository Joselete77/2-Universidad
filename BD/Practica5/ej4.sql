set serveroutput on;

DECLARE
CURSOR c IS SELECT nombrecompleto, nombre FROM votantes, localidades WHERE localidades.idlocalidad LIKE decode(votantes.localidad,1,9,2,9,3,9,votantes.localidad);
contador NUMBER :=0;

BEGIN
FOR fila IN c LOOP
    dbms_output.put_line(fila.nombrecompleto||' es de '||fila.nombre);
    IF fila.nombre LIKE 'Madrid' THEN contador:= contador+1;
    END IF;
END LOOP;
dbms_output.put_line('Hay un total de '||contador||' votantes de Madrid');
END;
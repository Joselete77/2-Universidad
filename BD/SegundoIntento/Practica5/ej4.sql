set serveroutput on;

DECLARE
CURSOR c IS SELECT nombrecompleto, nombre FROM votantes,localidades WHERE localidades.idlocalidad LIKE decode(votantes.localidad,1,9,2,9,3,9,votantes.localidad);
contador NUMBER := 0;

BEGIN
    FOR linea IN c LOOP
    dbms_output.put_line(linea.nombrecompleto||' es de '||linea.nombre);
    if linea.nombre LIKE 'Madrid' then
        contador := contador + 1;
    end if;
    end loop;
dbms_output.put_line('Hay un total de '||contador||' votantes de Madrid');
END;        
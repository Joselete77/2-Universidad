set serveroutput on;

DECLARE
CURSOR c IS SELECT nombrecompleto FROM votantes WHERE substr(dni,-1,length(dni)) = localidad+1;
numero NUMBER :=0;

BEGIN
    FOR linea IN c LOOP
        numero := numero+1;
        dbms_output.put_line(linea.nombrecompleto);
    END LOOP;
    dbms_output.put_line('Hay un total de '||numero||' votantes');
END;
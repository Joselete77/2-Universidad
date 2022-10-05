set serveroutput on;

DECLARE
CURSOR c IS SELECT nombrecompleto FROM votantes WHERE substr(dni,-1,length(dni)) = localidad+1;
numero NUMBER :=0;
v_nombre votantes.nombrecompleto%type;

BEGIN
    open c;
    LOOP
        FETCH c INTO v_nombre;
        exit when c%notfound;
        numero := numero+1;
        dbms_output.put_line(v_nombre);
    END LOOP;
    close c;
    dbms_output.put_line('Hay un total de '||numero||' votantes');
END;
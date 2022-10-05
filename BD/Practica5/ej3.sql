set serveroutput on;

DECLARE
CURSOR c IS SELECT nombrecompleto FROM votantes WHERE substr(dni, -1, length(dni)) LIKE localidad+1; 
contador NUMBER := 0;
v_nombre votantes.nombrecompleto%type;

BEGIN
    open c;
    FETCH c INTO v_nombre;
    while (c%found) LOOP
    dbms_output.put_line(v_nombre);
    contador := contador+1;
    close c;
    end loop;
dbms_output.put_line('Hay un total de '||contador||' votantes');
end;
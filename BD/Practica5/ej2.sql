set serveroutput on;

DECLARE 
CURSOR c IS SELECT nombrecompleto FROM votantes WHERE substr(dni, -1, length(dni)) LIKE localidad+1; 
v_nombre votantes.nombrecompleto%type;
contador NUMBER :=0;

BEGIN
open c;
loop
    fetch c into v_nombre;
    exit when c%notfound;
    dbms_output.put_line(v_nombre);
    contador := contador+1;
end loop;
close c;
    dbms_output.put_line('Hay un total de '||contador||' votantes');
END;
    
    
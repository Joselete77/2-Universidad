set serveroutput on;

DECLARE
CURSOR c IS SELECT nombrecompleto FROM votantes WHERE substr(dni, -1, length(dni)) LIKE localidad+1; 
contador NUMBER :=0;

BEGIN
FOR nombre IN c LOOP
    DBMS_OUTPUT.PUT_LINE(nombre.nombrecompleto);
    contador := contador+1;
END LOOP;
    DBMS_OUTPUT.PUT_LINE('Hay un total de '||contador||' votantes');
END;
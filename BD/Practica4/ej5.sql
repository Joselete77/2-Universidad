set serveroutput on;

DECLARE
v_nombre votantes.nombrecompleto%TYPE;
v_dni votantes.dni%TYPE;

BEGIN
SELECT nombrecompleto, dni INTO v_nombre, v_dni FROM votantes WHERE fechanacimiento = (SELECT min(fechanacimiento) FROM votantes);
DBMS_OUTPUT.PUT_LINE('El señor '||v_nombre||' con dni '||v_dni||' es el votante mas longevo');

END;
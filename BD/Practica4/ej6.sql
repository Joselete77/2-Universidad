set serveroutput on;

DECLARE
v_nombre votantes.nombrecompleto%TYPE;
j_nombre votantes.nombrecompleto%TYPE;
v_correo votantes.email%TYPE;
j_correo votantes.email%TYPE;

BEGIN
SELECT nombrecompleto, email INTO v_nombre, v_correo FROM votantes WHERE fechanacimiento = (SELECT min(fechanacimiento) FROM votantes);
SELECT nombrecompleto, email INTO j_nombre, j_correo FROM votantes WHERE fechanacimiento = (SELECT max(fechanacimiento) FROM votantes);
DBMS_OUTPUT.PUT_LINE(v_nombre||' -- Email: '|| v_correo);
DBMS_OUTPUT.PUT_LINE(j_nombre||' -- Email: '|| j_correo);

END;
set serveroutput on;

DECLARE
v_nombre votantes.nombrecompleto%TYPE;
v_correo votantes.email%TYPE;
mydni NUMBER := 30983712;

BEGIN
SELECT SUBSTR(nombrecompleto,1,INSTR(nombrecompleto,' ')), email INTO v_nombre, v_correo FROM votantes WHERE dni=mydni;
DBMS_OUTPUT.PUT_LINE(v_nombre||' con correo: '||v_correo);

END;
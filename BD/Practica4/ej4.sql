set serveroutput on;

DECLARE
v_nombre votantes.nombrecompleto%TYPE;
mydni NUMBER := 30983712;

BEGIN
SELECT SUBSTR(nombrecompleto,INSTR(nombrecompleto,' '), LENGTH(nombrecompleto)) INTO v_nombre FROM votantes WHERE dni=mydni;
DBMS_OUTPUT.PUT_LINE('Pepe'||v_nombre);

END;
set serveroutput on

DECLARE

v_nombre votantes.nombrecompleto%TYPE;
v_correo votantes.email%TYPE;
mydni NUMBER := 30983712;

BEGIN
SELECT nombrecompleto, email INTO v_nombre, v_correo FROM votantes where dni=mydni;
DBMS_OUTPUT.PUT_LINE(v_nombre||' con correo: '||v_correo);

END;
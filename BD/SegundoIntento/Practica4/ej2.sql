set serveroutput on;

DECLARE
v_nombre votantes.nombrecompleto%type;
v_correo votantes.email%type;

BEGIN
    SELECT nombrecompleto, email INTO v_nombre, v_correo FROM votantes WHERE dni=30983712;
    dbms_output.put_line(v_nombre||' con correo '||v_correo);
END;
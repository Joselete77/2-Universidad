set serveroutput on;

DECLARE
v_nombre votantes.nombrecompleto%type;

BEGIN
    SELECT nombrecompleto INTO v_nombre FROM votantes WHERE dni=30983712;
    dbms_output.put_line('Pepe'||substr(v_nombre,instr(v_nombre,' '),length(v_nombre)));
END;
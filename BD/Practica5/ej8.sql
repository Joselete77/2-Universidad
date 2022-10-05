set serveroutput on;

DECLARE 
CURSOR c IS SELECT nombreCompleto FROM votantesAntiguos;
contador NUMBER := 0;

BEGIN
    FOR fila IN c LOOP
    dbms_output.put_line(fila.nombreCompleto||' tiene '||length(substr(fila.nombreCompleto, 1, instr(fila.nombrecompleto,' ')-1))||' letras');
    contador := contador + length(substr(fila.nombreCompleto, 1, instr(fila.nombrecompleto,' ')-1));
    END LOOP;
dbms_output.put_line('En total hay '||contador||' letras');
END;
    
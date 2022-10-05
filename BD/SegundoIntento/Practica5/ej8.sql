set serveroutput on;

DECLARE
CURSOR c IS SELECT nombreCompleto FROM votantesantiguos;
contador NUMBER :=0;

BEGIN
    FOR linea IN c LOOP
    dbms_output.put_line(linea.nombreCompleto||' tiene '||length(substr(linea.nombreCompleto,1,instr(linea.nombreCompleto,' ')-1))||' letras');
    contador := contador + length(substr(linea.nombreCompleto,1,instr(linea.nombreCompleto,' ')-1));
    END LOOP;
    dbms_output.put_line('En total hay '||contador||' letras');
END;
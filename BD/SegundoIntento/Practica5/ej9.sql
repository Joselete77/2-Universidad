set serveroutput on;

DECLARE
CURSOR c IS SELECT nombreCompleto, fechanacimiento FROM votantesantiguos ORDER BY fechanacimiento;
CURSOR p IS SELECT nombreCompleto, fechanacimiento FROM votantesantiguos ORDER BY fechanacimiento;
v_fecha votantesantiguos.fechanacimiento%type;
numero NUMBER := 0;
contador NUMBER :=0;

BEGIN
    FOR linea IN c LOOP
        numero := length(substr(linea.nombreCompleto,1,instr(linea.nombreCompleto,' ')-1));
        
        FOR fila IN p LOOP
            IF numero > length(substr(fila.nombreCompleto,1,instr(fila.nombreCompleto,' ')-1)) THEN
                dbms_output.put_line(linea.nombreCompleto||' tiene mas letras que los siguientes jovenes: '||fila.nombreCompleto);
                contador := contador + 1;
            ELSE
                contador := 0;
            END IF;
        END LOOP;
        IF contador <1 THEN dbms_output.put_line(linea.nombreCompleto||' tiene mas letras que los siguientes mas jovenes: Nadie cumple esta condicion');
        END IF;
    END LOOP;
END;

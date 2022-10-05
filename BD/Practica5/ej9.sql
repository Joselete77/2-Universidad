set serveroutput on;

DECLARE
CURSOR c IS SELECT nombreCompleto, fechaNacimiento FROM votantesAntiguos ORDER BY fechaNacimiento ASC;
persona votantes.nombreCompleto%type;

BEGIN
    FOR fila IN c LOOP
        IF persona IS NULL THEN persona := fila.nombreCompleto;
        ELSE
            IF substr(persona,1,instr(persona,' ')-1) > substr(fila.nombreCompleto,1,instr(fila.nombreCompleto,' ')-1) THEN
                dbms_output.put_line(persona||' tiene mas letras que los siguientes mas jovenes '||fila.nombreCompleto);
            ELSE
                dbms_output.put_line(persona||' tiene mas letras que los siguientes mas jovenes: ');
                dbms_output.put_line('Nadie cumple esta condicion');
                persona := fila.nombreCompleto;
            END IF;
        END IF;
    END LOOP;
END;
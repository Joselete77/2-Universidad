set serveroutput on;

DECLARE
CURSOR c IS SELECT * FROM votantes WHERE fechanacimiento < '01/01/1980';
contador NUMBER := 0;

BEGIN
FOR fila IN c LOOP
    IF fila.situacionlaboral LIKE 'Activo' THEN
    dbms_output.put_line(fila.nombreCompleto);
    insert into votantesAntiguos
    values (fila.dni, fila.nombreCompleto, fila.estudiosSuperiores, fila.situacionLaboral, fila.email, fila.localidad, fila.fechanacimiento, fila.telefono, 1500);
    contador := contador+1;
    
    ELSE
    dbms_output.put_line(fila.nombreCompleto);
    insert into votantesAntiguos
    values (fila.dni, fila.nombreCompleto, fila.estudiosSuperiores, fila.situacionLaboral, fila.email, fila.localidad, fila.fechanacimiento, fila.telefono, 0);
    contador := contador+1;
    
    END IF;
END LOOP;
dbms_output.put_line('Se han insertado '||contador||' votantes');
END;
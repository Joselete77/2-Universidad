set serveroutput on;

DECLARE
CURSOR c IS SELECT dni, substr(nombrecompleto, 1, instr(nombrecompleto,' ')-1) nombre, substr(nombrecompleto, instr(nombrecompleto,' '), length(nombrecompleto)) apellidos, fechanacimiento, email, estudiossuperiores FROM votantes WHERE fechanacimiento > '12/12/1989';
sueldo NUMBER := 0;
dinero NUMBER := 0;

BEGIN
    FOR linea IN c LOOP
        sueldo := 0;
        
        if linea.estudiossuperiores = 'Ninguno' then
            sueldo := length(linea.nombre) * 50;
            insert into jovenes values(linea.dni, linea.nombre, linea.apellidos, sueldo, linea.fechanacimiento, linea.email);
        end if;

        if linea.estudiossuperiores = 'Básicos' then
            sueldo := length(linea.nombre) * 100;
            insert into jovenes values(linea.dni, linea.nombre, linea.apellidos, sueldo, linea.fechanacimiento, linea.email);
        end if;

        if linea.estudiossuperiores = 'Superiores' then
            sueldo := length(linea.nombre) * 150;
            insert into jovenes values(linea.dni, linea.nombre, linea.apellidos, sueldo, linea.fechanacimiento, linea.email);
        end if;

        if linea.estudiossuperiores = 'Doctorado' then
            sueldo := length(linea.nombre) * 200;
            insert into jovenes values(linea.dni, linea.nombre, linea.apellidos, sueldo, linea.fechanacimiento, linea.email);
        end if;
        
        dinero := sueldo + dinero;
    
    END LOOP;
    
    dbms_output.put_line('Se necesitan '||dinero||' euros para pagar las nominas');
END;
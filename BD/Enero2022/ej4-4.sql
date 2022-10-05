set serveroutput on;

DECLARE
CURSOR c 
IS SELECT substr(nombrecompleto,1,instr(nombrecompleto,' ')-1) mote ,dni,nombre 
FROM votantes
JOIN localidades
ON votantes.localidad = localidades.idlocalidad
ORDER BY dni DESC;
persona votantes.dni%type;
ciudad localidades.nombre%type;
apodo votantes.nombrecompleto%type;

BEGIN
    FOR linea IN c LOOP
        if persona IS NULL THEN 
            persona:=linea.dni;
            ciudad:=linea.nombre;
            apodo:=linea.mote;
            
        else
            dbms_output.put_line(apodo||' de '||ciudad||' va antes que '||linea.mote||' de '||linea.nombre);
            persona:=linea.dni;
            ciudad:=linea.nombre;
            apodo:=linea.mote;
        end if;
    END LOOP;
END;

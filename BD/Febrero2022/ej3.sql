set serveroutput on;

DECLARE
CURSOR c
IS SELECT votantes.nombrecompleto, provincias.comunidad, localidades.numerohabitantes  
FROM votantes
JOIN localidades
ON votantes.localidad = localidades.idlocalidad
JOIN provincias
ON localidades.provincia = provincias.idprovincia
WHERE idlocalidad LIKE decode(localidad,1,9,2,9,3,9,localidad);
andalucia NUMBER :=0;
madrid NUMBER := 0;
habitM NUMBER := 0;
habitA NUMBER := 0;

BEGIN
    FOR linea IN c LOOP
        dbms_output.put_line('Nombre: '||linea.nombrecompleto||' Comunidad: '||linea.comunidad);
        if linea.comunidad = 'Andalucia' THEN 
            andalucia := andalucia +1;
            habitA := linea.numerohabitantes;
        end if;
        if linea.comunidad = 'Madrid' THEN madrid := madrid +1;
            habitM := linea.numerohabitantes;
        end if;  
    END LOOP;
    dbms_output.put_line('Votantes de andalucia: '||andalucia||' su representación es: '||andalucia/habitA);
    dbms_output.put_line('Votantes de madrid: '||madrid||' su representación es: '||madrid/habitM);
END;
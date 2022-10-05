create or replace trigger trigger13
before insert or update on votantes for each row

BEGIN
    if ((trunc(sysdate-:new.fechanacimiento)/365.25) > 49) AND :new.situacionlaboral != 'Jubilado' THEN
    insert into audit_table values('Votante con dni '||:new.dni||' tiene mas de 59 años y no esta jubilado','votantes');
    END IF;
END;
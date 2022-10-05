create or replace trigger trigger12
before INSERT or UPDATE on consultas for each row

BEGIN
    if :new.fecha > sysdate THEN
    insert into audit_table values('Hubo cambios en la fecha de '||:new.fecha||' a '||SYSDATE,'consultas');
    :new.fecha := sysdate;
    end if;
end;
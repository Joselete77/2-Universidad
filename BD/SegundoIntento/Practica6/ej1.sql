create or replace trigger trigger10
before update on eventos for each row

BEGIN
    insert into audit_table values(:old.nombre||' '||:new.nombre,'eventos');
END;
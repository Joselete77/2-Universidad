CREATE OR REPLACE TRIGGER trigger1
before update on eventos for each row
begin
    insert into audit_table values(:old.nombre||' '||:new.nombre, 'eventos');
end;
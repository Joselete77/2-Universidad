create or replace trigger trigger3
before insert or update on consultas for each row
begin
   if :new.fecha > SYSDATE then
      insert into audit_table values('Hubo cambios en la fecha de '||:new.fecha||' a '||SYSDATE,'consultas');
      :new.fecha := SYSDATE;
   end if;
end;
create or replace trigger trigger2
before update on localidades for each row
begin
   if :new.numerohabitantes > 4000000 or :new.numerohabitantes < 1 then
      :new.numerohabitantes := :old.numerohabitantes;
   end if;
end;
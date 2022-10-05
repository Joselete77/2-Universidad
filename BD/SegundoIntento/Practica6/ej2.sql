create or replace trigger trigger11
before update on localidades for each row

BEGIN
   if :new.numerohabitantes > 4000000 or :new.numerohabitantes < 1 then
      :new.numerohabitantes := :old.numerohabitantes;
   end if;
END;
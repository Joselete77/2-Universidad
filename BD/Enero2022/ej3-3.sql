create or replace trigger trigger20
after insert or update on jovenes for each row

BEGIN
    dbms_output.put_line(:new.nombre||' '||:new.sueldo);
END;
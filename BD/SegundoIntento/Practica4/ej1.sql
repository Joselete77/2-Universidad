set serveroutput on;

BEGIN
    dbms_output.put_line('Hola mundo, hoy es el dia '||sysdate);
END;
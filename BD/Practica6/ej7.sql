create or replace trigger trigger7
before insert on votantes for each row

begin
    if
        instr(:new.email,'@',1,1) > 0 AND /*compruebo que haya un @ desde la posicion 1 */
        length(substr(:new.email,1,instr(:new.email,'@'))) > 0 AND /*compruebo que la cadena antes del @ sea mayor a 0*/ 
        instr(:new.email,'.',substr(:new.email,instr(:new.email,'@'), length(:new.email)),1) > 0 AND /*compruebo que el . aparezca una vez entre el @ y el final del email*/
        length(substr(:new.email,instr(:new.email,'@'), instr(:new.email, '.'))) > 0 AND /*compruebo que desde el @ hasta el punto tenga una cadena mayor a 0 caracteres*/
        length(substr(:new.email,instr(:new.email,'.'),length(:new.email))) > 1 THEN /*compruebo que desde el punto hasta el final del email, exista una cadena mayor a 1*/
        insert into audit_table values('Agregado satisfactoriamente el email','votantes');
    end if;
end;
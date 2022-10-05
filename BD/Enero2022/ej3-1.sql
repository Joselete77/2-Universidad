DROP TABLE jovenes;

create table jovenes
    (dni number(8) primary key,
    nombre varchar2(64),
    apellidos varchar2(64),
    sueldo number(5),
    fechanacimiento date,
    email varchar2(32));
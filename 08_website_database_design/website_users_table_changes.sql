use loja;

show tables;
drop table clientes;
create table utilizadores(
  id_user int auto_increment primary key ,
  username varchar(15) not null ,
  email varchar(50) not null ,
  login date default current_timestamp,
  password varchar(20) not null
);
select * from paginas;

select * from utilizadores;

ALTER TABLE utilizadores MODIFY password VARCHAR(100) NOT NULL;
DELETE FROM utilizadores WHERE id_user BETWEEN 1 AND 3;



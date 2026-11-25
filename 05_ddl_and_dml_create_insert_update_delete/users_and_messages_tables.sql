create DATABASE ficha04;

use ficha04;

create table utelizadores(
  id int(11) primary key,
  nome varchar(30),
  genero enum('m','f'),
  dtaNascimento date,
  email varchar(150),
  morada varchar(120),
  nif char(9),
  login varchar(15),
  senha varchar(64),
  dtaRegisto datetime
);

select * from utelizadores;

create table  mensagens(
  id int(11) primary key ,
  assunto varchar(20),
  mensagem text,
  dtaRegisto datetime,
  IDUTELIZADOR int(11),
  constraint fk_um foreign key (IDUTELIZADOR) references utelizadores(id)
);

alter table utelizadores
modify id int(11) auto_increment;

alter table mensagens
modify id int(11) auto_increment;

select * from mensagens;

insert into utelizadores(nome, genero, dtaNascimento, email, morada, nif, login, senha, dtaRegisto) values('Ana Pedro', 'F', '2000-01-01', 'ana.pedro@gmai.com','Leiria', '123456789','ana.pedro','A#123!na',now());
select * from utelizadores;
insert into utelizadores(nome, genero, dtaNascimento, email, morada, nif, login, senha, dtaRegisto) values('António José', 'M', '1998-01-01','antonio.pedro@gmail.com','Leiria','98754321','antonio.pedro','A#123!ntonio', now());
select * from utelizadores;
insert into utelizadores(nome, genero, dtaNascimento, email, morada, nif, login, senha, dtaRegisto) values('Andreia Santos', 'F', '2001-01-01' ,'andreia.santos@gmail.com','Leiria' ,'111111111','andreia.santos','A#n!123dreia',NOW());
insert into utelizadores(nome, genero, dtaNascimento, email, morada, nif, login, senha, dtaRegisto) values('Miguel Sousa', 'F', '1995-01-01' ,'miguel.sousa@gmail.com','Leiria' ,'434343434','miguel.sousa','M#i!123guel',NOW());
select * from utelizadores;
select * from utelizadores;
update utelizadores set utelizadores.nome = UPPER(nome);
select * from utelizadores;
update utelizadores set utelizadores.morada = 'Rua dos Estudantes, Leiria' where id=1;
select * from utelizadores;
update utelizadores set utelizadores.nif = 12456789 where id=4;
select * from utelizadores;
insert into mensagens( assunto, mensagem, dtaregisto, idutelizador)
values ('base de dados','duvidas comando insert',now(),1);
select * from mensagens;
insert into mensagens(assunto, mensagem, dtaRegisto, IDUTELIZADOR) VALUES ('Bases de Dados','Dúvidas no comandos INSERT',now(),100);  -- nao funciona pois nao existe utilizador com id 100
insert into utelizadores(nome, genero, dtaNascimento, email, morada, nif, login, senha, dtaRegisto) VALUES ('Pedro Ferreira','M','1980-10-30','pedro.ferreira@gmail.com','Leiria','434343434','pedro.ferreira','P#!123edro',now());
update utelizadores set utelizadores.genero = 'A' where id=1; -- nao funciona pois o valor 'A' nao é aceite na enum apenas 'M' ou 'F'
delete from utelizadores where id=1; -- nao consigo pois esta conectado com outra tabela
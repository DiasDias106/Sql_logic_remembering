create database Forum;
use Forum;

create table utilizadores(
  id_user int auto_increment primary key ,
  username varchar(15) not null ,
  email varchar(50) not null ,
  login date default current_timestamp,
  password varchar(20) not null
);

select * from utilizadores;

CREATE TABLE paginas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    url VARCHAR(255) NOT NULL
);

select * from paginas;

create table jogo_dados(
  id_jogo int auto_increment primary key ,
  nome varchar(20) not null ,
  resultado enum('venceu','perdeu') not null ,
  aposta double(6,2) not null ,
  ganhos double(5,2) not null
);

use Forum;
ALTER TABLE utilizadores
ADD cargo ENUM('admin','user') not null default 'user';
use loja;
ALTER TABLE utilizadores
ADD cargo ENUM('admin','user') not null default 'user';





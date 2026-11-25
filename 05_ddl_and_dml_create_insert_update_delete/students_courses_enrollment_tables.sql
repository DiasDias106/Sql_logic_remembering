-- treino de conceitos sql
create database DBForum;

show databases ;

drop database DBForum;

create database if not exists BDForum;

use BDForum;

show tables ;

create database testar;
use testar;
CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE curso (
    id_curso INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE inscricao (
    id_aluno INT,
    id_curso INT,
    data_inscricao DATE,
    PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);
select * from inscricao;
select * from aluno;
INSERT INTO inscricao (id_aluno, id_curso, data_inscricao)
VALUES (1, 101, '2024-01-05');


create database ficha4sql;

use ficha4sql;

create table utilizadores(
    id int(11) unsigned primary key auto_increment,
    nome varchar(30) not null,
    gereno enum('m','f') not null default 'm',
    dtanascimento date not null,
    email varchar(150) not null,
    morada varchar(120) not null,
    nif char(9) not null,
    login varchar(15) not null,
    senha varchar(64) not null,
    dtaregisto datetime default current_timestamp);

create table mensagens(
    id int(11) unsigned primary key auto_increment,
    assunto varchar(20),
    mensagem text not null,
    dtaregisto datetime default current_timestamp,
    constraint fk_id foreign key (id) references utilizadores (id)
);

insert into utilizadores(nome, gereno, dtanascimento, email, morada, nif, login, senha, dtaregisto)
values ('Ana Pedro','f','2000-01-01','ana.pedro@gmail.com','leiria','123456789','ana.pedro','A#123!na',default),
       ('António José','m','1998-01-01','antonio.jose@gmail.com','leiria','987654321','antonio.jose','A#123!ntonio',default)


update utilizadores
set nome=upper(nome) where id between 1 and 2;

select nome from utilizadores order by nome desc;

update utilizadores
set morada = 'Rua dos Estudantes,Leiria' where id = 1;

select utilizadores.morada as m from utilizadores where id = 1;

-- nova ficha realização

use hr;
select * from departamentos;
select * from empregados,departamentos,escala_salarial;
select * from escala_salarial;

select distinct empregados.funcao from empregados order by funcao ASC ;

select distinct empregados.numdep from empregados order by numdep desc;

SELECT nomeemp, salario,
    CASE
        WHEN comissao IS NULL OR comissao = 0 THEN 'o empregado nao tem comissao'
        ELSE CAST(comissao AS DECIMAL(7,2))
    END AS comissao
FROM empregados
ORDER BY salario DESC, nomeemp ASC;

select empregados.nomeemp, numemp,salario from empregados where salario > 2000 order by salario desc;

SELECT CONCAT('o ', UPPER(empregados.nomeemp), ' e ', UPPER(empregados.funcao), ' no departamento ', empregados.numdep, ' desde ', DATE_FORMAT(dtacontratacao,'%d-%m-%y')) AS 'quem,onde,quando'
FROM empregados;




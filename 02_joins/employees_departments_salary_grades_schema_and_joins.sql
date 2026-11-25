DROP DATABASE IF EXISTS HR;
CREATE DATABASE HR;
USE HR;

/* script e criação de tabelas */

-- Criar a tabela departamento
CREATE TABLE  departamentos(
	numdep		INT UNSIGNED AUTO_INCREMENT,
	nomedep		VARCHAR(20) NOT NULL,
	localizacao	VARCHAR(20) NOT NULL,
    CONSTRAINT pk_departamentos_numdep PRIMARY KEY(numdep),
    CONSTRAINT uk_departamentos_nome_dep UNIQUE(nomedep)
) ENGINE=InnoDB;

-- Criar a tabela empregado
CREATE TABLE empregados(
	numemp			INT UNSIGNED AUTO_INCREMENT,
	nomeemp			VARCHAR(20) NOT NULL,
	funcao			VARCHAR(20) NOT NULL,
	chefe			INT UNSIGNED,
	dtaContratacao	DATE NOT NULL,
	salario			DECIMAL(7,2),
	comissao		DECIMAL(7,2),
	numdep			INT UNSIGNED NOT NULL,
    CONSTRAINT pk_empregados_numemp PRIMARY KEY(numemp),
    CONSTRAINT fk_empregados_chefe FOREIGN KEY(chefe) REFERENCES empregados(numemp),
    CONSTRAINT fk_empregados_numdep FOREIGN KEY(numdep) REFERENCES departamentos(numdep)
)ENGINE=InnoDB;

-- criar a tabela escala_salarial
CREATE TABLE escala_salarial(
	escala		INT UNSIGNED,
	minsal		MEDIUMINT UNSIGNED NOT NULL,
	maxsal		MEDIUMINT UNSIGNED NOT NULL,
    CONSTRAINT pk_escala_salarial PRIMARY KEY(escala)
)ENGINE=InnoDB;

/* INSERÇÃO DE DADOS NAS TABELAS */

-- Inserir dados na tabela DEPARTAMENTO
INSERT INTO departamentos (numdep,nomedep,localizacao) VALUES
(10,'Contabilidade','Lisboa'),
(20,'Pesquisa','Leiria'),
(30,'Vendas','Santarém'),
(40,'Operações','Coimbra');

-- Inserir dados na tabela EMPREGADO
INSERT INTO empregados(numemp,nomeemp,funcao,chefe,dtaContratacao,salario,comissao,numdep) VALUES
(7839,'Frederico','Presidente',NULL,'1981-11-17',5000,NULL,10),
(7566,'João','Director',7839,'1981-04-02',2975,NULL,20),
(7782,'Carlos','Director',7839,'1981-06-09',2450,NULL,10),
(7698,'Bernardo','Director',7839,'1981-05-01',2850,NULL,30),
(7788,'Sebastião','Analista',7566,'1987-04-19',3000,NULL,20),
(7844,'Tiago','Vendedor',7698,'1981-09-08',1500,0,30),
(7900,'Jaime','Escriturário',7698,'1981-12-03',950,NULL,30),
(7902,'Fernando','Analista',7566,'1981-12-03',3000,NULL,20),
(7369,'Silva','Escriturário',7902,'1980-12-17',800,NULL,20),
(7499,'Alexandre','Vendedor',7698,'1981-02-20',1600,300,30),
(7521,'Armando','Vendedor',7698,'1981-02-22',1250,500,30),
(7654,'Marco','Vendedor',7698,'1981-09-28',1250,1400,30),
(7876,'António','Escriturário',7788,'1987-05-23',1100,NULL,20),
(7934,'Mário','Escriturário',7782,'1982-01-23',1300,NULL,10);

-- Inserir dados na tabela ESCALA_SALARIAL
INSERT INTO escala_salarial (escala,minsal,maxsal) VALUES
(1,700,1200),
(2,1201,1400),
(3,1401,2000),
(4,2001,3000),
(5,3001,9999);


select * from departamentos
order by numdep asc ;

select * from empregados
order by numemp ASC ;

select * from escala_salarial
order by escala asc ;

select funcao from empregados
order by funcao asc;

SELECT distinct numdep
FROM Empregados
ORDER BY numdep desc ;

SELECT
    nomeemp,
    salario,
    CASE
        WHEN Comissao IS NULL OR Comissao = 0 THEN 'O empregado não tem comissão'
        ELSE CAST(Comissao AS Decimal(7,2))
    END AS Comissao
FROM
    Empregados
ORDER BY
    salario DESC,
    nomeemp ASC;


select numdep,nomeemp,salario from empregados
where salario > 2000
order by salario desc ;

SELECT
    CONCAT('O ',UCASE(nomeemp), ' É ', UCASE(funcao),
           ' no departamento ', numdep, ', desde ',
           DATE_FORMAT(dtaContratacao, '%d-%m-%Y')) AS "Quem, Onde, Quando"
FROM empregados;

SELECT
    CONCAT('O ', nomeemp, ' ganha ', FORMAT(salario, 2),
           ' mas queria ganhar ', FORMAT(salario * 3, 2),
           ' (3Xmais)') AS "3 VEZES MAIS"
FROM empregados
ORDER BY salario DESC;


select nomeemp,salario,comissao from empregados
where comissao>salario order by nomeemp asc ;


select nomeemp, funcao from empregados
where funcao in('Vendedor','Director') order by nomeemp asc;

select nomeemp,numdep from empregados where numdep = 10 or numdep=20
order by nomeemp asc ;

select nomeemp from empregados where nomeemp like 'M%';

select nomeemp from empregados where nomeemp like '%do';

select nomeemp from empregados where nomeemp like 'M%o';

select nomeemp from empregados where nomeemp like '%o%' order by nomeemp asc ;

select nomeemp from empregados where nomeemp like '%a%' and nomeemp not like 'a%' order by nomeemp asc ;

select nomeemp from empregados where nomeemp not like '%o%' order by nomeemp asc ;

select nomeemp,
    case
    when comissao is null then 'Sem Comissão'
    else cast(comissao as decimal (7,2))
end as Comissao
from empregados where comissao is null;

select nomeemp from empregados
where chefe is null;

select nomeemp, salario from empregados
where comissao is null and salario > 2000 order by salario desc;

select nomeemp, salario ,(salario + salario * 0.15) as Salario_Aumentado from empregados
order by salario desc ;

SELECT nomeemp,
       dtaContratacao AS Data_Contratacao,
       DATE_ADD(dtaContratacao, INTERVAL 1 YEAR) AS Primeira_Revisao_Salarial
FROM empregados
ORDER BY nomeemp DESC;

SELECT nomeemp,
       DATEDIFF(CURDATE(), dtaContratacao) AS Dias_Trabalhados
FROM empregados
WHERE chefe IS NULL;

SELECT nomeemp,
       TIMESTAMPDIFF(YEAR, dtaContratacao, CURDATE()) AS Anos_Trabalhados
FROM empregados
WHERE chefe IS NULL;

SELECT nomeemp,
       salario,
       CASE
           WHEN salario < 1500 THEN 'Menor que 1500'
           WHEN salario > 1500 THEN CAST(salario AS CHAR)
           WHEN salario = 1500 THEN 'Valor Exato'
       END AS resultado
FROM empregados;

-- Joins Exercicios

select nomeemp, d.numdep, localizacao ,nomedep from empregados e inner join departamentos d on e.numdep = d.numdep order by localizacao asc;

select nomeemp, salario ,d.nomedep, d.localizacao from empregados inner join departamentos d on empregados.numdep = d.numdep where empregados.salario >1500 order by nomeemp asc;

select nomeemp, funcao, d.nomedep , d.localizacao from empregados inner join departamentos d on empregados.numdep = d.numdep where empregados.funcao not in('analista') order by salario desc , nomeemp asc;

select e.nomeemp , s.escala from empregados e inner join escala_salarial s on salario>minsal and salario<maxsal order by escala asc , nomeemp asc;

select e.nomeemp , s.escala, d.nomedep from empregados e inner join escala_salarial s on salario>minsal and salario<maxsal inner join departamentos d on e.numdep = d.numdep order by escala asc , nomeemp asc;

select e.nomeemp , d.nomedep  from empregados e right join departamentos d on d.numdep = e.numdep order by nomeemp desc;

select case when empregados.nomeemp is null then 'NÂO TEM' else empregados.nomeemp end as nomeemp,departamentos.nomedep from empregados right join departamentos on empregados.numdep = departamentos.numdep order by nomeemp DESC;

select e.numemp AS "Número do Empregado", e.nomeemp AS "Nome do Empregado",case when e.chefe is null then 'SEM CHEFE' else e.chefe end AS "Número do Chefe", case when e.chefe is null then 'SEM CHEFE' else c.nomeemp end AS "Nome do Chefe" from empregados e left join empregados c on e.chefe = c.numemp order by c.nomeemp ASC;

select e.numemp AS "Número do Empregado", e.nomeemp AS "Nome do Empregado",case when e.chefe is null then 'SEM CHEFE' else e.chefe end AS "Número do Chefe", case when e.chefe is null then 'SEM CHEFE' else c.nomeemp end AS "Nome do Chefe" from empregados e left join empregados c on e.chefe = c.numemp where e.dtaContratacao < c.dtaContratacao order by c.numemp ASC;
select e.numemp AS "Número do Empregado", e.nomeemp AS "Nome do Empregado",case when e.chefe is null then 'SEM CHEFE' else e.chefe end AS "Número do Chefe", case when e.chefe is null then 'SEM CHEFE' else c.nomeemp end AS "Nome do Chefe" from empregados e left join empregados c on e.chefe = c.numemp where year(e.dtaContratacao) = year(c.dtaContratacao) order by c.numemp ASC;

select departamentos.localizacao as Cidade from departamentos inner join empregados e on departamentos.numdep = e.numdep where funcao = 'Director';

-- resolução correta

select empregados.nomeemp,empregados.numdep,departamentos.nomedep,departamentos.localizacao from empregados inner join departamentos on empregados.numdep = departamentos.numdep order by localizacao ASC;
select empregados.nomeemp,empregados.salario, departamentos.nomedep,departamentos.localizacao from empregados inner join departamentos on empregados.numdep = departamentos.numdep where salario >1500 order by nomeemp ASC;
select empregados.nomeemp,empregados.funcao,empregados.salario,departamentos.nomedep from empregados inner join departamentos on empregados.numdep = departamentos.numdep order by salario desc, nomeemp asc;
select empregados.nomeemp,escala_salarial.escala from empregados inner join escala_salarial on salario>minsal and salario<maxsal order by escala asC, nomeemp ASC;
select empregados.nomeemp,departamentos.nomedep,escala_salarial.escala from empregados inner join departamentos on empregados.numdep = departamentos.numdep inner join escala_salarial on salario>minsal and salario<maxsal order by escala ASC,nomedep ASC,nomeemp ASC;
select empregados.nomeemp,departamentos.nomedep from empregados right join departamentos on empregados.numdep = departamentos.numdep order by nomeemp DESC;
select case when empregados.nomeemp is null then 'NÂO TEM' else empregados.nomeemp end as nomeemp,departamentos.nomedep from empregados right join departamentos on empregados.numdep = departamentos.numdep order by nomeemp DESC;
select e.numemp AS "Número do Empregado", e.nomeemp AS "Nome do Empregado", e.chefe AS "Número do Chefe", c.nomeemp AS "Nome do Chefe" from empregados e inner join empregados c on e.chefe = c.numemp order by c.nomeemp ASC;
select e.numemp AS "Número do Empregado", e.nomeemp AS "Nome do Empregado",case when e.chefe is null then 'SEM CHEFE' else e.chefe end AS "Número do Chefe", case when e.chefe is null then 'SEM CHEFE' else c.nomeemp end AS "Nome do Chefe" from empregados e left join empregados c on e.chefe = c.numemp order by c.nomeemp ASC;
select e.numemp AS "Número do Empregado", e.nomeemp AS "Nome do Empregado", e.dtaContratacao as "DATA_CTR_EMP", e.chefe AS "Número do Chefe", c.nomeemp AS "Nome do Chefe", c.dtaContratacao as "DATA_CTR_CHEFE" from empregados e inner join empregados c on e.chefe = c.numemp where e.dtaContratacao<c.dtaContratacao order by c.nomeemp ASC;
select e.numemp AS "Número do Empregado", e.nomeemp AS "Nome do Empregado", e.dtaContratacao as "DATA_CTR_EMP", e.chefe AS "Número do Chefe", c.nomeemp AS "Nome do Chefe", c.dtaContratacao as "DATA_CTR_CHEFE" from empregados e inner join empregados c on e.chefe = c.numemp where year(e.dtaContratacao)=year(c.dtaContratacao) order by c.nomeemp ASC;
select distinct departamentos.localizacao as "CIDADE" from departamentos inner join empregados on departamentos.numdep = empregados.numdep;
select distinct departamentos.numdep,departamentos.localizacao from departamentos left join empregados on departamentos.numdep = empregados.numdep where empregados.numdep is null;
select e.numemp,e.nomeemp,concat('Exerce a funcao ', e.funcao, ' no departamento ', departamentos.nomedep, ' esta no escalao ', escala_salarial.escala) as "funcao,dep,escalao?", c.nomeemp as "nomechefe" from empregados e inner join  empregados c on e.chefe = c.numemp inner join departamentos on e.numdep = departamentos.numdep inner join escala_salarial on e.salario>minsal and e.salario<maxsal;
select empregados.numemp,empregados.nomeemp, case when timestampdiff(Year,empregados.dtaContratacao,curdate())>35 then 'Funcionario antigo' else timestampdiff(Year,empregados.dtaContratacao,curdate()) end as 'temposervico' from empregados;
select empregados.numemp,empregados.nomeemp, if(timestampdiff(Year,empregados.dtaContratacao,curdate())>35,'Funcionario antigo',timestampdiff(Year,empregados.dtaContratacao,curdate())) as 'temposervico' from empregados;









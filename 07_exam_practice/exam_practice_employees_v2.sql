use hr;
select e.numdep, nomeemp, nomedep , localizacao from empregados e inner join departamentos d on d.numdep = e.numdep order by localizacao ASC;

/*Escreva uma consulta para apresentar o nome e o salário dos empregados com salário mensal
superior a 1500€. Apresente para os empregados o nome e a localidade do departamento onde
trabalham. Mostre o resultado ordenado pelo nome do empregado.*/

select nomeemp , salario , nomedep , localizacao from empregados e inner join departamentos d on d.numdep = e.numdep where e.salario > 1500  order by nomeemp ASC;

select count(distinct chefe) as numero_chefes from empregados ;

select count(distinct numdep) as numero_de_departamentos_com_empregados from empregados where numdep is not null;

/*Escreva uma consulta que conte quantos diretores existem em cada departamento.*/

select numdep as Departamento , count(*) as numero_de_chefes from empregados where funcao = 'director' group by numdep;

select numdep as Departamentos , count(*) as numero_vendedores from empregados where numdep = 30 and funcao = 'vendedor' group by numdep;

select numdep as Departamento , count(*) as numero_empregados from empregados group by numdep having numero_empregados > 3 order by numero_empregados ASC;

select nomeemp , salario , case
    when comissao is null then 'Não tem Comissão'
    else comissao
end as Comissao
from empregados order by salario desc , nomeemp ASC;

select concat('o ',nomeemp ,' é ',funcao ,' no departamento ',numdep,' desde ',dtaContratacao) from empregados;

select nomeemp, funcao from empregados where funcao in ('vendedor','director') order by nomeemp;

select nomeemp , numdep from empregados where numdep in (10,20) order by numdep ASC;

select nomeemp from empregados where nomeemp like 'm%';

select nomeemp from empregados where nomeemp like '%do';

select nomeemp from empregados where nomeemp like 'm%o';

select nomeemp from empregados where nomeemp like '_%A%' order by nomeemp ASC;

select nomeemp from empregados where nomeemp not like '%o%';

/*Escreva uma consulta que apresente o nome dos empregados, o nome dos departamentos.
Apresente, também, na listagem o departamento que não está associado a nenhum empregado
(não tem empregados). Ordene por nome (decrescente).*/

select nomeemp, nomedep from empregados e right join departamentos d on e.numdep = d.numdep order by e.nomeemp DESC;

-- Altere a consulta anterior de forma a aparecer a expressão ‘NÃO TEM’ em vez de NULL.

select case
    when nomeemp is null then 'Nao tem'
    else nomeemp
    end as Nome, nomedep from empregados e right join departamentos d on e.numdep = d.numdep order by e.nomeemp DESC;

select * from empregados where salario < (select avg(salario) from empregados);

select * from empregados where salario = (select min(salario) from empregados);

select * from departamentos where numdep in (select numdep from empregados group by numdep having avg(salario) < (select avg(salario) from empregados));

select funcao as Função , count(*) as numero_empregados from empregados group by funcao order by numero_empregados ASC;

select numdep as Departamento , count(*) as numero_Empregados , max(salario) as maximo, min(salario) as minimo , round(avg(salario),2) as salario_medio
from empregados group by numdep order by salario_medio ASC;

/*Escreva uma consulta que determine, para cada função, o salário mensal médio e o volume salarial
anual. No cálculo do volume salarial anual dos empregados, utilize a fórmula 12*(salario+comissao).
Apresente o resultado ordenado por volume salarial (decrescente).*/

select funcao as Função, avg(salario) as media , ((salario + comissao)*12) as volume_salarial from empregados group by funcao order by volume_salarial DESC;

SELECT DATE_FORMAT(dtaContratacao, '%m-%Y') AS MES_CONTRATACAO, COUNT(*) AS
NUMERO_EMPREGADOS
FROM empregados
GROUP BY MES_CONTRATACAO
ORDER BY MES_CONTRATACAO ;

/*Escreva uma consulta que apresente o número de empregados com e sem chefe.

 */

 SELECT COUNT(chefe) AS EMP_COM_CHEFES, COUNT(*)-COUNT(chefe) AS EMP_SEM_CHEFES
FROM empregados;

/*Escreva uma consulta, que apresente para cada função, em cada departamento, a data de contratação
mais recente e a mais antiga, assim como a média salarial. Ordene alfabeticamente pelo departamento
e também pela função.*/

select nomedep , funcao , max(dtaContratacao) , min(dtaContratacao) , avg(salario) from empregados e inner join departamentos d on e.numdep = d.numdep group by funcao, nomedep order by nomedep ASC;

/*Apresente os nomes dos departamentos onde se praticam salários médios inferiores ao do
salário médio da empresa.*/

select nomedep, numdep, localizacao from departamentos where numdep in (select numdep from empregados group by numdep having avg(salario) < (select avg(salario) from empregados));

/*Apresente o nome dos departamentos que ainda não têm empregados.*/

select * from departamentos where numdep not in(select distinct numdep from empregados);

/*Escreva uma consulta que apresente o maior valor de todos os salários médios de cada
departamento.*/

select  round(max(calculo.media_salario),2) as maior_media from (select AVG(salario) as media_salario from empregados group by numdep) as calculo;

select nomeemp, funcao from empregados where funcao = 'vendedor' or funcao = 'director' order by nomeemp ASC;

select nomeemp, ifnull(comissao,'sem comissão') from empregados where comissao is null order by nomeemp ASC;


select localizacao from departamentos d inner join empregados e on d.numdep = e.numdep where funcao = 'director' order by localizacao DESC;


create trigger muda_cliente
    before insert on empregados
    begin
    
    end;


select nomeemp , salario , comissao from empregados where comissao > salario order by nomeemp ASC;

select localizacao from departamentos d inner join empregados e on d.numdep = e.numdep where funcao = 'director' order by localizacao DESC;


select d.numdep , localizacao from departamentos d inner join empregados e on e.numdep = d.numdep where e.numdep is null;

select count(chefe) from empregados;

select count( distinct chefe) from empregados;

select count(*) from empregados where funcao = 'director';

select count(*) as numero_diretores, numdep as Departamento from empregados where funcao = 'director' group by numdep;

select YEAR(dtacontratacao) as a , count(*) as numero from empregados group by a order by a DESC;

select nomedep as Departamento , sum(salario) as volume_s_mensal from empregados e inner join departamentos d on d.numdep = e.numdep where comissao is null group by nomedep order by nomedep ASC;

select count(chefe) as numero_chefes, count(*) - count(chefe) as semchefe from empregados

select nomedep , funcao ,max(dtaContratacao) , min(dtaContratacao),avg(salario) from empregados e inner join departamentos d on d.numdep = e.numdep group by nomedep,funcao order by nomedep ASC, funcao ASC;

select * from empregados e where e.dtaContratacao in (select max(dtaContratacao) from empregados where e.numdep = numdep);

select nomeemp as Nome_Emp , escala as Escala_Salarial from empregados e inner join escala_salarial s on (e.salario between s.minsal and s.maxsal) order by Escala_Salarial ASC,nomeemp ASC;

SELECT	e.numemp 	AS	NUM_EMP,
		e.nomeemp	AS	NOME_EMP,
        c.numemp	AS  NUM_CHEFE,
        c.nomeemp   AS	NOME_CHEFE
FROM	empregados e join empregados c ON (e.chefe=c.numemp)
ORDER BY 4 ASC;


use loja;
delete from figuras where id_figura = 24;



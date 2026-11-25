use hr;
select count(*) as 'Quantos_tem_chefe' from empregados where chefe is not null;
select count(distinct chefe) as 'Quantos_chefes' from empregados;
select count(*) as 'Quantos_tem_comissao' from empregados where comissao is not null;
select count(t.DEPARTAMENTOS_COM_EMPREGADOS) as DEPARTAMENTOS_COM_EMPREGADOS from (select count(*) as DEPARTAMENTOS_COM_EMPREGADOS from empregados group by numdep)t;
select sum(empregados.comissao) as valor_em_comissoes from empregados;
SELECT numdep AS DEPARTAMENTO, COUNT(*) AS NUMERO_DIRECTORES
FROM empregados
WHERE funcao='Director'
GROUP BY numdep;
SELECT numdep AS DEPARTAMENTO, COUNT(*) AS NUMERO_VENDEDORES
FROM empregados
WHERE funcao='Vendedor' AND numdep=30
GROUP BY numdep;
SELECT numdep AS DEPARTAMENTO, COUNT(*) AS NUMERO_EMPREGADOS
FROM empregados
GROUP BY numdep
ORDER BY 2 DESC;

select funcao as FUNCAO, count(*) as Numero_de_Empregados from empregados
group by funcao order by 2 asc ;

select funcao as FUNCAO, count(comissao) as Numero_de_Empregados from empregados
group by funcao order by 2 desc ;

select numdep as DEPARTAMENTO,count(numemp)  as numero_Empregados from empregados group by DEPARTAMENTO having count(numemp) >3  order by 2 asc;
select numdep as DEPARTAMENTO,count(*)  as numero_Empregados from empregados where funcao = 'vendedor' group by DEPARTAMENTO having count(funcao) >3;

select * from empregados limit 2,4;
SELECT YEAR(dtaContratacao) AS ANO_CONTRATACAO, COUNT(*) AS NUM_EMPREGADOS
FROM empregados
GROUP BY YEAR(dtaContratacao)
ORDER BY 1 DESC ;
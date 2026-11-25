use hr;
-- Escreva uma consulta que apresente o nome do empregado, o seu número de departamento e, ainda,
-- o nome do departamento onde trabalha seguido da respetiva localização. Ordene o resultado por
-- ordem alfabética de localização.

select e.nomeemp, e.numdep, d.nomedep, d.localizacao from empregados e inner join departamentos d on e.numdep = d.numdep order by localizacao asc;

-- Escreva uma consulta para apresentar o nome e o salário dos empregados com salário mensal
-- superior a 1500€. Apresente para os empregados o nome e a localidade do departamento onde
-- trabalham. Mostre o resultado ordenado pelo nome do empregado.

select e.nomeemp, e.salario , d.nomedep, d.localizacao from empregados e inner join departamentos d on e.numdep = d.numdep where e.salario > 1500 order by nomeemp ASC;

-- Escreva uma consulta que mostre o nome, a função, o salário, e o nome de departamento dos
-- empregados que não são analistas. Ordene por ordem decrescente do salário e alfabeticamente pelo
-- nome do empregado.

  select e.nomeemp, e.funcao, e.salario, d.nomedep from empregados e inner join departamentos d on d.numdep = e.numdep where e.funcao <> 'analista' order by e.salario desc , e.nomeemp asc;

-- Escreva uma consulta que apresente o nome dos empregados e a indicação da escala salarial a que
-- pertencem. Ordene primeiro por escala e depois alfabeticamente por nome do empregado.

select e.nomeemp,es.escala from empregados e inner join escala_salarial es on e.salario>es.minsal and e.salario<es.maxsal order by escala ASC, nomeemp ASC;

-- Escreva uma consulta que apresente o nome do empregado, o nome do departamento e a escala
-- salarial a que pertence. Ordene por escala, nome do departamento e depois por nome do
-- empregado.

select e.nomeemp , d.nomedep , es.escala from empregados e inner join departamentos d inner join escala_salarial es on d.numdep = e.numdep and e.salario>minsal and e.salario<maxsal order by es.escala,nomedep asc, nomeemp asc;

-- Escreva uma consulta que apresente o nome dos empregados, o nome dos departamentos.
-- Apresente, também, na listagem o departamento que não está associado a nenhum empregado
-- (não tem empregados). Ordene por nome (decrescente).

select case
    when empregados.nomeemp is null then 'Não Tem' else empregados.nomeemp end as nome_empregado , departamentos.nomedep from empregados right join departamentos  on departamentos.numdep = empregados.numdep;

-- Escreva uma consulta que apresente o número e o nome do empregado e, ainda, o número e o
-- nome do seu chefe, sabendo que um chefe é ele próprio um empregado. Ordene alfabeticamente
-- pelo nome do chefe.

select e.numemp AS "Número do Empregado", e.nomeemp AS "Nome do Empregado", e.chefe AS "Número do Chefe", c.nomeemp AS "Nome do Chefe" from empregados e inner join empregados c on e.chefe = c.numemp order by c.nomeemp ASC;
select e.numemp AS "Número do Empregado", e.nomeemp AS "Nome do Empregado", case when e.chefe is null and then 'nao tem chafe' else e.chefe end AS "Número do Chefe", case when e.chefe is null then 'SEM CHEFE' else c.nomeemp end AS "Nome do Chefe" from empregados e left join empregados c on e.chefe = c.numemp order by c.nomeemp ASC;

-- Escreva uma consulta que apresente o nome das cidades (a localização) onde existem empregados a
-- desempenhar a função de diretor.

select d.localizacao as cidade from departamentos d inner join empregados e on d.numdep = e.numdep where e.funcao = 'director' order by localizacao desc;


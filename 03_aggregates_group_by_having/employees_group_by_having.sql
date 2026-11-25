use hr;
select count(*) as tem_chefe from empregados where chefe is not null;
select count(distinct chefe) as Quantos_Chefes from empregados;
-- Escreva uma consulta que determine o número de empregados que recebem comissão.

select count(*) from empregados where comissao is not null;
-- Escreva uma consulta que determine quantos departamentos têm empregados.

select count(distinct numdep) as quantos_tem_departamento from empregados;

-- Escreva uma consulta que permita obter o valor despendido em comissões.

select sum(comissao) as soma_comissoes from empregados where comissao is not null;

-- Escreva uma consulta que apresente o número de empregados que desempenham a função de
-- DIRECTOR.

select count(*) as Numero_Diretores from empregados where funcao = 'director';

-- Escreva uma consulta que conte quantos diretores existem em cada departamento.

select numdep as numero_Departamento, count(*) as numero_Diretores_por_Departamento from empregados where funcao = 'director' group by numdep;

-- Escreva uma consulta que apresente quantos empregados são vendedores no departamento 30.

select numdep, count(*) as Numero_Vendedores from empregados where numdep=30 and funcao = 'vendedor';

-- Escreva uma consulta que apresente quantos empregados trabalham em cada departamento. Ordene
-- de forma a que os departamentos com mais empregados apareçam primeiro na listagem.

select numdep, count(*) as Numero_Empregados from empregados group by numdep order by Numero_Empregados DESC;

-- Escreva uma consulta que determine quantos empregados existem atualmente em cada função.
-- Apresente o resultado como na figura abaixo.

select funcao as Função , count(*) Numero_Empregados from empregados group by Função order by Numero_Empregados ASC;

-- Escreva uma consulta que permita confirmar que só os vendedores recebem comissão. Apresente o
-- resultado formatado como na tabela seguinte.

select empregados.funcao as Função , count(empregados.comissao) as Recebe_Comissão from empregados group by Função order by Recebe_Comissão DESC;

-- Escreva uma consulta que permita identificar os departamentos onde trabalham mais de 3
-- empregados. Ordene de forma aos departamentos com menos empregados aparecerem primeiro na
-- listagem.

select empregados.numdep , count(*) as Numero_de_empregados from empregados group by numdep  having count(*) > 3 order by Numero_de_empregados ASC;

-- Escreva uma consulta que permita identificar os departamentos onde trabalham mais de 3 vendedores.

select e.numdep, e.funcao, count(*) as Numero_de_Empregados from empregados e where e.funcao = 'vendedor'  group by numdep  having count(*) > 3 ;

--  Escreva uma consulta que apresente para cada departamento o número de empregados. Apresente
-- também o maior, o menor e a média dos salários desses empregados. O resultado deve estar ordenado
-- pelo valor do salário médio. De referir que a comissão não é tida em conta para efetuar o cálculo
-- salarial.

select numdep as numero_departamento, count(*) as numero_de_empregados ,max(empregados.salario) as maximo, min(empregados.salario) as minimo, avg(empregados.salario) as media from empregados group by numdep order by numdep DESC;

-- Escreva uma consulta que permita determinar o volume salarial dos Escriturários.

select sum(empregados.salario) as volume_salarial from empregados where funcao = 'escriturario';

-- Escreva uma consulta que determine, para cada função, o salário mensal médio e o volume salarial
-- anual. No cálculo do volume salarial anual dos empregados, utilize a fórmula 12*(salario+comissao).
-- Apresente o resultado ordenado por volume salarial (decrescente).

SELECT funcao, AVG(SALARIO) AS MÉDIA, SUM(12*(salario+IFNULL(comissao,0))) AS
VOLUME_SALARIAL
FROM empregados
GROUP BY funcao
ORDER BY 3 DESC;

-- Escreva uma consulta que apresente para cada função desempenhada, em cada departamento, os
-- maior e menor valores salariais. Apresente o resultado ordenado por número do departamento
-- (crescente) e também por função (ascendente).

SELECT numdep AS NUM_DEP, funcao AS FUNCAO, MAX(salario) AS MAIOR_SALARIO,

MIN(salario) AS MENOR_SALARIO

FROM empregados
GROUP BY numdep, funcao
ORDER BY numdep, funcao;

-- Escreva uma consulta que apresente o número de empregados contratados por ano, conforme
-- apresentado a seguir.

select year(empregados.dtaContratacao) as ano_contratação , count(*) as numero_empregados from empregados group by ano_contratação order by ano_contratação DESC;

--  Escreva uma consulta que apresente o número de empregados contratados mensalmente.

select month(empregados.dtaContratacao) as mes_de_contratação , count(*) as numero_empregados from empregados group by mes_de_contratação order by 1 DESC;

-- Escreva uma consulta que mostre o nome do departamento e o respetivo número de empregados.
-- Ordene por departamento.

SELECT nomedep AS NOME_DEP,COUNT(*) AS NUMEROS_EMPREGADOS
FROM empregados e JOIN departamentos d ON e.numdep=d.numdep
GROUP BY nomedep
ORDER BY 1 ASC;

--  Altere a consulta anterior de forma a mostrar os departamentos com menos de 6 funcionários.

SELECT nomedep AS NOME_DEP,COUNT(*) AS NUMEROS_EMPREGADOS
FROM empregados e JOIN departamentos d ON e.numdep=d.numdep
GROUP BY nomedep
having count(*) < 6
ORDER BY 1 ASC;

SELECT nomedep AS NOME_DEP, SUM(salario) AS VOLUME_SALARIAL
FROM empregados e JOIN departamentos d ON e.numdep=d.numdep
WHERE comissao IS NULL
GROUP BY nomedep
ORDER BY 1 ASC;

-- Altere a consulta anterior de forma a mostrar os departamentos cujo volume salarial mensal seja
-- superior a 4000.00€.

SELECT nomedep AS NOME_DEP, SUM(salario) AS VOLUME_SALARIAL
FROM empregados e JOIN departamentos d ON e.numdep=d.numdep
WHERE comissao IS NULL
GROUP BY nomedep
having VOLUME_SALARIAL > 4000
ORDER BY 1 ASC;


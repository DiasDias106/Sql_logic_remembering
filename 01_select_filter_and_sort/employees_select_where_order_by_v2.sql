use hr;
-- DEPARTAMENTO (ordene por número de departamento).

select * from departamentos order by numdep ASC;

-- EMPREGADO (ordene por número de empregado)

select * from empregados order by numemp;

-- ESCALA_SALARIAL (ordene por escala).

select * from escala_salarial order by escala ASC;

-- Mostre as diferentes funções que os empregados desempenham na empresa. Ordene a consulta
-- alfabeticamente.

select distinct funcao from empregados order by funcao ASC;

-- Mostre os diferentes números de departamentos associados a empregados. Ordene o resultado tal
-- como no exemplo abaixo.

select distinct numdep from empregados order by numdep DESC;

-- Mostre o nome, o salário e a comissão de cada um dos empregados, ordenados por ordem
-- decrescente de salário e alfabética de nome. Caso a comissão não tenha qualquer valor deve
-- apresentar a mensagem “O empregado não tem comissão”.

select nomeemp , salario , case
    when comissao is null then 'O empregado não tem comissao'
    else comissao
    end as comissao
from empregados order by salario DESC;

-- Mostre o número, o nome e o salário dos empregados com ordenado superior a 2000. Ordene pelo
-- valor do salário de forma a que os mais altos apareçam primeiro.

select numemp , nomeemp, salario from empregados where salario > 2000 order by salario DESC;

-- Escreva uma consulta que apresente o seguinte resultado:

SELECT CONCAT('O ',upper(nomeemp),' é ', upper(funcao), ' no departamento ', numdep, ', desde ', date_format(dtacontratacao,'%d-%m-%Y'))  as 'Quem, Onde, Quando'
FROM   empregados;

-- Escreva uma consulta que apresente o seguinte resultado:

SELECT CONCAT('O ', nomeemp, ' ganha ', salario, ' mas queria ganhar ', 3*salario, ' (3Xmais)') AS "3 VEZES MAIS"
FROM   empregados
ORDER BY salario DESC;

-- Mostre o nome, o salário e a comissão dos empregados que ganham mais de comissão, do que de
-- ordenado mensal. Ordene por ordem alfabética do nome.

select nomeemp, salario , comissao from empregados where comissao > salario order by nomeemp ASC;

-- Apresente os empregados que têm a função de director ou vendedor. Ordene por nome de
-- empregado.

select * from empregados where funcao in('director','vendedor') order by nomeemp ASC;

-- Mostre os empregados que pertençam ao departamento 10 ou 20.

select nomeemp, numdep from empregados where numdep in(10,20) order by numdep ASC;

-- Mostre os empregados cujo nome começa pela letra 'M'.

select * from empregados where nomeemp like 'm%';

-- Mostre os empregados cujo nome acabe em 'DO'.

select * from empregados where nomeemp like '%do';

-- Mostre os empregados cujo nome começa em 'M' e termina em 'O'.

select * from empregados where nomeemp like 'm%o';

-- Mostre os empregados cujo nome tenha pelo menos um 'O'. Ordene alfabeticamente por nome.

select nomeemp from empregados where nomeemp like '%o%';

-- Mostre os empregados cujo nome tenha pelo menos um 'A', mas não na primeira posição. Ordene
-- por nome de empregado.

select nomeemp from empregados where nomeemp like '_%a%'

-- Mostre os empregados cujos nomes não tenham nenhum 'O'.

select nomeemp from empregados where nomeemp not like '%o%';

-- Mostre o nome de todos os empregados que não recebem comissão.

select nomeemp , case
    when comissao is null then 'sem comissao'
    else comissao
    end as comissão
from empregados where comissao is null;

-- Mostre os empregados que não têm um chefe.

select nomeemp from empregados where chefe is null;

-- Mostre os empregados que não recebem comissões e recebem mais do que 2000.

select nomeemp from empregados where comissao is null and salario > 2000;

-- 20. Liste o nome dos empregados e respetivos salários base acrescidos de um aumento de 15%
-- (arredondado a duas casas decimais). Ordene por ordem decrescente do salário.

SELECT
    nomeemp,
    ROUND(salario * 1.15, 2) AS salario_com_aumento
FROM
    empregados
ORDER BY
    salario_com_aumento DESC;


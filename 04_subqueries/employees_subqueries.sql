use hr;

-- Escreva uma consulta que liste todos os dados dos empregados cujo salário é inferior ao
-- salário médio na empresa.

select * from empregados where salario < (select AVG(salario) from empregados);

-- Escreva uma consulta que liste os empregados que ganham salários iguais ao do salário
-- mais baixo.

select * from empregados where salario = (select min(salario) from empregados);

-- Apresente os nomes dos departamentos onde se praticam salários médios inferiores ao do
-- salário médio da empresa.

SELECT *
FROM departamentos
WHERE numdep IN (SELECT numdep
FROM empregados
GROUP BY numdep
HAVING AVG(salario)<(SELECT AVG(salario) FROM empregados));

-- Apresente o nome dos departamentos que ainda não têm empregados.

select d.nomedep , d.numdep from departamentos d where d.numdep not in (select distinct numdep from empregados );

-- Escreva uma consulta que apresente o maior valor de todos os salários médios de cada
-- departamento.

SELECT ROUND(MAX(Taux.MEDIA),2) AS MAIOR_MEDIA
FROM (SELECT AVG(salario) MEDIA FROM empregados GROUP BY numdep) Taux;

-- Apresente o nome dos departamentos que ainda não têm empregados.

select * from departamentos where numdep not in (select distinct numdep from empregados);

-- Escreva uma consulta que apresente quantos departamentos têm mais de 3 funcionários a
-- trabalhar.

SELECT COUNT(*) AS QUANTOS_TEM_MAIS_DE_3_EMP
FROM (
SELECT numdep
FROM empregados
GROUP BY numdep
HAVING COUNT(*)>3) Taux;

-- Mostre quem são os empregados cujo salário é superior ao salário médio do departamento
-- onde trabalham.

SELECT *
FROM empregados e
WHERE e.salario>(SELECT AVG(salario) FROM empregados WHERE numdep=e.numdep);


-- Worksheet 3: basic SELECT queries on the employees table (filtering, sorting, LIKE, NULL)
-- Converted from the original Word document; answers kept as written.

-- 1-
-- a)
Select * From Empregados
-- b)
SELECT nome, salario, comissão
 FROM EMPREGADOS
ORDER BY salario DESC, nome ASC;

-- c)
SELECT DISTINCT funcao
 FROM empregados
ORDER BY funcao ASC;
-- d)
SELECT DISTINCT idDepart
FROM empregados;
-- e)
Select nome,salario,funcao
From Empregados
Where salario >2000
-- f)
Select nome,salario,comicao
From Empregados
Where comicao is not null and comicao != 0 and comicao>salario
Order by nome ASC;
-- g)
select nome,numero
from Empregados
where funcao = "diretor" or função = "vencedor"
order by nome ASC;
-- h)
SELECT *
 FROM empregados
 WHERE nome LIKE 'M*';

-- i)
SELECT *
 FROM empregados
 WHERE nome LIKE "*Do";

-- j)
SELECT *
 FROM empregados
 WHERE nome LIKE 'M*O' ;

-- k)
SELECT *
FROM empregados
 WHERE idChefe IS NULL;

-- l)
Select nome
From Empregados
Where comissao is null and salario>2500;

-- treino exame
use hr;
/* Mostre as diferentes funções que os empregados desempenham na empresa. Ordene a consulta
-- alfabeticamente.*/

select distinct empregados.funcao from empregados order by funcao ASC;

/*Mostre os diferentes números de departamentos associados a empregados. Ordene o resultado tal
como no exemplo abaixo.*/

select distinct numdep from empregados order by numdep DESC;

/*Escreva uma consulta que apresente o seguinte resultado:*/

SELECT CONCAT(
    'O ', empregados.nomeemp,
    ' ganha ', empregados.salario,
    ' mas gostaria de ganhar ', empregados.salario * 3,
    ' (3x mais)'
) AS mensagem
FROM empregados;

/*Apresente os empregados que têm a função de director ou vendedor. Ordene por nome de
empregado.*/

select nomeemp , funcao from empregados where funcao in('director','vendedor') order by nomeemp ASC;

/*Mostre os empregados cujo nome acabe em 'DO'.*/

select nomeemp from empregados where nomeemp like '%do';

/*Mostre os empregados cujo nome tenha pelo menos um 'O'. Ordene alfabeticamente por nome.*/

select nomeemp from empregados where nomeemp like '%o%' order by nomeemp ASC;

/*Mostre os empregados cujo nome tenha pelo menos um 'A', mas não na primeira posição. Ordene
por nome de empregado.*/

select nomeemp from empregados where nomeemp like '_%a%' order by nomeemp ASC;

/*Mostre o nome de todos os empregados que não recebem comissão.*/

select nomeemp, case when comissao is null then 'nao tem comissao' else empregados.comissao end as comissao
from empregados where comissao is null;

/*Liste o nome dos empregados e respetivos salários base acrescidos de um aumento de 15%
(arredondado a duas casas decimais). Ordene por ordem decrescente do salário.*/

SELECT
    nomeemp,
    salario AS Salario,
    salario + (salario * 0.15) AS Salario_Aumentado
FROM empregados order by salario DESC;

/*Mostre para cada trabalhador a data da primeira revisão salarial, considerando que ocorreu 1 ano
após a entrada na empresa. Apresente o nome do empregado, a data de contratação e ainda a data
da primeira revisão salarial. Ordene por ordem por nome (descendente).*/


/*Escreva uma consulta que determine quantos empregados têm chefe.*/

select count(*) as numero_Chefes from empregados where chefe is not null;

/*Escreva uma consulta que devolva o número de chefes na empresa
 */

select count(distinct chefe) as numero_chefes from empregados;

/*Escreva uma consulta que determine o número de empregados que recebem comissão.*/

select count(*) as recebe_comissão from empregados where comissao is not null;

/*Escreva uma consulta que conte quantos diretores existem em cada departamento.*/

select numdep, count(*) from empregados where funcao = 'director' group by numdep;

/*Escreva uma consulta que apresente quantos empregados trabalham em cada departamento. Ordene
de forma a que os departamentos com mais empregados apareçam primeiro na listagem.*/

select numdep , count(*) as num_empregados from empregados group by numdep order by num_empregados DESC;

/*Escreva uma consulta que determine quantos empregados existem atualmente em cada função.
Apresente o resultado como na figura abaixo.*/

select funcao as Função , count(*) as numero_Emp from empregados group by funcao order by numero_Emp ASC;

/*Escreva uma consulta que permita confirmar que só os vendedores recebem comissão. Apresente o
resultado formatado como na tabela seguinte.*/

select funcao as Função , count(comissao) as num_comissão from empregados group by funcao order by num_comissão DESC;

/*Escreva uma consulta que apresente para cada departamento o número de empregados. Apresente
também o maior, o menor e a média dos salários desses empregados. O resultado deve estar ordenado
pelo valor do salário médio. De referir que a comissão não é tida em conta para efetuar o cálculo
salarial.*/

select numdep,count(*),salario, avg(salario) as media , max(empregados.salario) as Máximo, min(empregados.salario) as minimo from empregados group by numdep order by media ASC;

/*Escreva uma consulta que liste todos os dados dos empregados cujo salário é inferior ao
salário médio na empresa.*/

select * from empregados where salario < (select avg(salario) from empregados);

/*Escreva uma consulta que liste os empregados que ganham salários iguais ao do salário
mais baixo.*/

select * from empregados where salario = (select min(salario) from empregados);

/*Apresente o nome dos departamentos que ainda não têm empregados.*/

select numdep,nomedep,localizacao from departamentos where numdep not in (select distinct numdep from empregados);

/*Escreva uma consulta que apresente o maior valor de todos os salários médios de cada
departamento.*/

select max(salario_medio.media) as maximo from (select avg(salario) as media from empregados group by numdep) as salario_medio;

/*Apresente os nomes dos departamentos onde se praticam salários médios inferiores ao do
salário médio da empresa.*/

select * from departamentos where numdep in(select numdep from empregados group by numdep having avg(salario) < (select avg(salario) from empregados));

/*Apresente o nome dos departamentos que ainda não têm empregados.*/

select * from departamentos where numdep not in (select distinct numdep from empregados);

/*Escreva uma consulta que apresente o maior valor de todos os salários médios de cada
departamento.*/

select max(media.mediano) from (select avg(salario) as mediano from empregados group by numdep) as media;

/*Escreva uma consulta que apresente quantos departamentos têm mais de 3 funcionários a
trabalhar.*/

select count(numero.total) as departamentos_com_mais_de_3 from (select count(*) as total from empregados group by numdep having total > 3) as numero;

/*Mostre quem são os empregados cujo salário é superior ao salário médio do departamento
onde trabalham.*/

select * from empregados e where e.salario > (select avg(salario) from empregados where numdep = e.numdep);

/*Apresente o nome dos departamentos com mais de 3 empregados. Resolva o exercício de
três formas distintas.*/

select * from departamentos d join empregados e on d.numdep = e.numdep group by d.numdep having count(*) > 3;

select nomedep from departamentos where numdep in (select numdep as contagem from empregados group by numdep having count(*) > 3);

/*Mostre quem são os empregados cujo salário é superior ao salário médio do departamento
onde trabalham.*/

select * from empregados e where e.salario > (select avg(salario) from empregados where numdep = e.numdep);

/*Apresente uma lista com os nomes dos empregados e seu salário, assinalando com
asteriscos os que ganham um salário igual ao menor salário praticado pela empresa. Ordene
por salário.*/

select nomeemp, case
    when salario = (select min(salario) from empregados) then concat(salario,'***')
    else salario
    end as Salário
from empregados order by salario ASC;

/*Escreva uma consulta que apresente para cada departamento o número de empregados. Apresente
também o maior, o menor e a média dos salários desses empregados. O resultado deve estar ordenado
pelo valor do salário médio. De referir que a comissão não é tida em conta para efetuar o cálculo
salarial.*/

select numdep, count(*), avg(salario) as media_salarial, min(salario) as minimo , max(salario) as maximo from empregados
group by numdep order by media_salarial ASC;


select nomeemp, salario, comissao from empregados where comissao > salario;

select e.nomeemp, e.salario, e.funcao, d.nomedep from empregados e join departamentos d on d.numdep = e.numdep where funcao <> 'analista' order by e.salario desc, e.nomeemp ASC;

select count(*) as quantos_tem_chefe from empregados where chefe is not null;

select count(*) as recebe_comissão from empregados where comissao is not null;

select numdep, count(*) as numero_vendedores from empregados where numdep = 30 and funcao = 'vendedor' group by numdep;

select e.nomeemp as nome_empregado, d.numdep as numero_dep ,s.escala as Escala from empregados e inner join departamentos d on d.numdep = e.numdep inner join escala_salarial s on e.salario between s.minsal and s.maxsal order by nome_empregado ASC , numero_dep ASC , Escala ASC;




use hr;
select * from empregados e where salario < (select AVG(salario) from empregados);
select * from empregados e where salario = (select min(salario) from empregados);
SELECT *
FROM departamentos d
WHERE (
    SELECT AVG(e.salario)
    FROM empregados e
    WHERE e.numdep = d.numdep
) < (
    SELECT AVG(salario)
    FROM empregados
);

select * from departamentos as d
where (select * from empregados as e where e.numdep is null);

SELECT *
FROM departamentos AS d
WHERE NOT EXISTS (
    select *
    FROM empregados AS e
    WHERE e.numdep = d.numdep
);

SELECT MAX(media_salarial) AS MAIOR_MEDIA
FROM (
    SELECT AVG(e.salario) AS media_salarial
    FROM empregados e
    GROUP BY e.numdep
) medias_departamento;

SELECT AVG(e.salario) AS media_salarial
    FROM empregados e
    GROUP BY e.numdep;


SELECT COUNT(*) AS Quantos_tem_mais_de_3_Emp
FROM (
    SELECT e.numdep
    FROM empregados e
    GROUP BY e.numdep
    HAVING COUNT(e.numemp) > 3
) departamentos_com_mais_de_3;

SELECt *
FROM empregados e
WHERE e.salario > (
    SELECT AVG(e2.salario)
    FROM empregados e2
    WHERE e2.numdep = e.numdep
    GROUP BY e2.numdep
);

select * from empregados e where e.dtaContratacao = (select max(dtaContratacao) from empregados e2 where e2.numdep = e.numdep);

select * from empregados;
  -- exercicio resolvido destas 3 fromas

  SELECT nomedep
FROM departamentos d
WHERE (
    SELECT COUNT(*)
    FROM empregados e
    WHERE e.numdep = d.numdep
) > 3;

SELECT d.nomedep
FROM departamentos d, (
    SELECT e.numdep, COUNT(*) AS total_empregados
    FROM empregados e
    GROUP BY e.numdep
) sub
WHERE d.numdep = sub.numdep AND sub.total_empregados > 3;

SELECT nomedep
FROM departamentos d
WHERE (
    SELECT COUNT(*)
    FROM empregados e
    WHERE e.numdep = d.numdep
) > (
    SELECT 3
);


SELECT d.nomedep, (
    SELECT SUM(e.salario)
    FROM empregados e
    WHERE e.numdep = d.numdep
) AS volume_salarial
FROM departamentos d;

SELECT
    e.nomeemp,
    CONCAT(FORMAT(e.salario, 2),
           CASE
               WHEN e.salario = (SELECT MIN(salario) FROM empregados) THEN ' ***'
               ELSE ''
           END
    ) AS SALARIOS
FROM empregados e
ORDER BY e.salario;



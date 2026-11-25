CREATE DATABASE bdpanda;
use bdpanda;

create table clientes(
    idcli int auto_increment primary key,
    nome nvarchar(50) not null,
    categoria enum('alpa','bravo','charli') not null,
    dtanasc datetime default current_timestamp(),
    idade decimal(10,2) generated always as (datediff(curdate(),dtanasc)/365.25) virtual,
    boss int,
    constraint fk_clientes_clientes foreign key(boss) references clientes(idcli)
);

select * from clientes;
insert into clientes(nome,categoria,dtanasc)values
('pAto Donald','bravo','1934-06-09'),
('Tio Patinhas','alpa','1904-06-09'),
('Margarida','alpa','1938-06-09'),
('Mickey','bravo','1944-06-09'),
('Peninha','charli','1944-06-09');

Select * from clientes;
update clientes set boss=(
                    case
                        when idcli=2 then null
                        when idcli=1 then 2
                        when idcli=3 then 1
                    else 3
                    end
                    );

create table carros(
    idcar int auto_increment primary key ,
    modelo nvarchar(50) not null ,
    phora decimal(10,2) check (phora between 0 and 100)
);

select * from carros;

insert into carros(modelo,phora)values
('Fiat 600',25.50),
('Ferrari spider',80.00),
('Ford fiesta',20.50);


create table alugures(
    idal int auto_increment primary key ,
    idcli int not null ,
    idcar int not null ,
    inicio datetime default current_timestamp(),
    fim datetime default current_timestamp(),
    tempo decimal(10,2) generated always as (to_seconds(fim) - to_seconds(inicio)/3600) virtual,
    custo decimal(10,2),
    constraint fk_clientes_alugures foreign key (idcli) references clientes(idcli) on update cascade on delete cascade ,
    constraint fk_carros_alugueres foreign key (idcar) references carros(idcar),
    constraint unique_aluguer unique(idcli,idcar,inicio)

);

insert into alugures(idcli,idcar,inicio,fim)
select c.idcli,ca.idcar,current_timestamp() as inicio,
       date_add(current_timestamp(),interval(floor(rand()*1440))minute ) as fim
       from clientes c , carros ca;

select * from alugures;
delete from alugures;

delete from alugures where idcli =5;
delete from alugures where idcli =4 and idcar =2;

/*insert
  update
  delete
  select
  exists
  rename
  project
  produto cruzado
  join
  left join
  right join
  semi join
  union
  diference
  intersect
  divisao
  aggregation
  stored procedure
  function
  triggers
 */
  update alugures a inner join  carros c on a.idcar = c.idcar
  set custo = c.phora * a.tempo;

/*select *
from carros c inner join alugures a on c.idcar = a.idcar; update from */

select * from alugures order by custo desc limit 2,2;
select * from(
select row_number() over(order by custo desc)ordem ,idal,idcli,idcar,inicio,fim,tempo,custo
from alugures)t
where ordem between 3 and 4;

select * from(
    select row_number() over (order by custo desc) ordem,idal,idcli,idcar,inicio,fim,tempo,custo
from alugures)t
where ordem between 3 and 4;

select * from clientes c,alugures a
where c.idcli = a.idcli;/*inner join inprovisado*/

select *from clientes c inner join alugures a on c.idcli = a.idcli;/*inner join com expressao*/


select * from clientes c , alugures a where c.idcli = a.idcli;
select * from clientes c inner join alugures a on c.idcli = a.idcli;

select * from clientes where idcli=3;
select * from clientes where not idcli=3;
select * from clientes where idcli<>3;
select * from clientes where idcli between 1 and 3;
select * from clientes where idcli=1 and idcli <=3;
select * from clientes where boss is null;
select * from clientes where boss is not null;
select * from clientes where nome like 'P%';
select * from clientes where nome like 'P%A';
select * from clientes where nome regexp '^(P|p)\\w+a$';

-- \\w alfanumerico [a-ZA - Z0-9_]
-- \\d [0-9]
-- .qualquer caracter
-- \\S

select * from clientes where nome regexp '\\S';
-- quantificadores
-- ? 0-1
-- + 1 ou mais
-- 0 ou muitos
-- {2}
-- {2,5} dois a cinco
-- {,5} ate cinco
-- {2,} mais de 2
-- $ fim de frase
-- \b palavra
-- select like
select * from clientes where idcli in (1,3,5);
select * from clientes where idcli not in (1,3,5);

select * from clientes where idcli in (select distinct idcli from alugures);

select * from clientes where idcli not in (select distinct idcli from alugures);

select * from clientes c where exists(select * from alugures where idcli=c.idcli);

select * from clientes c where not exists(select * from alugures where idcli=c.idcli);

select * from clientes order by idade desc limit 3;
select * from clientes order by idade desc limit 2,2;
select * from(
select row_number() over (order by idade desc )Ordem, idcli,nome,categoria,dtanasc,idade , boss from clientes)t
where Ordem in (1,3,5);

with cte as (
    select row_number() over (order by idade desc )Ordem, idcli,nome,categoria,dtanasc,idade , boss from clientes
)select * from cte where Ordem in (1,3,5);

select * from clientes;
with x as (
select idcli,nome,idade, (idade * 2)Dobro,if(idcli%2=0,'Par','Impar')Paridade from clientes)
select * from x where Paridade like 'Par';

-- rename
-- self Join

select a.nome, b.nome from clientes a , clientes b;
select a.nome, b.nome from  clientes a, clientes b where b.idcli <> a.idcli;
select a.nome, b.nome from  clientes a, clientes b where b.idcli > a.idcli;

-- produto cruzado
select * from clientes, carros;


-- Join(filtro por cima de um produto cruzado)
select * from clientes c, alugures a where c.idcli = a.idcli order by c.idcli;
select * from clientes c , alugures a where c.idcli <> a.idcli order by c.idcli;
select * from clientes c inner join alugures a on c.idcli = a.idcli;

-- Left Join(vemos todos os registos da tabela da esquerda)

select * from clientes c left join alugures a on c.idcli = a.idcli;

-- Right Join

select * from alugures a right join clientes c on c.idcli = a.idcli;

-- outer join
select * from clientes c left join alugures a on c.idcli = a.idcli
union
select * from clientes c right join alugures a on c.idcli = a.idcli;

-- semi join

select distinct c.* from clientes c inner join alugures a on c.idcli = a.idcli;

-- anti join
select c.*from clientes c inner join alugures a  on a.idcli= c.idcli where a.idcli is null;
select * from clientes c where not exists(
    select * from alugures where idcli = c.idcli
);

-- union
create view  um as
    select * from clientes where idcli <= 4;

create view dois as
select * from clientes where idcli > 2;


select * from um
union all
select * from dois order by idcli;


-- diference

select * from um where not exists(
  select * from dois where dois.idcli = um.idcli and um.nome = dois.nome and dois.categoria = um.categoria and um.boss = dois.boss
);

select * from um
intersect
select * from dois;


-- Divisao

select * from clientes c where not exists(
    select * from carros where idcar not in (select idcar from alugures where idcli = c.idcli)
);

-- aggregation
select c.idcli , c.nome, sum(custo)Soma , count(*)Total , avg(custo)Media from
                                    alugures a inner join clientes c on a.idcli = c.idcli where c.idcli between 1 and 3
                                    group by c.idcli, c.nome
                                    having count(*)>2;

select * from alugures;
update alugures
set fim = inicio
where idal=18;

-- trigger
select * from carros;
delimiter //
create trigger trg_one
    before update
    on alugures
    for each row
    begin
        declare ph int default 0;
        select phora into ph from carros where idcar = OLD.idcar;
        set NEW.custo = ph * NEW.tempo;
    end //
delimiter ;

select * from alugures;
update alugures set fim = date_add(inicio,interval 2 hour )where idal = 18;



delimiter //

create procedure sp_one(in pidcli int, out total int )
begin
  select sum(custo) into total from alugures where  idcli = pidcli;
  select * from  clientes c inner join alugures a on c.idcli=a.idcli where c.idcli = pidcli;
end //
delimiter ;

call sp_one(2,@total);
select @total as total;



delimiter //
create function fn_dobro(num int)returns int
begin
    return 2*num;
end //
delimiter ;
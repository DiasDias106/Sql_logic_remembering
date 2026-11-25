show tables ;
use bdpanda;

select * from clientes;
select * from clientes where idcli = 5;
select * from clientes where idcli between 1 and 3;
select * from clientes where idcli > 3;
select max(idade) as Idade from clientes;
select * from carros;
insert into carros(modelo, phora)
value ('Chevrolet',45.50);
select * from carros where idcar = 3;

select * from information_schema.ROUTINES where ROUTINE_SCHEMA like 'bdpanda';

delimiter //
create procedure sp_custo(in pidcli int, out soma float)
begin
 select sum(custo) into soma from alugures where idcli = pidcli;
end//
delimiter ;

call sp_custo(36,@total);
select @total as total;

select * from alugures
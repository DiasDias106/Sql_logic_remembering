use bdpanda;
select * from clientes;
alter table clientes add password nvarchar(255),
    add foto nvarchar(255), add email nvarchar(255);

select idcli,nome,email,foto from clientes;

delete from alugures where idcli = 2;

insert into clientes(nome, categoria,dtanasc,boss)
value ('novo','bravo','1963-05-10',null);

delete from alugures;

update clientes set boss = null;
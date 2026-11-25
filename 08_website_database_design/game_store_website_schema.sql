create database Loja;

use Loja;

create table clientes(
  id_cli int auto_increment primary key ,
  username varchar(30) not null ,
  password varchar(20) not null ,
  email varchar(50) not null ,
  login date default current_timestamp
);

select *
from clientes;

CREATE TABLE paginas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    url VARCHAR(255) NOT NULL
);

select * from paginas;

create table produtos(
    id_prod INT auto_increment primary key ,
    categoria enum ('jogo','figura','outros') ,
    quantidade int not null ,
    descricao varchar(100) ,
    preco double not null
);

select * from produtos;
select * from vendas;
create table recibos(
    id_recibo int primary key auto_increment,
    id_produto int not null ,
    id_cliente int not null ,
    quantidade int not null ,
    preco_unidade double(3,2) not null ,
    total double(4,2) not null ,
    constraint id_prod_fk foreign key (id_produto) references produtos(id_prod),
    constraint id_cli_fk foreign key (id_cliente) references clientes(id_cli)
);

select *
from recibos;

create table vendas(
   id_venda int auto_increment primary key ,
   id_cliente int not null ,
   id_produto int not null ,
   total double not null ,
   hora_compra datetime default current_timestamp,
   foreign key (id_cliente) references clientes(id_cli),
   foreign key (id_produto) references produtos(id_prod)
);
drop table clientes;
select * from vendas;

drop table clientes;
drop table recibos;
drop table vendas;

drop table produtos;
use loja;
create table jogos(
    id_jogo int not null auto_increment primary key ,
    nome varchar(50) not null ,
    preco double(3,2) not null
);

insert into jogos(nome,preco)
values ('Fallout 4 Standard',69.99),
       ('Fallout 4 G.O.T.Y',99.99),
       ('Fallout 76 Standard',39.99),
       ('Fallout 76 Skyline Valley',59.99),
       ('Fallout 3 G.O.T.Y',19.99),
       ('Fallout New Vegas Standard',15.99),
       ('Fallout 2 Standard',19.99),
       ('Fallout 1 Standard',19.99),
       ('Fallout Shelter Standrad',0.00);

alter table jogos
modify preco double(4,2) not null;

create table figuras(
    id_figura int not null auto_increment primary key ,
    nome varchar(50) not null ,
    preco double(3,2) not null
);

insert into figuras(nome,preco)
values ('Pop Fallout Gold Edition',99.99),
       ('Vault Dweller Pop',19.99),
       ('Super Mutant Pop',24.99),
       ('Piper Pop',19.99),
       ('T-60 Power Armor Pop',29.99),
       ('Liberty Prime Pop',49.99),
       ('Sole Survivor Pop',19.99),
       ('Codsworth Pop',19.99),
       ('Paladin Dance',24.99);

alter table figuras
modify preco double(4,2) not null;


create table outros(
    id_outros int not null auto_increment primary key ,
    nome varchar(50) not null ,
    preco double(4,2) not null
);

insert into outros(nome,preco)
values ('Limited edition fallout controller',149.99),
       ('Nukacola edition fallout controller',79.99),
       ('Vault Boy controller Suport',49.99),
       ('Purified Water',9.99),
       ('Nuke Lunchbox',29.99),
       ('Fallout T-Shirt',16.99),
       ('Pipboy Replica',299.99),
       ('Suvenir bag',39.99),
       ('T-60 Red Army Helmet',199.99);


alter table outros
modify preco double(5,2) not null;

delete from figuras
where id_figura between 10 and 18;

insert into paginas(titulo, descricao, url)
values ('Home','Pagina principal da loja','loja_index.html'),
       ('Jogos','Pagina onde pode encontrar os jogos a venda','jogos.html'),
       ('Figuras','Pagina onde pode encontrar as figuras a venda','figuras.html'),
       ('Outros','Pagina onde pode encontrar outros itens a venda','outros.html'),
       ('Vaultec Mail','local onde pode enviar email para onde pretender','queixas2.php'),
       ('Login','pagina onde pode dar login','loginesignin1.php'),
       ('Signin','pagina onde pode criar conta','loginesignin1.php'),
       ('Descarregaveis','pagina onde pode descarregar conteudos','Descarregaveis1.html'),
       ('Localizacao','contem informacoes de contacto','localizacao2.html'),
       ('Carrinho','local onde pode armazenar as suas compras','Carrinho.html'),
       ('Pop Fallout Gold Edition','item compravel','figura1.html'),
       ('Vault Dweller Pop','item compravel','figura2.html'),
       ('Super Mutant Pop','item compravel','figura3.html'),
       ('Piper Pop','item compravel','figura4.html'),
       ('T-60 Power Armor Pop','item compravel','figura5.html'),
       ('Liberty Prime Pop','item compravel','figura6.html'),
       ('Sole Survivor Pop','item compravel','figura7.html'),
       ('Codsworth Pop','item compravel','figura8.html'),
       ('Paladin Dance','item compravel','figura9.html'),
       ('Limited edition fallout controller','item compravel','outros1.html'),
       ('Nukacola edition fallout controller','item compravel','outros2.html'),
       ('Vault Boy controller Suport','item compravel','outros3.html'),
       ('Purified Water','item compravel','outros4.html'),
       ('Nuke Lunchbox','item compravel','outros5.html'),
       ('Fallout T-Shirt','item compravel','outros6.html'),
       ('Pipboy Replica','item compravel','outros7.html'),
       ('Suvenir bag','item compravel','outros8.html'),
       ('T-60 Red Army Helmet','item compravel','outros9.html'),
       ('Fallout 4 Standard','item compravel','jogo1.html'),
       ('Fallout 4 G.O.T.Y','item compravel','jogo2.html'),
       ('Fallout 76 Standard','item compravel','jogo3.html'),
       ('Fallout 76 Skyline Valley','item compravel','jogo4.html'),
       ('Fallout 3 G.O.T.Y','item compravel','jogo5.html'),
       ('Fallout New Vegas Standard','item compravel','jogo6.html'),
       ('Fallout 2 Standard','item compravel','jogo7.html'),
       ('Fallout 1 Standard','item compravel','jogo8.html'),
       ('Fallout Shelter Standrad','item compravel','jogo9.html'),
       ('Contactos','local onde encontra todas as funcionalidades de contacto','contacto1.html');

alter table outros
add quantidade int not null;

alter table jogos
add quantidade int not null;

alter table figuras
add quantidade int not null;

use Loja;
create table vendas(
    id_venda int auto_increment primary key ,
    comprador varchar(50),
    produto varchar(100) not null,
    preco double(5,2) not null,
    dta_compra date default current_timestamp,
    id_user int not null,
    constraint utelizador_fk foreign key (id_user) references utilizadores (id_user)
);
create table venda(
    id_venda int auto_increment primary key ,
    comprador varchar(50),
    produto varchar(100) not null,
    preco double(5,2) not null,
    dta_compra date default current_timestamp,
    id_user int not null,
    constraint utelizador_fk foreign key (id_user) references utilizadores (id_user)
);
use loja;

drop table vendas;

ALTER TABLE vendas DISCARD TABLESPACE;

ALTER TABLE jogos ADD COLUMN imagem VARCHAR(255) default 'imagens_loja/produto_sem_imagem.png';
ALTER TABLE figuras ADD COLUMN imagem VARCHAR(255) default 'imagens_loja/produto_sem_imagem.png';
ALTER TABLE outros ADD COLUMN imagem VARCHAR(255) default 'imagens_loja/produto_sem_imagem.png';
ALTER TABLE jogos ADD COLUMN descricao VARCHAR(255);
ALTER TABLE figuras ADD COLUMN descricao VARCHAR(255);
ALTER TABLE outros ADD COLUMN descricao VARCHAR(255);
ALTER TABLE outros ADD COLUMN caminho VARCHAR(255);
ALTER TABLE jogos ADD COLUMN caminho VARCHAR(255);
ALTER TABLE figuras ADD COLUMN caminho VARCHAR(255);
delete from outros where id_outros = 10;
use forum;
alter table utilizadores add column imagem varchar(255) default 'imagens/nofoto';
create table adivinhanumero(
    id_jogo int not null auto_increment primary key ,
    nome_jogador VARCHAR(255) NOT NULL,
    numero_escolhido INT NOT NULL,
    numero_correto INT NOT NULL,
    tentativas INT NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
use forum;
create table forca(
    id_jogo int not null auto_increment primary key ,
    nome_jogador VARCHAR(255) NOT NULL,
    letra_escolhida char NOT NULL,
    palavra_certa varchar(20) NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

alter table forca add column venceu varchar(10);
drop table jogo_dados;

create table jogodados(
    id_jogo int not null auto_increment primary key ,
    nome_jogador VARCHAR(255) NOT NULL,
    quantidade char NOT NULL,
    aposta varchar(20) NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from paginas;
insert into paginas(titulo, descricao, url)
values ('leaderboard jogo dos dados','pode verificar a sua pontuação e a de outros jogoadores no jogo dos dados','leaderboard_dados.php'),
       ('leaderboard jogo da forca','pode verificar a sua pontuação e a de outros jogoadores no jogo da forca','leaderboard_forca.php'),
       ('leaderboard adivinhe o numero','pode verificar a sua pontuação e a de outros jogoadores no jogo adivinhe o numero','leaderboard_adnum.php');










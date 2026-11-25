show databases ;
use forum;

select * from paginas;
insert into paginas(titulo, descricao, url)
values ('adivinha numero','jogo que consiste em adivinhar um numero aleatorio','adivinhanum.html'),
       ('calculadora','aplicação que permite realizar diversos tipos de calculos','calculadora.html'),
       ('contactos','pagina de contactos','contactos.html'),
       ('contador final','conta os dias ate ocorrer um ataque nuclear','contador_final.html'),
       ('conversor de moedas','converte valores de uma moeda para o valor de outras','conversormoedas.html'),
       ('descarregaveis','conteudo descarregavel ','Descarregaveis.html'),
       ('fallout 1','informações sobre o jogo fallout 1','fallout_1.html'),
       ('fallout 2','informações sobre o jogo fallout 2','fallout_2.html'),
       ('fallout 3','informações sobre o jogo fallout 3','fallout_3.html'),
       ('fallout 4','informações sobre o jogo fallout 4','fallout_4.html'),
       ('fallout 76','informações sobre o jogo fallout 76','fallout_76.html'),
       ('fallout new vegas','informações sobre o jogo fallout new vegas','fallout_nv.html'),
       ('fallout shelter','informações sobre o jogo fallout shelter','falloutshelter.html'),
       ('fallout tactics','informações sobre o jogo fallout tactics','fallouttactics.html'),
       ('hub aplicações','atalho de acesso a todas as aplicações','hub_aplicacoes.html'),
       ('home','pagina principal do site','index.html'),
       ('jogo dos dados','jogo que consiste em apostar nas faces de dois dados','jogodosdados.html'),
       ('jogo da forca','jogo que consiste em adivinhar a palavra antes que o boneco morra','jogoforca.html'),
       ('localização','local e contactos','localizacao.html'),
       ('login e sign in','crie ou aceda a uma conta no nosso site','loginesignin.html'),
       ('noticias','contem varias noticias sobre a saga fallout','noticias.html'),
       ('pesquisa personagem','uma api que conteu varios conteudos da franquia fallout','pesquisa_personagem.html'),
       ('queixas','aqui podera dar nos concelhos atraves de email ou realizar queixas','queixas.php'),
       ('sobre','aqui pode encontrar informaçoes sobre a lore e jogos','sobre.html'),
       ('maquina dos selos','aqui pode obter calculos sobre uma quantidade de selos','php/maquinadoselos.php');

select * from paginas;

SELECT titulo, url FROM paginas WHERE titulo LIKE 'A%';

create database game_review;
use game_review;
CREATE TABLE jogos (
    id_jogo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    imagem TEXT,
    descricao TEXT,
    genero VARCHAR(50),
    ano_lancamento INT,
    plataforma VARCHAR(50),
    rating_global DECIMAL(3,2) DEFAULT 0,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE paginas (
    id_pag INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    caminho VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    cargo varchar(50) default 'user',
    imagem_perfil TEXT,
    data_registo TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ratings (
    id_rating INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    id_jogo INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_rating (id_user, id_jogo),
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_jogo) REFERENCES jogos(id_jogo)
);

CREATE TABLE comentarios (
    id_comment INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    id_jogo INT NOT NULL,
    comentario TEXT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_jogo) REFERENCES jogos(id_jogo)
);

alter table jogos add column caminho  text unique not null;
alter table jogos drop column caminho;

INSERT INTO jogos (nome, imagem, descricao, genero, ano_lancamento, plataforma, rating_global) VALUES
('Minecraft', 'nofoto.png', 'Jogo sandbox onde os jogadores constroem e exploram mundos gerados proceduralmente.', 'Sandbox', 2011, 'PC/Consolas/Mobile', 0),

('Grand Theft Auto V', 'nofoto.png', 'Jogo de ação e aventura em mundo aberto situado em Los Santos, com três protagonistas e missões variadas.', 'Ação', 2013, 'PC/PlayStation/Xbox', 0),

('The Witcher 3: Wild Hunt', 'nofoto.png', 'RPG de mundo aberto que segue Geralt de Rivia na busca por Ciri num vasto continente.', 'RPG', 2015, 'PC/PlayStation/Xbox/Switch', 0),

('Red Dead Redemption 2', 'nofoto.png', 'Jogo de ação e aventura que segue Arthur Morgan e o gangue Van der Linde no fim do Velho Oeste.', 'Aventura', 2018, 'PC/PlayStation/Xbox', 0),

('The Legend of Zelda: Breath of the Wild', 'nofoto.png', 'Aventura em mundo aberto no reino de Hyrule com total liberdade de exploração.', 'Aventura', 2017, 'Nintendo Switch', 0),

('Fortnite', 'nofoto.png', 'Battle Royale de 100 jogadores com construção e ação em tempo real.', 'Shooter', 2017, 'PC/Consolas/Mobile', 0),

('God of War (2018)', 'nofoto.png', 'Kratos e Atreus viajam pelos reinos nórdicos numa aventura emocional e épica.', 'Ação', 2018, 'PlayStation/PC', 0),

('Hollow Knight', 'nofoto.png', 'Metroidvania em 2D com foco em exploração, combate desafiador e narrativa implícita.', 'Metroidvania', 2017, 'PC/Consolas', 0),

('Dark Souls III', 'nofoto.png', 'RPG de ação conhecido pela sua elevada dificuldade e ambiente sombrio.', 'RPG', 2016, 'PC/PlayStation/Xbox', 0),

('Super Mario Odyssey', 'nofoto.png', 'Mario explora diversos reinos com a ajuda de Cappy para salvar a Princesa Peach.', 'Plataforma', 2017, 'Nintendo Switch', 0);

delete from jogos where id_jogo between 1 and 10;

select * from jogos;

INSERT INTO jogos (id_jogo,nome, imagem, descricao, genero, ano_lancamento, plataforma) VALUES
(1,'Among Us', NULL, 'Jogo social onde os jogadores deduzem quem é o impostor numa nave espacial.', 'Party / Social Deduction', 2018, 'PC, Android, iOS, Switch, PS4/5, Xbox One/Series'),
(2,'ARC Raiders', NULL, 'Tiro de extração em terceira pessoa PvPvE: escava, recolhe recursos e extrai evitando inimigos e outros jogadores.', 'Third-person extraction shooter', 2025, 'PC, PS5, Xbox Series X/S'),
(3,'Atomic Heart', NULL, 'FPS retrofuturista em mundo alternativo soviético com robôs e mutantes.', 'First-person shooter / RPG', 2023, 'PC, PS4/5, Xbox One/Series'),
(4,'BioShock', NULL, 'Shooter em primeira pessoa com elementos de RPG, passado numa cidade subaquática distópica chamada Rapture.', 'First-person shooter', 2007, 'PC, Xbox 360, PS3'),
(5,'BioShock 2', NULL, 'Sequência de BioShock com jogabilidade semelhante e mais exploração de Rapture.', 'First-person shooter', 2010, 'PC, Xbox 360, PS3'),
(6,'BioShock Infinite', NULL, 'Shooter em primeira pessoa com viagem entre cidades flutuantes e narrativa complexa.', 'First-person shooter', 2013, 'PC, Xbox 360, PS3'),
(7,'Blair Witch', NULL, 'Jogo de terror em primeira pessoa inspirado no universo do filme Blair Witch.', 'Horror / Psychological Thriller', 2019, 'PC, Xbox One, PS4'),
(8,'Blasphemous', NULL, 'Plataforma 2D com ação e elementos gore, num mundo fortemente inspirado pela arte religiosa espanhola.', 'Action-Platformer / Metroidvania', 2019, 'PC, Switch, PS4, Xbox One'),
(9,'Blasphemous 2', NULL, 'Continuação do primeiro Blasphemous, com jogabilidade semelhante e nova história.', 'Action-Platformer / Metroidvania', 2023, 'PC, Switch, PS4/5, Xbox'),
(10,'Bloons TD 6', NULL, 'Tower defense onde balões (“bloons”) atacam e tens de posicionar torres para os deter.', 'Tower Defense', 2018, 'PC, iOS, Android');

select * from users;

create table Jogo_guardados(
    id_guardado int auto_increment primary key ,
    id_jogo int unique not null,
    id_user int unique not null,
    foreign key (id_jogo) references jogos(id_jogo),
    foreign key (id_user) references users(id_user)
);


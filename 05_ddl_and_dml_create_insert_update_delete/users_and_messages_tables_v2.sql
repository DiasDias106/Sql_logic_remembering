
CREATE DATABASE BDMensagens;
USE BDMensagens;

CREATE TABLE utilizadores (
    idutilizadores INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(30) NOT NULL,        
    genero ENUM('M', 'F') NOT NULL,   
    dtaNascimento DATE NOT NULL,      
    email VARCHAR(256) NOT NULL,      
    morada VARCHAR(120) NOT NULL,     
    telefone VARCHAR(15) NOT NULL,    
    nif CHAR(9),                      
    login VARCHAR(8) NOT NULL,        
    `password` VARCHAR(64) NOT NULL,  
    dtaregisto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (idutilizadores),  
    CONSTRAINT uk_utilizadores_nif UNIQUE (nif)  
) ENGINE=innoDB;

CREATE TABLE mensagens (
    id INT NOT NULL AUTO_INCREMENT,             
    assunto VARCHAR(30) NOT NULL,               
    mensagem TEXT NOT NULL,                     
    dtaMensagem DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,  
    idutilizadores INT NOT NULL,                  
    PRIMARY KEY (id),
    FOREIGN KEY (idutilizadores) REFERENCES utilizadores (idutilizadores)
) ENGINE=innoDB;

INSERT INTO utilizadores (nome, genero, dtaNascimento, email, morada, telefone, nif, login, `password`)
VALUES 
('João Silva', 'M', '1985-02-15', 'joao.silva@example.com', 'Rua Exemplo, 123', '123456789', '123456789', 'joaosilva', 'hashed_password'),
('Maria Oliveira', 'F', '1990-07-22', 'maria.oliveira@example.com', 'Avenida Central, 456', '987654321', '987654321', 'mariaoliveira', 'hashed_password'),
('Carlos Souza', 'M', '1982-11-11', 'carlos.souza@example.com', 'Praça da Liberdade, 789', '112233445', '112233445', 'carlossouza', 'hashed_password');

INSERT INTO mensagens (assunto, mensagem,idutilizadores)
VALUES 
('Primeira Mensagem', 'Esta é a minha primeira mensagem no sistema.', 1),
('Segunda Mensagem', 'Esta é a minha segunda mensagem no sistema.', 2);
 

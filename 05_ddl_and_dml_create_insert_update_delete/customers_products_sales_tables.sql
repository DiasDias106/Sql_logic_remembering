create database treino_subqueries;
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);
use treino_subqueries;
drop table clientes;

INSERT INTO clientes (id_cliente, nome, cidade) VALUES
(1, 'João Silva', 'Lisboa'),
(2, 'Maria Santos', 'Porto'),
(3, 'Ana Costa', 'Lisboa'),
(4, 'Carlos Lima', 'Faro');

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10,2)
);

INSERT INTO produtos (id_produto, nome_produto, preco) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 300.00),
(4, 'Monitor', 200.00);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda) VALUES
(1, 1, 1, 2, '2023-10-15'),
(2, 1, 3, 1, '2023-11-01'),
(3, 2, 2, 1, '2023-10-20'),
(4, 3, 1, 1, '2023-09-10'),
(5, 4, 4, 5, '2023-12-05');


-- 1. Listar clientes que compraram mais de 2 produtos diferentes:

select clientes.nome from clientes where ()
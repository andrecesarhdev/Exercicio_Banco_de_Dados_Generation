/*Atividade 2

Crie um banco de dados para um e-commerce, onde o sistema trabalhará com as informações dos produtos deste e-commerce. 
Crie uma tabela de produtos e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste e-commerce.
Insira nesta tabela no mínimo 8 dados (registros).
Faça um SELECT que retorne todes os produtos com o valor maior do que 500.
Faça um SELECT que retorne todes os produtos com o valor menor do que 500.
Ao término atualize um registro desta tabela através de uma query de atualização.
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) 
e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados. */

-- Criação do banco de dados
CREATE DATABASE bd_ecommerce;
USE bd_ecommerce;

-- Criação da tabela produtos
CREATE TABLE tb_produtos (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
categoria VARCHAR(255),
preco DECIMAL(10,2) NOT NULL,
estoque INT NOT NULL
);
-- Inserção de Dados
INSERT INTO tb_produtos(nome,categoria,preco,estoque)
VALUES
("Notebook Dell Inspiron", "Informática", 4500, 10),
("Smartphone Samsung Galaxy", "Eletrônicos", 3200, 15),
("Fone de Ouvido Bluetooth", "Acessórios", 350, 40),
("Teclado Mecânico", "Informática", 600, 25),
("Mouse Gamer", "Informática", 280, 30),
("Monitor 27 Polegadas", "Informática", 1200, 12),
("Cadeira Gamer", "Móveis", 980, 8),
("Webcam HD", "Acessórios", 420, 20);

-- Produtos com preço maior que 500
SELECT *
FROM tb_produtos
WHERE preco > 500;

-- Produtos com preço menor que 500
SELECT *
FROM tb_produtos
WHERE preco < 500;

-- Atualização de produto
UPDATE tb_produtos 
SET preco = 300 
WHERE id = 3;

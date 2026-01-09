/*Crie um banco de dados para um serviço de uma Farmácia. O nome do Banco de dados deverá ter o seguinte nome db_farmacia_bem_estar.
O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, 
que deverão estar relacionadas.
Boas Práticas:
Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os produtos.
Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias,
 onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria cosméticos).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, 
no repositório que você criou sobre Banco de dados.*/

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- Tabela de categorias
CREATE TABLE categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

-- Inserção das categorias
INSERT INTO categorias (nome, descricao)
VALUES
("Medicamentos", "Produtos para tratamento de doenças"),
("Cosméticos", "Produtos para cuidados pessoais e beleza"),
("Higiene", "Produtos de higiene pessoal"),
("Vitaminas", "Suplementos vitamínicos"),
("Infantil", "Produtos para cuidados infantis");

-- Tabela de produtos
CREATE TABLE produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Inserção dos produtos
INSERT INTO produtos (nome, marca, valor, estoque, categoria_id)
VALUES
("Paracetamol 750mg", "Medley", 12.50, 100, 1),
("Shampoo Anticaspa", "Clear", 28.90, 60, 3),
("Creme Facial Hidratante", "Nivea", 59.90, 40, 2),
("Vitamina C 500mg", "Cimed", 35.00, 80, 4),
("Pomada Antisséptica", "Nebacetin", 22.00, 50, 1),
("Protetor Solar FPS 50", "La Roche", 79.90, 30, 2),
("Sabonete Líquido", "Dove", 8.50, 120, 3),
("Fralda Infantil", "Pampers", 55.00, 70, 5);

-- Produtos com valor maior que R$ 50,00
SELECT * 
FROM produtos
WHERE valor > 50.00;

-- Produtos com valor entre R$ 5,00 e R$ 60,00
SELECT * 
FROM produtos
WHERE valor BETWEEN 5.00 AND 60.00;

-- Produtos que possuem a letra C no nome
SELECT * 
FROM produtos
WHERE nome LIKE "%C%";

-- INNER JOIN entre produtos e categorias
SELECT p.nome, p.marca, p.valor, c.nome AS categoria
FROM produtos p
INNER JOIN categorias c
ON p.categoria_id = c.id;

-- INNER JOIN trazendo apenas produtos da categoria Cosméticos
SELECT p.nome, p.marca, p.valor, c.nome AS categoria
FROM produtos p
INNER JOIN categorias c
ON p.categoria_id = c.id
WHERE c.nome = "Cosméticos";
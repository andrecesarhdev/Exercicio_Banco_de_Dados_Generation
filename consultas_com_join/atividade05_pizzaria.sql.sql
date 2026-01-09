/*Crie um banco de dados para um serviço de uma Pizzaria. O nome do Banco de dados deverá ter o seguinte nome db_pizzaria_legal. 
O sistema trabalhará com as informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_pizzas e tb_categorias, 
que deverão estar relacionadas.
Boas Práticas:
Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar as pizzas.
Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_pizzas.
Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, 
onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, 
no repositório que você criou sobre Banco de dados. */

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal;

-- Tabela das categorias
CREATE TABLE categorias(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(100) NOT NULL
);

-- Inserção das categorias
INSERT INTO categorias (nome,descricao)
VALUES
("Tradicional", "Pizzas clássicas e mais consumidas"),
("Especial", "Pizzas com ingredientes especiais"),
("Premium", "Pizzas com ingredientes nobres"),
("Doce", "Pizzas doces"),
("Vegetariana", "Pizzas sem carne");

-- Tabala de pizzas
CREATE TABLE pizzas(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
ingredientes VARCHAR(255) NOT NULL,
tamanho VARCHAR(255) NOT NULL,
valor DECIMAL(10,2) NOT NULL,
categoria_id BIGINT,
FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Inserção das pizas
INSERT INTO pizzas(nome,ingredientes,tamanho,valor,categoria_id)
VALUE
("Margherita", "Molho, mussarela, manjericão", "Grande", 49.90, 1),
("Calabresa", "Calabresa, cebola, mussarela", "Grande", 45.00, 1),
("Quatro Queijos", "Mussarela, gorgonzola, parmesão, provolone", "Grande", 55.00, 2),
("Frango com Catupiry", "Frango, catupiry, mussarela", "Grande", 60.00, 2),
("Pepperoni Premium", "Pepperoni importado, mussarela", "Grande", 79.90, 3),
("Chocolate", "Chocolate ao leite", "Grande", 52.00, 4),
("Banana com Canela", "Banana, canela, açúcar", "Grande", 50.00, 4),
("Vegetariana", "Legumes, tomate, mussarela", "Grande", 48.00, 5);

-- Pizzas com valor maior que R$ 45,00
SELECT *
FROM pizzas
WHERE valor > 45.00;

-- Pizzas com valor entre R$ 50,00 e R$ 100,00
SELECT *
FROM pizzas
WHERE valor BETWEEN 50.00 AND 100.00;


-- Pizzas que possuem a letra M no nome
SELECT *
FROM pizzas
WHERE nome LIKE "%M%";

-- INNER JOIN entre pizzas e categorias
SELECT p.nome, p.valor, p.tamanho, c.nome AS categoria
FROM pizzas p
INNER JOIN categorias c
ON p.categoria_id = c.id;

-- INNER JOIN trazendo apenas pizzas da categoria Doce
SELECT p.nome, p.valor, p.tamanho, c.nome AS categoria
FROM pizzas p
INNER JOIN categorias c
ON p.categoria_id = c.id
WHERE c.nome = "Doce";

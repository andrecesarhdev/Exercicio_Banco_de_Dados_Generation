/*ATIVIDADE 01 - JOIN
Crie um banco de dados para um serviço de um Games Online. O nome do Banco de dados deverá ter o seguinte nome db_generation_game_online. 
O sistema trabalhará com as informações dos personagens do jogo. O sistema trabalhará com 2 tabelas tb_personagens e tb_classes,
 que deverão estar relacionadas.
Boas Práticas:
Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.
Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.
Insira 5 registros na tabela tb_classes.
Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.
Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, 
onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, 
no repositório que você criou sobre Banco de dados.*/

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_generation_game_online;
USE db_generation_game_online;

-- Criação da Tabela de Classes
CREATE TABLE IF NOT EXISTS tb_classes(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
descricao VARCHAR(255) NOT NULL
);

-- Inserção de dados na tabela tb_classes
INSERT INTO tb_classes (nome, descricao)
VALUES
("Guerreiro", "Alta força e resistência física"),
("Arqueiro", "Ataques à distância com alta precisão"),
("Mago", "Uso de magias ofensivas e defensivas"),
("Assassino", "Alta velocidade e dano crítico"),
("Paladino", "Equilíbrio entre ataque e defesa");

-- Criação da tabela de personagens
CREATE TABLE IF NOT EXISTS tb_personagens(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
poder_ataque INT NOT NULL,
poder_defesa INT NOT NULL,
nivel INT NOT NULL,
classe_id BIGINT,
FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- Inserção de dados na tabela tb_personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id)
VALUES
("Arthas", 2500, 1800, 15, 1),
("Cassandra", 1800, 1200, 12, 2),
("Merlin", 3000, 900, 20, 3),
("Cael", 2200, 1100, 14, 4),
("Leon", 1900, 2100, 16, 5),
("Cecilia", 1600, 1300, 11, 2),
("Draco", 2800, 1700, 18, 1),
("Celeste", 2000, 1000, 13, 3);

-- Personagens com poder de ataque maior que 2000
SELECT * 
FROM tb_personagens
WHERE poder_ataque > 2000;

-- Personagens com poder de defesa entre 1000 e 2000
SELECT *
FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Personagens que possuem a letra C no nome
SELECT *
FROM tb_personagens
WHERE nome LIKE "%C%";

-- INNER JOIN unindo dados de personagens e classes
SELECT p.nome, p.poder_ataque, p.poder_defesa, p.nivel, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c
ON p.classe_id = c.id;

-- INNER JOIN trazendo apenas personagens da classe Arqueiro
SELECT p.nome, p.poder_ataque, p.poder_defesa, p.nivel, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c
ON p.classe_id = c.id
WHERE c.nome = "Arqueiro";

/*Atividade 3

Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as informações dos estudantes deste registro dessa escola. 
Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se trabalhar 
com o serviço dessa escola.
Insira nesta tabela no mínimo 8 dados (registros).
Faça um SELECT que retorne todes o/a(s) estudantes com a nota maior do que 7.0.
Faça um SELECT que retorne todes o/a(s) estudantes com a nota menor do que 7.0.
Ao término atualize um registro desta tabela através de uma query de atualização.
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL)
 e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados. */
 
 -- Criação do bando de dados
 CREATE DATABASE IF NOT EXISTS db_escola;
 USE db_escola;

-- Criação da tabela de estudantes
CREATE TABLE IF NOT EXISTS tb_estudante(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
matricula VARCHAR(20) NOT NULL,
turma VARCHAR(50) NOT NULL,
media DECIMAL(4,2) NOT NULL
);

-- Inserção dos estudantes
INSERT INTO tb_estudante(nome, matricula, turma, media)
VALUES
("Ana Paula Silva", "001", "3A", 8.5),
("Bruno Henrique Lima", "002", "3A", 6.8),
("Carla Mendes", "003", "2B", 7.2),
("Daniel Souza", "004", "1C", 5.9),
("Eduarda Ramos", "005", "2B", 9.1),
("Felipe Costa", "006", "1C", 6.4),
("Gabriela Nunes", "007", "3A", 7.8),
("Henrique Alves", "008", "2B", 4.5);

-- Estudantes com nota maior que 7.0
SELECT * 
FROM tb_estudante
WHERE media > 7.0;

-- Estudantes com nota menor que 7.0
SELECT * 
FROM tb_estudante
WHERE media < 7.0;

-- Atualização de um registro
UPDATE tb_estudante
SET media = 7.0
WHERE id = 2;

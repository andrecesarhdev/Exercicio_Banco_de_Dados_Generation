/* ATIVIDADE 01
Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos colaboradores desta empresa. ok
Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar com o serviço deste RH. 
Insira nesta tabela no mínimo 5 dados (registros).
Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.
Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.
Ao término atualize um registro desta tabela através de uma query de atualização.
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal,
 no repositório que você criou sobre Banco de dados. */ 
 
 -- Criação do banco de dados
 CREATE DATABASE db_rh;
 USE db_rh;
 
 -- Criação da tabela colaboradores
 CREATE TABLE tb_colaboradores(
 id BIGINT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(255) NOT NULL,
 matricula VARCHAR(255) NOT NULL,
 cargo VARCHAR(255) NOT NULL,
 salario DECIMAL(10,2) NOT NULL
 );
 
 -- Inserção de Dados
 INSERT INTO tb_colaboradores(nome, matricula, cargo, salario) 
VALUES 
("André César","001", "Desenvolvedor fullstack jr", 4500),
("Rayanne Santos","002", "Contadora", 10200),
("Bernardo Henrique","003", "Estagiario", 1300),
("Gabriel Henrique","004", "Treinee", 700),
("Miriam Campello","005", "Assistente Administrativa", 1890);

-- Colaboradores com salrio maior que 2000
SELECT * 
FROM tb_colaboradores
WHERE salario > 2000;

-- Colaboradores com salrio menor que 2000
SELECT * 
FROM tb_colaboradores
WHERE salario < 2000;

-- Atualização de Dados de um colaborador
UPDATE tb_colaboradores 
SET salario = 890 
WHERE id = 4;

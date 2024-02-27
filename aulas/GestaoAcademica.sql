-- CRIANDO BANCO DE DADOS CASO NÃO EXISTA
CREATE DATABASE IF NOT EXISTS gestaoacademica;
USE gestaoacademica;

-- DDL -- criação de tabela
CREATE TABLE IF NOT EXISTS aluno(
	Matricula INT  AUTO_INCREMENT, 
	Nome VARCHAR(50) NOT NULL,
    Cpf VARCHAR(11) NOT NULL UNIQUE,
    PRIMARY KEY (Matricula)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.curso(
	Id INT  AUTO_INCREMENT,
    Nome VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.disciplina(
	Id INT  AUTO_INCREMENT,
    Nome VARCHAR (50) NULL DEFAULT NULL,
    Horas INT NOT NULL DEFAULT 0,
    PRIMARY KEY(Id)
);

CREATE TABLE IF NOT EXISTS professor(
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(100) NULL DEFAULT NULL,
    Especializacao VARCHAR(100) NULL DEFAULT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS matricula(
	Aluno_id INT,
    Curso_id INT,
    DataMatricula DATE NOT NULL,
    PRIMARY KEY (Aluno_id, Curso_id),
    FOREIGN KEY(Aluno_id) REFERENCES aluno(Matricula),
    FOREIGN KEY (Curso_id) REFERENCES curso(Id)
);

CREATE TABLE IF NOT EXISTS disciplina_curso(
	Curso_id INT,
    Disciplina_id INT,
    PRIMARY KEY (Curso_id,Disciplina_id),
    FOREIGN KEY (Curso_id) REFERENCES disciplina (Id),
    FOREIGN KEY (curso_id) REFERENCES curso (Id)
);

CREATE TABLE IF NOT EXISTS professores_disciplinas(
	Professor_id INT,
    Disciplina_id INT,
    PRIMARY KEY (Professor_id,Disciplina_id),
    FOREIGN KEY (Professor_id) REFERENCES professor (id),
    FOREIGN KEY (Disciplina_id) REFERENCES disciplina (id)
);	

-- DML -- INSERÇÃO DE DADOS 

INSERT INTO Aluno (Nome, cpf) VALUES 
('Carlos Silva', '12345678901'),
('Pedro Rocha', '23456789012'),
('Monica Sousa','34567890123'),
('Fabio Silva', '456789012234');


INSERT INTO curso (Nome) VALUES 
	('Ciências da Computação'),
    ('Engenharia Civil'),
    ('Administração'),
    ('Medicina'),
    ('Arquietetura');

INSERT INTO Matricula (Aluno_id,Curso_id,DataMatricula) VALUES
(1,2,'2024-02-01'),
(1,5,'2024-02-02'),
(2,2,'2024-01-02'),
(2,5,'2024-02-01'),
(3,2,'2024-01-15'),
(3,5,'2024-01-29');

INSERT INTO Professor (Nome, Especializacao) VALUES
('Huguinho', 'Tecnologia'),
('Zezinho', 'Idiomas'),
('Luizinho', 'Cálculo'),
('Tico', 'Tecnologia'),
('Teco', 'Idiomas');


INSERT INTO disciplina (Nome,Horas) VALUES 
('Matematica "Avançada 2"', 40),
('Inglês Técnico', 40),
("LInguagem de Programação", 45);

INSERT INTO Professores_Disciplinas (Professor_ID, Disciplina_ID) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2);
    
    INSERT INTO Disciplina_Curso(Disciplina_ID, Curso_ID) VALUES
	(1, 1),
    (2, 2),
    (3, 3);

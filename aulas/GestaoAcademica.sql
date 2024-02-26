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
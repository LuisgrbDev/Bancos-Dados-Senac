-- Criação do Banco de Dados
CREATE DATABASE GestaoAcademica;
-- CREATE DATABASE IF NOT EXISTS GestaoAcademica;
-- DROP DATABASE GestaoAcademica;
-- Seleção do Banco de Dados
USE GestaoAcademica;
CREATE TABLE IF NOT EXISTS Curso (    
Id INT PRIMARY KEY,    
Nome VARCHAR(100));
CREATE TABLE IF NOT EXISTS Disciplina (
    Id INT PRIMARY KEY,    
    Nome VARCHAR(50),    
    Creditos INT);
    
    CREATE TABLE IF NOT EXISTS Professor (    
    Id INT PRIMARY KEY,    
    Nome VARCHAR(100),    
    Especializacao VARCHAR(50));
    
    CREATE TABLE IF NOT EXISTS Aluno (    
    Matricula INT PRIMARY KEY,    
    Nome VARCHAR(100));
    
    CREATE TABLE IF NOT EXISTS Matricula (    
    Aluno_ID INT,    
    Curso_ID INT,    
    Data_Matricula DATE,    
    PRIMARY KEY(Aluno_ID, Curso_ID),    
    FOREIGN KEY (Aluno_ID) REFERENCES Aluno(Matricula),    
    FOREIGN KEY (Curso_ID) REFERENCES Curso(Id));
    
    CREATE TABLE IF NOT EXISTS Professor_Disciplina(   
    Professor_ID INT,    
    Disciplina_ID INT,    
    PRIMARY KEY (Professor_ID, Disciplina_ID),    
    FOREIGN KEY (Professor_ID) REFERENCES Professor(Id),    
    FOREIGN KEY (Disciplina_ID) REFERENCES Disciplina(Id));

CREATE TABLE IF NOT EXISTS Disciplina_Curso( 
Disciplina_ID INT,    
Curso_ID INT,   
 PRIMARY KEY(Disciplina_ID, Curso_ID),   
 FOREIGN KEY (Disciplina_ID) REFERENCES Disciplina(Id),    
 FOREIGN KEY (Curso_ID) REFERENCES Curso(Id));
 
 -- ddl add column
 -- adicionando coluna
 ALTER TABLE professor
	ADD carga_horaria INT NOT NULL;
    
ALTER TABLE aluno
    ADD CPF VARCHAR(11) UNIQUE NOT NULL;
    
SELECT  * FROM professor;

-- removendo coluna ddl drop column
ALTER TABLE PROFESSOR 
	DROP COLUMN carga_horaria;
    
-- DDL CHANGE COLUMN
ALTER TABLE disciplina
	CHANGE creditos credito INT NOT NULL;

-- altere a coluna aluno.nome para varchar de 50 caracteres e não nulo
ALTER TABLE aluno
 CHANGE nome nome VARCHAR(50) NOT NULL;
 
 -- alterar a coluna disciplina.credito para "Horas" não nulo
 ALTER TABLE disciplina
 CHANGE credito Horas INT NOT NULL;
 

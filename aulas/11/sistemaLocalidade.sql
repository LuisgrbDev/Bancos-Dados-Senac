-- Enunciado: Sistema de Localidades
CREATE DATABASE sistemaLocalidade;
-- Você está desenvolvendo um sistema de localidades que precisa armazenar informações sobre cidades e
-- estados. Cada estado deve conter seu nome e Unidade Federativa (UF), 
-- enquanto cada cidade deve conter seu nome e, opcionalmente, pertencer a um estado.
-- Siga os passos abaixo para criar as tabelas necessárias:
USE sistemalocalidade;
-- Criar Tabela de Estados:
-- Crie uma tabela chamada ESTADO.
-- Adicione os seguintes campos à tabela:
-- ID (chave primária, auto-incremento)
-- Nome (tipo VARCHAR, não nulo)
-- UF (Unidade Federativa - tipo VARCHAR, não nulo)
-- Criar Tabela de Cidades:

-- Crie uma tabela chamada CIDADE.
-- Adicione os seguintes campos à tabela:
-- ID (chave primária, auto-incremento)
-- Nome (tipo VARCHAR, não nulo)
-- Estado_ID (referência à tabela ESTADO.ID)
CREATE TABLE estado (
	ID INT AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	UF VARCHAR(2) NOT NULL,
    PRIMARY KEY (ID)
);


CREATE TABLE Cidade(
	ID INT AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Estado_ID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (Estado_ID) REFERENCES estado (ID)
);


-- Inserir Dados Reais:
INSERT INTO estado(nome,uf) VALUES
('Rio de janeiro', 'RJ')
;

INSERT INTO cidade (Nome,Estado_id) VALUES
('Gotham City',NULL),
('Metropolis', NULL),
('Lorien',NULL),
('Minas Tirith',NULL)
;
SELECT * FROM CIDADE;
SELECT * FROM ESTADO;

-- -----------------------
-- Consultas SQL com Join
-- -----------------------
SELECT CIDADE.nome, ESTADO.nome 
FROM CIDADE 
INNER JOIN ESTADO ON CIDADE.ESTADO_ID = ESTADO.ID;

SELECT CIDADE.nome AS CIDADE, ESTADO.Nome  AS ESTADO, ESTADO.uf AS UF
FROM CIDADE 
INNER JOIN ESTADO ON CIDADE.ESTADO_ID = ESTADO.ID;

SELECT *
FROM CIDADE 
INNER JOIN ESTADO ON CIDADE.ESTADO_ID = ESTADO.ID;

SELECT CIDADE.iD, CIDADE.nome AS CIDADE, ESTADO.Nome  AS ESTADO, ESTADO.uf AS UF
FROM CIDADE 
INNER JOIN ESTADO ON CIDADE.ESTADO_ID = ESTADO.ID;
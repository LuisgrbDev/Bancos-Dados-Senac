USE sistemalocalidade;

CREATE TABLE prefeito(
	ID INT AUTO_INCREMENT, 
    Nome VARCHAR(50) NOT NULL,
    DataPosse DATE NOT NULL,
    PRIMARY KEY (ID)
);

ALTER TABLE cidade 
ADD Prefeito_ID INT,
ADD FOREIGN KEY (Prefeito_id) REFERENCES PREFEITO (id); 

INSERT INTO  prefeito (Nome, DataPosse) VALUES 
('José Serra',2007-01-01),
('Fernando Haddad',2013-01-01),
('Guilherme Boulos',2025-01-01),
('Marta Suplicy', 2001-01-01);
DROP TABLE prefeito;
SELECT * FROM PREFEITO;



 INSERT INTO CIDADE (NOME, ESTADO_ID,PREFEITO_ID) VALUES
 ('VILA PRUDENTE', 1, 3);
 
 
 SELECT CIDADE.nome AS NomeCidade, PREFEITO.nome AS NomePrefeito, ESTADO.UF AS UF
 FROM CIDADE
 LEFT JOIN prefeito ON CIDADE.prefeito_id = prefeito.id
 INNER JOIN estado ON CIDADE.estado_id = estado.id;
 


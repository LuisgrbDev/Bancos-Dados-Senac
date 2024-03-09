-- HAVING 

-- SELECIONr chales COM MÉDIA DE CAPACIDADE SUPERIOR A 3:

SELECT codChale, AVG(capacidade) AS capacidade_media
FROM chale
GROUP BY codChale
HAVING capacidade_media > 3;


-- SELECIONE OS CLIENTES COM MAIS DE UMA HOSPEDAGEM REGISTRADA

SELECT codCliente, COUNT(*) AS qtd_hopedagens
FROM hospedagem 
GROUP BY codCliente
HAVING qtd_hopedagens > 1;


-- SELECIONAR SERVICOS COM VALOR TOTAL SUPERIOR A 40

SELECT codServico, SUM(valorServico) AS total_valor FROM SERVICO 
GROUP BY codServico HAVING total_valor > 15;

SELECT hospedagem_servico.codHospedagem, SUM(servico.valorServico) AS total_valor
FROM hospedagem_servico
JOIN servico ON hospedagem_servico.codServico = servico.codServico
GROUP BY hospedagem_servico.codHospedagem
HAVING total_valor > 40;
 
 
 
 -- criar uma view
 CREATE VIEW ViewMedidaCapacidade AS
 SELECT codChale, AVG(capacidade) AS capacidade_media
 FROM chale
 GROUP BY codChale;

-- SELECIONAR DADOS DA VIEW

SELECT * FROM ViewMedidaCapacidade;

CREATE VIEW hospedes AS
SELECT hospedagem.*, cliente.nomeCliente,telefone.telefone,telefone.tipoTelefone FROM hospedagem 
JOIN CLIENTE ON hospedagem.codCLiente = cliente.codCliente
JOIN TELEFONE ON telefone.codCliente = cliente.codCliente;

SELECT * FROM hospedes;

-- CRIAR UM INDICE NA COLUNA codCliente da tabela telefone

CREATE INDEX idx_codCliente ON telefone(codCliente);






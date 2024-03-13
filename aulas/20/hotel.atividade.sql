-- Criar uma Transaction que,quando o cliente fizer uma hospedagem 
START TRANSACTION;
INSERT INTO hospedagem(codChale,codCliente,dataInicio,dataFim,qtdPessoas,desconto,valorFInal) 
VALUES (3,5,'2024-03-2024','2024-03-16',3,5,100.00);
SET @NovaHospedagemID = last_insert_id();
-- automaticamente adicione um café da manha para sua hospedagem 
INSERT INTO hospedagem_servico VALUES
(@NovaHospedagemID,1,'2024-03-12');
COMMIT;


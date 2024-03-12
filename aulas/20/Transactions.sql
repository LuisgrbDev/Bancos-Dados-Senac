-- 0 Iniciando a transação 
START TRANSACTION;

-- 1 Inserindo um novo pedido
INSERT INTO pedido (clienteId,dataPedido) VALUES (1,'2024-03-12');
-- Criando Variável 
SET @novoPedidoID = last_insert_id();
-- 2 Inserindo os itens do pedido
INSERT INTO itenspedido (pedidoID,produtoID,Quantidade) VALUES (@novoPedidoID,4,6);
-- 3 atualizando a quantidade do produto no estoque
UPDATE produto SET quantidade = quantidade - 6 WHERE ID = 4;
--  DESFAZENDO A TRANSAÇÃO
 -- ROLLBACK;
	 COMMIT;
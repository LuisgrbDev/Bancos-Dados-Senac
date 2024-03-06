use compras;
select*from cliente;
SELECT COUNT(*) AS Total_Pedidos FROM PEDIDO;

SELECT DISTINCT clienteId  FROM PEDIDO;
-- SELECT QUANTOS PEDIDOS CADA CLIENTE FEZ
SELECT clienteid, COUNT(*)  FROM PEDIDO GROUP BY CLIENTEID;

-- SELECIONAR O TOTAL DE PRODUTOS POR PEDIDO
SELECT PedidoId, COUNT(*) AS ProdutoPorPedido
FROM itenspedido
GROUP BY pedidoId;


-- SELECIONAR PRODUTOS MAIS VENDIDOS
SELECT produtoID, SUM(quantidade) AS MaisVendidos
FROM itenspedido
GROUP BY produtoID
ORDER BY MaisVendidos DESC;

/* LISTE OS CLIENTES INFORMANDO:
TOTAL GASTO,MEDIA DE PRODUTOS,DATA DO PRIMEIRO E ULTIMO PEDIDO
*/

SELECT 
cliente.nome, cliente.sobrenome,
COUNT(*) AS NumPedidos,
SUM(produto.preco * itenspedido.quantidade) AS TotalGasto,
AVG(itenspedido.quantidade) AS MediaProdutosPorPedido,
MIN(pedido.datapedido) AS PrimeiroPedido,
MAX(pedido.datapedido) AS  UltimoPedido 
FROM pedido
JOIN itenspedido ON pedido.id = itenspedido.pedidoid
JOIN produto ON itenspedido.produtoid = produto.id
JOIN cliente ON cliente.id = pedido.clienteId
GROUP BY pedido.clienteID;
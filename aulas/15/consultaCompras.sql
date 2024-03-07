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

select*from produto;

-- Encontrar produtos com o preco entre 50 e  150 reias
Select * FROM produto WHERE preco >= 50 AND preco <= 150;

SELECT * FROM produto WHERE preco BETWEEN 50 AND 150;




-- Mostre tudo dos produtos com ID 1, 5 e 7

SELECT * FROM produto WHERE id= 1 OR id = 5 OR id = 7;

SELECT * FROM produto WHERE id IN (1,3,7);

-- Mostre todos os clientes que o sobrenome termine com "a"
SELECT * FROM CLIENTE WHERE SOBRENOME LIKE '%A';


-- Mostre os 5 Produtos mais caros da loja
SELECT * FROM produto Order BY preco DESC LIMIT 5;


-- LISTANDO OS PRODUTOS POR PAGINAS CADA PAGINA CABENDO 2 PRODUTOS, ME MOSTRE A PAGINA 3

SELECT * FROM produto LIMIT 2 OFFSET 4;


-- CONSULTE OS PEDIDOS FEITOS ENTRE 2024 - 03- 01 E 2024-03-05, LIMITANDO A 5 RESULTADO
 
 SELECT * FROM pedido WHERE dataPedido BETWEEN  '2024-03-01' AND '2024-03-05' LIMIT 5 ;
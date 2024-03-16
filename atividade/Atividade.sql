USE sistema_vendas;
DROP DATABASE SISTEMA_VENDAS;
################## DDL
-- 1. Crie uma tabela chamada Fornecedor para armazenar informações sobre os fornecedores do sistema.
-- id, nome, endereço, telefone, email e uma observação (text)
 CREATE TABLE IF NOT EXISTS Fornecedor (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereço VARCHAR(100) NOT NULL,
    Telefone VARCHAR(25) NOT NULL,
    Email VARCHAR(50),
    Observacao TEXT
 );


-- 2. Adicione uma coluna chamada CNPJ à tabela Fornecedor para armazenar os números de CNPJ dos fornecedores.

ALTER TABLE fornecedor ADD COLUMN CNPJ VARCHAR(11) NOT NULL;

-- 3. Adicione uma chave estrangeira à tabela Fornecedor para relacioná-la à tabela Categoria, representando a categoria do fornecedor.
ALTER TABLE fornecedor ADD COLUMN categoriaId INT, ADD FOREIGN KEY (categoriaID) REFERENCES categoria(id);

-- 4. Modifique o tipo da coluna Telefone na tabela Fornecedor para armazenar números de telefone com no máximo 15 caracteres.

ALTER TABLE Fornecedor
 CHANGE telefone telefone VARCHAR(15);

-- 5. Remova a coluna Observacao da tabela Fornecedor, pois não é mais necessária.

ALTER TABLE fornecedor
DROP COLUMN observacao;

-- 6. Remova a tabela Fornecedor do banco de dados, se existir.

DROP TABLE fornecedor;

#################### DML
-- 0. Crie ao menos 5 registros para cada tabela, ignorando o gerneciamento de usuários. Um dos clientes deverá ter o seu nome

INSERT INTO Categoria (nome, descricao, UsuarioAtualizacao)
VALUES ('Tecnologia', 'Produtos e inovações tecnológicas', 1),
('Tecnologia', 'Produtos e inovações tecnológicas', 2),
('Esportes', 'Tudo sobre esportes variados', 3),
('Música', 'Gêneros, instrumentos e notícias sobre música', 4),
('Viagem', 'Dicas, destinos e experiências de viagens', 5);

INSERT INTO FormaPagamento (Nome, descricao, UsuarioAtualizacao) VALUES 
('Cartão de Crédito', 'Pagamento realizado por meio de cartões de crédito das principais bandeiras', 1),
('Boleto Bancário', 'Pagamento realizado por meio de boleto bancário emitido pelo vendedor', 2),
('PIX', 'Pagamento instantâneo utilizando chave PIX', 3),
('Transferência Bancária', 'Pagamento realizado por transferência entre contas bancárias', 4),
('Dinheiro', 'Pagamento realizado em espécie', 5);

INSERT INTO produto (Nome, descricao, Preco, CategoriaID, UsuarioAtualizacao)
VALUES ('Smartphone XYZ', 'Smartphone com 128GB de memória e câmera de 48MP', 2500.00, 1 , 1),
('Bicicleta Montanheira', 'Bicicleta ideal para trilhas e terrenos irregulares', 1200.00, 3, 3),
('Guitarra Elétrica Fender', 'Guitarra elétrica modelo Stratocaster', 7800.00, 4, 4),
 ('Mochila de Viagem 70L', 'Mochila resistente e espaçosa para longas viagens', 450.00, 5, 5),
  ('Mochila de Viagem 30L', 'Mochila resistente para longas viagens', 45.00, 5, 5)
;
INSERT INTO produto (Nome, descricao, Preco) VALUES 
('Caneca Personalizada', 'Caneca com estampas personalizadas.', 25.00),
 ('Caderno Ecológico', 'Caderno feito de material reciclado.', 15.90),
 ('Garrafa Sustentável', 'Garrafa reutilizável com material sustentável.', 30.00),
('O Apanhador no Campo de Centeio', 'Livro clássico da literatura americana', 59.90); 

INSERT INTO cliente (Nome,email,telefone,usuarioAtualizacao) VALUES
('Luis Gustavo','luis@gmail.com','11978918311',1),
('Walter Souza','Waltinho@gmail.com','11123456789',2),
('Marcela Texeira','marcela@gmail.com','11123456798',3),
('Carlos Souza','carlos@gmail.com','11123456987',4),
('Karen Pereira','Karen@gmail.com','11123459876',5);

INSERT INTO Pedido (ClienteId, DataPedido, FormaPagamentoId, status, UsuarioAtualizacao)
VALUES 
(1, CURRENT_DATE(), 1, 'Processando', 1),
(2, CURRENT_DATE(), 2, 'Enviado', 2),
(3, '2024-03-14 10:00:00', 3, 'Entregue', 3),
(4, '2024-03-15 15:30:00', 4, 'Cancelado', 4),
(5, '2024-03-16 20:00:00', 5, 'Aguardando Pagamento', 5);

INSERT INTO ItemPedido (PedidoId, ProdutoId, Quantidade, UsuarioAtualizacao)
VALUES (1, 1, 2, 1),
(1, 2, 1, 1),
(2, 3, 3, 2),
(3, 4, 1, 3),
(4, 5, 2, 4); 

-- 1. Atualizar o nome de um cliente:
UPDATE cliente SET nome = 'Walter Texeira' WHERE id = 2;

-- 2. Deletar um produto:


DELETE FROM produto WHERE id = 9;

-- 3. Alterar a categoria de um produto:
UPDATE produto SET categoriaID = 3 WHERE id =5;
-- 4. Inserir um novo cliente:
INSERT INTO cliente (Nome,email,telefone,usuarioAtualizacao) VALUES
('Yasmin Silva','yasmina@gmail','11123498765',3);

-- 5. Inserir um novo pedido:
INSERT INTO Pedido (ClienteId, DataPedido, FormaPagamentoId, status, UsuarioAtualizacao)
VALUES 
(2, CURRENT_DATE(), 3, 'Processando', 1);

-- 6. Atualizar o preço de um produto:

UPDATE produto SET preco = 400.00 WHERE id = 5;

############## DQL - Sem Joins
-- 1. Selecione todos os registros da tabela Produto:

SELECT*FROM produto;

-- 2. Selecione apenas o nome e o preço dos produtos da tabela Produto:

SELECT nome,preco FROM produto;

-- 3. Selecione os produtos da tabela Produto ordenados por preço, do mais barato para o mais caro:
SELECT * FROM produto ORDER BY preco ;

-- 4. Selecione os produtos da tabela Produto ordenados por preço, do mais caro para o mais barato:
SELECT * FROM produto ORDER BY preco DESC;
-- 5. Selecione os nomes distintos das categorias da tabela Categoria:

SELECT DISTINCT nome FROM categoria;

-- 6. SELECT os produtos FROM tabela Produto WHERE preço esteja BETWEEN $10 e $50:
SELECT * FROM produto WHERE preco BETWEEN  10 and 50;

-- 7. Selecione os produtos da tabela Produto, mostrando o nome como "Nome do Produto" e o preço como "Preço Unitário":
 SELECT nome AS NomedoProduto, preco AS PrecoUnitário FROM produto;

-- 8. SELECT os produtos da tabela Produto, adicionando uma coluna calculada "Preço Total" multiplicando a quantidade pelo preço:

SELECT *, (preco * 2) AS PreçoTotal FROM produto;

-- 9. Selecione os produtos da tabela Produto, mostrando apenas os 10 primeiros registros:
-- CADASTREI AO MENOS 5 PRODUTOS SÓ
SELECT * FROM produto limit 2;
-- 10. Selecione os produtos da tabela Produto, pulando os primeiros 5 registros e mostrando os 10 seguintes:
-- offset não funciona sem LIMIT fiquei travado mas deu 
SELECT * FROM produto LIMIT 10 OFFSET 2;

############# DQL - Joins
-- 1. Selecione o nome do produto e sua categoria:

SELECT PRODUTO.nome AS NomeProduto, CATEGORIA.nome AS Categoria FROM produto 
JOIN categoria ON PRODUTO.categoriaID = CATEGORIA.ID; 

-- 2. Selecione o nome do cliente e o nome do produto que ele comprou:
-- 3 JOINS DE UMA VEZ BUGOU A CABEÇA MAIS SAIU
SELECT CLIENTE.nome AS NomeCliente, PRODUTO.nome AS PRODUTO FROM PEDIDO
INNER JOIN itempedido ON itempedido.pedidoID = pedido.ID
INNER JOIN cliente ON pedido.clienteID = cliente.ID
INNER JOIN produto ON itempedido.produtoID = produto.id;

-- 3. Selecione todos os produtos, mesmo aqueles que não têm uma categoria associada:


SELECT PRODUTO.nome,Produto.preco,produto.descricao, categoria.nome AS CATEGORIA FROM PRODUTO
LEFT JOIN categoria ON produto.categoriaID = categoria.id;

-- 4. Selecione todos os clientes, mesmo aqueles que não fizeram nenhum pedido:

SELECT cliente.*, pedido.dataPedido FROM cliente
LEFT JOIN pedido ON pedido.clienteId = cliente.id;

-- 5. Selecione todas as categorias, mesmo aquelas que não têm produtos associados:

SELECT categoria.*, produto.nome,produto.preco,produto.categoriaID FROM produto
RIGHT JOIN categoria ON produto.categoriaID = categoria.id;

-- 6. Selecione todos os produtos, mesmo aqueles que não foram pedidos:

SELECT Produto.nome, produto.preco,itempedido.pedidoID FROM itempedido
RIGHT JOIN produto ON itempedido.produtoid = produto.ID;

############### DQL com joins e demais filtros
-- 1. Selecione o nome da categoria e o número de produtos nessa categoria, apenas para categorias com mais de 5 produtos:

-- EQUECI QUE DAVA PARA AGRUPAR OS RESULTADOS E TIVE QUE CONSULTAR AS ATIVIDADES
SELECT CATEGORIA.nome, COUNT(*) AS ProdutosPorCategoria FROM produto
JOIN categoria ON PRODUTO.categoriaID = CATEGORIA.id GROUP BY categoria.nome HAVING ProdutosPorCategoria >= 2;
-- Não tem produto categoria com mais de 5 produtos por isso maior igual a 2  para mostrar resultado

-- 2. Selecione o nome do cliente e o total de pedidos feitos por cada cliente:

SELECT CLIENTE.nome,SUM(itempedido.QUANTIDADE) AS TotalDePedidos FROM CLIENTE
JOIN pedido ON CLIENTE.id = PEDIDO.clienteid 
JOIN itempedido ON PEDIDO.ID = itempedido.pedidoId GROUP BY Cliente.id;

-- 3. Selecione o nome do produto, o nome da categoria e a quantidade total de vendas para cada produto:

SELECT produto.nome AS Produto, categoria.nome AS Categoria, sum(itempedido.quantidade) AS TotalVendas FROM produto
JOIN categoria ON produto.categoriaid = categoria.id
JOIN itempedido ON produto.id = itempedido.produtoID GROUP BY produto.nome;

-- 4. Selecione o nome da categoria, o número total de produtos nessa categoria e o número de pedidos para cada categoria:

SELECT categoria.nome AS Categoria, COUNT(produto.categoriaID) AS TotalProduto, SUM(itempedido.produtoID) AS TotalVendas FROM categoria
JOIN produto ON produto.categoriaID = categoria.id 
JOIN  itempedido ON produto.id = itempedido.ProdutoId GROUP BY categoria.nome;

-- 5. Selecione o nome do cliente, o número total de pedidos feitos por esse cliente e a média de produtos por pedido, apenas para clientes que tenham feito mais de 3 pedidos:

SELECT cliente.nome AS Cliente, SUM(itempedido.quantidade) AS TotalPedido,AVG(itempedido.quantidade) AS MediaProdutoPedido  FROM CLIENTE
JOIN pedido ON cliente.id = pedido.clienteID
JOIN itempedido ON pedido.id = itempedido.pedidoID GROUP BY cliente.nome HAVING TotalPedido >= 3;
-- NÃO TEM MAIS QUE 3 PEDIDOS POR ISSO ESTA MAIOR OU IGUAL

##### Crie uma View qualquer para qualquer um dos joins desenvolvidos
CREATE VIEW ProdutoCategoria AS
SELECT PRODUTO.nome AS NomeProduto, CATEGORIA.nome AS Categoria FROM produto 
JOIN categoria ON PRODUTO.categoriaID = CATEGORIA.ID; 

SELECT * FROM ProdutoCategoria;

##### Crie uma transaction que cadastra um cliente e faça uma venda
-- Início da transação
START TRANSACTION;
-- Inserir um novo cliente
INSERT INTO cliente (Nome,email,telefone,usuarioAtualizacao) VALUES 
('Ariana Grande','eternalsunshine@gmail.com','11987654321',9);
SET @NovoCliente = last_insert_id();
-- Inserir um novo pedido para o cliente
INSERT INTO Pedido (ClienteId, DataPedido, FormaPagamentoId, status, UsuarioAtualizacao)
VALUES 
(@novoCliente, CURRENT_DATE(), 1, 'Processando', 9);
SET @NovoPedido = last_insert_id();

-- Inserir itens no pedido
INSERT INTO ItemPedido (PedidoId, ProdutoId, Quantidade, UsuarioAtualizacao)
VALUES (@novoPedido, 1, 2, 1);

COMMIT;

SELECT * FROM CLIENTE;
SELECT * FROM PEDIDO;
SELECT * FROM ITEMPEDIDO;
-- Commit da transação (confirmação das alterações)	
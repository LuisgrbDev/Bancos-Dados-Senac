USE sistemalocalidade;

# 1
-- FAÇA UMA JUNÇÃO DA TABELA CIDADE E ESTADO, MOSTRANDO:
-- NOME DA CIDADE, SIGLA DO ESTADO. APENAS NAS CIDADES QUE TEM ESTADO

SELECT CIDADE.nome AS Cidades, ESTADO.uf AS UF
FROM CIDADE
INNER JOIN ESTADO ON CIDADE.estado_id = ESTADO.id;


# 2
-- FAÇA UMA JUNÇÃO DA TABELA CIDADE E ESTADO, MOSTRANDO:
-- NOME DA CIDADE, SIGLA DO ESTADO. TODAS AS CIDADES, INDEPENDENTE DE TEREM ESTADO
 
SELECT cidade.nome AS CIDADE, estado.uf AS UF
FROM cidade
LEFT JOIN estado ON cidade.estado_id = estado.id;

# 3
-- FAÇA UMA JUNÇÃO DA TABELA CIDADE E ESTADO, MOSTRANDO:
-- NOME DA CIDADE, SIGLA DO ESTADO. MOSTRE TODOS OS ESTADOS, INDEPENDENTE DE TEREM CIDADES

SELECT cidade.nome AS cidades, estado.uf AS UF
FROM cidade
RIGHT JOIN estado ON cidade.estado_id = estado.id;

 
# 4
-- FAÇA UMA JUNÇÃO DA TABELA CIDADE, ESTADO E PREFEITO:
-- CIDADE.NOME, ESTADO.SIGLA/UF, PREFEITO.NOME, PREFEITO.DATAPOSSE
-- PARA TODAS AS CIDADES QUE TEM PREFEITO


SELECT * FROM CIDADE;

SELECT cidade.nome AS CIDADE, estado.uf AS UF, prefeito.nome AS PREFEITO, prefeito.dataposse AS DATA_POSSE
FROM cidade
LEFT JOIN ESTADO ON cidade.estado_id = estado.id 
INNER JOIN prefeito on cidade.Prefeito_ID = prefeito.id;

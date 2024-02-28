-- -- --- ----------
-- Consultas Básicas
-- -----------------

-- EXEMPLO: SELECIONAR TODOS OS ALUNOS
SELECT * FROM aluno;

-- SELECT 
-- FROM 
-- WHERE 
-- ORDER BY

SELECT *
FROM aluno
WHERE matricula >3;

SELECT *
FROM aluno
WHERE matricula >3
ORDER BY nome;

-- Operadores Matemáticos e Lógicos: 
SELECT * FROM disciplina;
-- SELECIONANDO AS DISCIPLINAS QUE AS HORAS SÃO DE 40 A 50 HORAS
SELECT nome, horas FROM disciplina WHERE horas >= 40 and horas <= 50;

-- ALIASES PARA MELHOR LEGIBILIDADE
SELECT nome AS disciplinas, horas AS carga_horaria
FROM disciplina;

-- Exibia da tabela professor, todos os professores por ordem alfabetica 
-- onde o professor tenha ID maior que 2 e menor do que 6
-- Não exibindo a especialização e mudando o nome da coluna "Nome" para "Nome_professor"
SELECT id, nome AS Nome_Professor 
FROM professor 
WHERE id >2 and id <6 
ORDER BY nome;


-- Exemplo: Contar quantas disciplinas existem 
SELECT COUNT(*) AS QuantidadeDeDisciplinas FROM disciplina WHERE horas > 50;

SELECT*FROM matricula;
-- Me informe quantas Matriculas foram feitas no curso de id 2;

SELECT COUNT(*) AS QuantidadeDeMatricula FROM matricula WHERE curso_ID = 2;

-- EXEMPLO: Selecionar professor com especializção que envolva Tecnologia

SELECT * FROM professor WHERE especializacao LIKE '%gia%';

-- SELECIONE TODOS OS CURSOS QUE TERMINEM COM 'MEDICINA' OU COMECEM COM A LETRA 'D'
SELECT * FROM curso WHERE nome LIKE '%medicina' or nome LIKE 'D%';

-- Utilizando Distinct para obter valores Distintos
SELECT DISTINCT ESPECIALIZACAO FROM PROFESSOR;
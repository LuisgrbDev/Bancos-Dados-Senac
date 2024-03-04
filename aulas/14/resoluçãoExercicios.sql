-- selecionando tabela
USE gestaoacademica;

--  Selecionar todos os alunos
SELECT * FROM aluno;

-- Selecionar apenas os nomes e CPFs dos alunos

SELECT nome, cpf FROM aluno;

-- Selecionar alunos matriculados após uma data específica

/*nessa fiquei travada uns 10 minutos porque não sabia que tinha que por data nesse formato: ('date')*/

SELECT * FROM matricula WHERE dataMatricula > ('2024-02-29'); 

-- Contar quantas disciplinas existem com carga horária maior que X

SELECT count(ID) FROM disciplina WHERE horas > 30;

-- Contar quantas matrículas existem para cada curso
/*
OK, nessa tive dificuldade em saber como fazer essa contagem em grupos, fui ao pai google pesquisar
achei esse "GROUP BY" e depois pesquisei no W3 que fala que eles são usados em conjuntos.
E para melhor entendimento tive que fazer dessa forma.
*/
SELECT count(*) AS TotalMatriculas, CURSO.nome FROM matricula  
JOIN CURSO ON matricula.curso_id = curso.id
GROUP BY curso_id;


-- Contar quantas disciplinas cada professor leciona
/*
Fazendo dessa forma ficou mais facil meu entendimento em casos de receber um relatorio e entender o que estão associados;
*/
SELECT  professor.nome AS Professores, COUNT(*) AS LecionaTotal, Disciplina.nome AS Disciplina FROM professores_disciplinas 
INNER JOIN professor ON professores_disciplinas.professor_id = professor.id
INNER JOIN disciplina ON professores_disciplinas.Disciplina_ID = Disciplina.id
GROUP BY Professor_ID;

-- Combinar nome do aluno e data da matrícula

SELECT  MATRICULA.datamatricula AS DataMatricula, ALUNO.nome AS Aluno FROM matricula
INNER JOIN aluno on matricula.aluno_id = aluno.matricula;

-- Combinar nome do curso e nome do aluno
SELECT curso.Nome AS Curso, ALUNO.nome AS Aluno FROM matricula
INNER JOIN ALUNO on matricula.aluno_id = aluno.matricula
JOIN curso ON matricula.curso_ID = curso.id;


-- Contar quantos alunos se matricularam em cada curso
SELECT COUNT(*) AS TotalDeAlunos, CURSO.nome FROM MATRICULA
JOIN CURSO ON matricula.curso_id = curso.id
 GROUP BY curso_id;


-- DML (INSERT - UPDATE - DELETE)

INSERT INTO aluno ( matricula, nome,cpf)  values 
	(6,'Marina Silva','12345678910' ),	
	(7,'Monica Souza','32165498775'),
    (8,'Pedro Rocha', '45678943597');	
	

SELECT * FROM aluno;

-- Insira os cursos Ciência da Computação, engenharia civil, administração medicinia e arquitetura 
-- na tabela gestaoacademica.curso

INSERT INTO curso VALUES
	(1, 'Ciência da Computação'),
    (2, 'Engenharia Civil'),
    (3, 'Administração'),
    (4, 'Medicinia'),
    (5, 'Arquitetura');
    


-- Cadastre o aluno de id 1 nos cursos de id 3 e 5.
-- cadastre o aluno de id 2 nos curso de id 2 e 4.
-- cadastre o aluno de id 3 nos curso de id 2 e 5.
-- para cadastrar uma data, use  o formato '2024-02-23'.


INSERT INTO matricula(aluno_ID, Curso_ID,data_matricula) values
(1, 3, '2024-02-23'),
(1, 5, '2024-01-20'),
(2, 2, '2020-02-03'),
(2, 4, '2021-06-10'),
(3, 2, '2020-02-03'),
(3,5, '2022-09-11');


SELECT * FROM disciplina;

-- Cadastre 5 professores e 3 disciplinas
-- associe cada professro a ao menos uma disciplina
INSERT INTO professor VALUES
(1, 'Jõao Gomes', 'Matematica'),
(2, 'Carlos Miguel','Matematica Avançada'),
(3, 'Daniela  Oliveira', 'Biologia'),
(4, 'karen Silva', 'Instrumentação Cirurgica'),
(5, 'Luca Miguel', 'Informatica' );

INSERT INTO disciplina VALUES 
(1,'Introdução Banco de Dados', 86),
(2,'Biologia', 1000),
(3,'Gestão', 900);

SELECT * FROM professor_disciplina;

INSERT INTO  professor_disciplina VALUES
(1,1),
(2,1),
(3,2),
(4,2),
(5,1),
(5,3),
(2,3),
(1,3);










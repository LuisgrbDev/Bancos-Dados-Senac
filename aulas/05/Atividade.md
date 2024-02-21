# Contexto Inicial: Sistema de Gestão Acadêmica em uma Instituição de Ensino

## Parte 1 - Modelo Conceitual

Em uma instituição de ensino inovadora, é essencial desenvolver um Sistema de Gestão Acadêmica para facilitar a administração eficiente de cursos, alunos, professores, disciplinas e matrículas. Este sistema visa proporcionar uma experiência mais fluida para todos os envolvidos no processo educacional.

Neste contexto, a instituição oferece diversos cursos, cada um composto por disciplinas ministradas por professores especializados. Os alunos têm a opção de se matricular em diferentes cursos, e cada curso pode conter um número variável de alunos. Além disso, um professor pode lecionar várias disciplinas, e uma disciplina pode ser ministrada por diferentes professores ao longo do tempo.

Exercício:

Com base no contexto apresentado, identifique as entidades e seus relacionamentos. Em seguida, elabore um modelo conceitual que represente as relações entre essas entidades.

Entidades:
**Curso**

**Aluno**

**Professor**

**Disciplina**

**matricula**

Relacionamentos

**Um curso pode ter N Disciplinas;**

**Uma disciplina pode pertencer em N cursos;**

**Um curso pode ter N alunos;**

**Um aluno pode se matricular em N cursos;**

**Uma disciplina pode ser ministrada por N professores;**

**Um aluno realiza uma ou mais matriculas;**

**Uma matricula esta associada a um aluno e um curso;**

Agora, com base nessas entidades e relacionamentos, desenvolva um modelo conceitual no DrawIO representando visualmente a estrutura e as interações entre esses elementos.

## Parte 2 - Modelo Lógico

A transição do modelo conceitual para o modelo lógico envolve a representação mais específica das entidades, atributos, relacionamentos e chaves no contexto de um Sistema de Gestão Acadêmica.

Tabelas:
**Curso**
id(PK) - nome - data

**Aluno**

ra (pk) - nome, cpf

**Professor**

ra_professor (pk) - nome, cpf

**Disciplina**

id (pk)- nome

**curso_Disciplina** 

curso_ID (FK) e disciplina_ID (FK)

**Professor_Disciplinas**

Professor_ID (FK), Disciplina_ID(FK)

**Matricula**

aluno_ID (FK) e curso_ID (FK)
data_matricula

Chaves Primárias e Estrangeiras:
(listar)

Agora, com base nessas entidades e relacionamentos, desenvolva um modelo lógico no DrawIO representando visualmente a estrutura completas e as interações entre esses elementos, com seus campos chave refletindo essas interações e seus atributos definidos.


## Parte 3 - SQL

(Reservado para a Aula 06 - Introdução a SQL)
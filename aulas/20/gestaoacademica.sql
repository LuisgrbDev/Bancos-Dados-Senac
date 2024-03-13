-- adicione na tabela gestaoacademica.aluno a coluna 'matriculado'
        ALTER TABLE aluno
        ADD matriculado BOOLEAN; 
        Update ALUNO SET  Matriculado = FALSE; 
-- Crie uma transaction que ao matricular um aluno em um curso
     START TRANSACTION;
     INSERT INTO Matricula(aluno_id,curso_id,dataMatricula) VALUES
     (9,12,'2024-03-12');
-- mude a coluna matriculado para 'true';
 UPDATE aluno SET matriculado = TRUE WHERE matricula = 9;
     COMMIT;
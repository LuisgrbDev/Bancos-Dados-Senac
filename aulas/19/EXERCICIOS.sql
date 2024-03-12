
# Criar Usuário e Atribuir Permissões
-- Crie um usuário chamado 'usuario_vendas' com a senha 'senha*123'
-- Conceda a esse usuário todas as permissões no banco de dados 'compras'

CREATE USER 'usuario_vendas'@'localhost' IDENTIFIED BY 'Senha@123';
GRANT ALL PRIVILEGES ON compras TO 'usuario_vendas'@'localhost';

SHOW GRANTS FOR 'usuario_vendas'@'localhost';
# Ajustar Permissões Específicas
-- Cire um usuário chamado 'usuario_marketing' com a senha 'Senha_456'
-- Conceda a esse usuário a permissão SELECT apenas na tabela 'Produto' do bd 'compras'

CREATE USER 'usuario_marketing'@'localhost' IDENTIFIED BY 'Senha_456';
GRANT SELECT ON compras.produto TO 'usuario_marketing'@'localhost';
SHOW GRANTS FOR 'usuario_marketing'@'localhost';
# Gerenciar Acesso ao ItensPedido
-- Crie um usuário chamado 'usuario_consulta' com a senha 'consultA#123'
-- Conceda a esse usuário permissões de consulta em todas as tabelas do bd 'compras'
-- Verifique as permissões conceidades ao usuário e exiba as informações

	CREATE USER 'usuario_consulta'@'localhost' IDENTIFIED BY 'consultA#123';
    GRANT SELECT ON compras.* TO 'usuario_consulta'@'localhost';
    SHOW GRANTS FOR 'usuario_consulta'@'localhost';
# Revogar Permissões
-- Crie um usuário chamado 'usuario_limitado' com a senha 'Limite%123'
-- Conceda a esse usuário permissão SELECT apenas na tabela 'cliente' do bd 'compras'
-- Revogue a permissão delete para esse usuário na tabela 'cliente'
SELECT User, host FROM mysql.user;
	CREATE USER 'usuario_limitado'@'localhost' IDENTIFIED BY 'Limite%123';
    SHOW GRANTS FOR 'usuario_limitado'@'localhost';
    GRANT SELECT ON compras.cliente TO'usuario_limitado'@'locahost';
    REVOKE DELETE ON compras.cliente FROM 'usuario_limitado'@'localhost';
    
    
    


SELECT User, host FROM mysql.user;

-- criação de um usuario de aplicação
-- CREATE USER 'nome_usuario'@'endereco_de_acesso'
CREATE USER 'aplicacao'@'localhost'
IDENTIFIED BY 'Aplicacao@123';

-- CRIE UM USUARIO "ADMINISTRADOR" COM PERMISSAO DE ACESSO DE QUALQUER LUGAR, COM A SENHA PADRAO
CREATE USER 'administrador'@'%'
IDENTIFIED BY'Administrador@123';

-- mudar senha de usuário
SET PASSWORD FOR 'aplicacao'@'localhost' = PASSWORD('Aplicacao@1234');

-- mudar o host do usuario
RENAME USER 'aplicacao'@'localhost' TO 'aplicacao'@'%';

-- APAGAR USUARIO
DROP USER 'nome_usuario'@'local_de_acesso';
DROP USER 'aplicacao'@'%';

-- Conceder permissões necessárias para o usuario acessar o BD desejado
-- GRANT tipod_de_permissao ON nome_do_banco.nome_da_tabela TO 'usuario'@'lugar'

GRANT ALL PRIVILEGES ON gestaoacademica.* TO 'aplicacao'@'localhost';

GRANT SELECT ON compras.pedido TO 'aplicacao'@'localhost';
-- verificar permissões por usuário
-- SHOW GRANTS FOR  'aplicacao'@'localhost'
SHOW GRANTS FOR 'aplicacao'@'localhost';

-- REVOGAR PERMISSÕES
-- REVOKE tipo_permissao ON table FROM 'usuario'@'local'
	REVOKE select ON compras.pedido FROM 'aplicacao'@'localhost';
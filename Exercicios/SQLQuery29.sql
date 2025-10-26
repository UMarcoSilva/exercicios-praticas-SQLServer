
SELECT * FROM tb_cliente WHERE cidade = 'Salvador';

CREATE NONCLUSTERED INDEX ixd_tb_cliente_cidade ON tb_cliente (cidade) 
INCLUDE (cpf, nome, sobrenome, email, telefone, numero, rua, complemento);
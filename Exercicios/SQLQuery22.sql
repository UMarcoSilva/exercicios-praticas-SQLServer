DECLARE @NOME VARCHAR(200)

DECLARE CURSOR1 CURSOR FOR  
SELECT TOP 4 NOME
FROM [TABELA DE CLIENTES]
OPEN CURSOR1
FETCH NEXT FROM CURSOR1 INTO @NOME
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @NOME
	FETCH NEXT FROM CURSOR1 INTO @NOME
END;

--###################################

DECLARE @NOME VARCHAR(200)

DECLARE  CURSOR2 CURSOR FOR
SELECT NOME
FROM [TABELA DE VENDEDORES]

OPEN CURSOR2

FETCH NEXT FROM CURSOR2 INTO @NOME

WHILE @@FETCH_STATUS=0
BEGIN
	PRINT @NOME
	FETCH NEXT FROM CURSOR2 INTO @NOME
END;

CLOSE CURSOR2
DEALLOCATE CURSOR2

--##############################

DECLARE @NOME VARCHAR(200)
DECLARE @ENDERECO VARCHAR(MAX)

DECLARE CURSOR1 CURSOR FOR
SELECT NOME, ([ENDERECO 1] + ' ' + BAIRRO + ' ' 
	+ CIDADE + ' ' + ESTADO + ', CEP: ' + CEP) ENDCOMPLETO
FROM [TABELA DE CLIENTES]

OPEN CURSOR1

FETCH NEXT FROM CURSOR1 INTO @NOME, @ENDERECO

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @NOME + ', Endereco: ' + @ENDERECO
	FETCH NEXT FROM CURSOR1 INTO @NOME, @ENDERECO
END;

CLOSE CURSOR1
DEALLOCATE CURSOR1

--#######################################


DECLARE @janeiro MONEY, @fevereiro MONEY, @marco MONEY, @abril MONEY, @maio MONEY, @junho MONEY,
        @julho MONEY, @agosto MONEY, @setembro MONEY, @outubro MONEY, @novembro MONEY, @dezembro MONEY

SET @janeiro = 0
SET @fevereiro = 0
SET @marco = 0
SET @abril = 0
SET @maio = 0
SET @junho = 0
SET @julho = 0
SET @agosto = 0
SET @setembro = 0
SET @outubro = 0
SET @novembro = 0
SET @dezembro = 0

DECLARE CURSOR_MESES CURSOR FOR
SELECT MONTH([DATA]) AS MES, SUM(QUANTIDADE * PREÇO) AS FATURAMENTO
FROM [NOTAS FISCAIS]
INNER JOIN [ITENS NOTAS FISCAIS]
ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
GROUP BY MONTH([DATA])
ORDER BY MONTH([DATA]);

OPEN CURSOR_MESES

DECLARE @data_venda DATE, @valor_venda MONEY
FETCH NEXT FROM CURSOR_MESES INTO @data_venda, @valor_venda
WHILE @@FETCH_STATUS = 0
BEGIN
    IF MONTH(@data_venda) = 1
        SET @janeiro = @janeiro + @valor_venda
    IF MONTH(@data_venda) = 2
        SET @fevereiro = @fevereiro + @valor_venda
    IF MONTH(@data_venda) = 3
        SET @marco = @marco + @valor_venda
    IF MONTH(@data_venda) = 4
        SET @abril = @abril + @valor_venda
    IF MONTH(@data_venda) = 5
        SET @maio = @maio + @valor_venda
    IF MONTH(@data_venda) = 6
        SET @junho = @junho + @valor_venda
    IF MONTH(@data_venda) = 7
        SET @julho = @julho + @valor_venda
    IF MONTH(@data_venda) = 8
        SET @agosto = @agosto + @valor_venda
    IF MONTH(@data_venda) = 9
        SET @setembro = @setembro + @valor_venda
    IF MONTH(@data_venda) = 10
        SET @outubro = @outubro + @valor_venda
    IF MONTH(@data_venda) = 11
        SET @novembro = @novembro + @valor_venda
    IF MONTH(@data_venda) = 12
        SET @dezembro = @dezembro + @valor_venda

    FETCH NEXT FROM CURSOR_MESES INTO @data
END

CLOSE CURSOR_MESES
DEALLOCATE CURSOR_MESES


--#########################
DECLARE @data_venda DATE, @valor_venda MONEY
DECLARE @janeiro MONEY, @fevereiro MONEY, @marco MONEY, @abril MONEY, @maio MONEY, @junho MONEY,
        @julho MONEY, @agosto MONEY, @setembro MONEY, @outubro MONEY, @novembro MONEY, @dezembro MONEY

SET @janeiro = 0
SET @fevereiro = 0
SET @marco = 0
SET @abril = 0
SET @maio = 0
SET @junho = 0
SET @julho = 0
SET @agosto = 0
SET @setembro = 0
SET @outubro = 0
SET @novembro = 0
SET @dezembro = 0

DECLARE vendas_cursor CURSOR FOR
    SELECT MONTH([DATA]) AS data_venda, SUM(QUANTIDADE * PREÇO) AS valor_venda
FROM [NOTAS FISCAIS]
INNER JOIN [ITENS NOTAS FISCAIS]
ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
GROUP BY MONTH([DATA])
ORDER BY MONTH([DATA]);

OPEN vendas_cursor

FETCH NEXT FROM vendas_cursor INTO @data_venda, @valor_venda

WHILE @@FETCH_STATUS = 0
BEGIN
    IF MONTH(@data_venda) = 1
        SET @janeiro = @janeiro + @valor_venda
    IF MONTH(@data_venda) = 2
        SET @fevereiro = @fevereiro + @valor_venda
    IF MONTH(@data_venda) = 3
        SET @marco = @marco + @valor_venda
    IF MONTH(@data_venda) = 4
        SET @abril = @abril + @valor_venda
    IF MONTH(@data_venda) = 5
        SET @maio = @maio + @valor_venda
    IF MONTH(@data_venda) = 6
        SET @junho = @junho + @valor_venda
    IF MONTH(@data_venda) = 7
        SET @julho = @julho + @valor_venda
    IF MONTH(@data_venda) = 8
        SET @agosto = @agosto + @valor_venda
    IF MONTH(@data_venda) = 9
        SET @setembro = @setembro + @valor_venda
    IF MONTH(@data_venda) = 10
        SET @outubro = @outubro + @valor_venda
    IF MONTH(@data_venda) = 11
        SET @novembro = @novembro + @valor_venda
    IF MONTH(@data_venda) = 12
        SET @dezembro = @dezembro + @valor_venda

    FETCH NEXT FROM vendas_cursor INTO @data

CLOSE vendas_cursor
DEALLOCATE vendas_cursor

PRINT 'Janeiro: ' + CAST(@janeiro AS VARCHAR(20))
PRINT 'Fevereiro: ' + CAST(@fevereiro AS VARCHAR(20))
PRINT 'Março: ' + CAST(@marco AS VARCHAR(20))
PRINT 'Abril: ' + CAST(@abril AS VARCHAR(20))
PRINT 'Maio: ' + CAST(@maio AS VARCHAR(20))
PRINT 'Junho: ' + CAST(@junho AS VARCHAR(20))
PRINT 'Julho: ' + CAST(@julho AS VARCHAR(20))
PRINT 'Agosto: ' + CAST(@agosto AS VARCHAR(20))
PRINT 'Setembro: ' + CAST(@setembro AS VARCHAR(20))
PRINT 'Outubro: ' + CAST(@outubro AS VARCHAR(20))
PRINT 'Novembro: ' + CAST(@novembro AS VARCHAR(20))
PRINT 'Dezembro: ' + CAST(@dezembro AS VARCHAR(20))
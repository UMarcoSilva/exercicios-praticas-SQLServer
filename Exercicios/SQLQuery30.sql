DECLARE @trace_id int;
DECLARE @maxfilesize bigint;
DECLARE @database nvarchar(256);
DECLARE @user nvarchar(512);
DECLARE @time bigint;
SET @maxfilesize = 5;
SET @database = 'db_vendas';
SET @user = 'sa';
SET @time = 15000

--###########################################
SELECT * INTO NumsLinha FROM Nums;

SELECT * FROM NumsLinha WHERE N = '10001';

SELECT * FROM [dbo].[Nums] WHERE N = '10001';
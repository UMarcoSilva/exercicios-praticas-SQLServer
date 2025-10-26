

SELECT * FROM [dbo].[RASTREAMENTO_TRACE] 
WHERE Duration >= 6500 and DatabaseName <> 'master';
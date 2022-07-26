DECLARE @FilePath AS NVARCHAR(MAX)
DECLARE @Name AS NVARCHAR(MAX)
SET @FilePath = 'E:\DBBackup\CIMSPROD_'+CONVERT(VARCHAR,GetDate(),12)+'.bak'
SET @Name = 'CIMSPROD-Full Database Backup'

BACKUP DATABASE [CIMSPROD] TO  DISK = @FilePath
WITH NOFORMAT, NOINIT,  NAME = @Name, 
SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
GO
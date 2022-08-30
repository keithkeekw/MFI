DECLARE @DB_Name NVARCHAR(100) = 'msaChannelColour'
DECLARE @PK_ID INT = 100047

--- Checking the Current Primary Key Sequence
DBCC CHECKIDENT (@DB_Name)

---Reseed the Primary Key Sequence
DBCC CHECKIDENT (@DB_Name, RESEED, @PK_ID)
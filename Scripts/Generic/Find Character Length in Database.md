---
Tags: SQL, script
Client: Generic
---

# Find Character Length in Database

```sql
DECLARE @TableName nvarchar(max) = 'msaMusic'
SELECT
	COLUMN_NAME,
	IS_NULLABLE,
	DATA_TYPE,
	CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @TableName
```


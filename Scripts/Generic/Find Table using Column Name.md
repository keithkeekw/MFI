---
Tags: SQL, script
Client: Generic
---
# Search Tables

```sql
SELECT      c.name  AS 'ColumnName' ,t.name AS 'TableName'
FROM        sys.columns c
JOIN        sys.tables  t   ON c.object_id = t.object_id
WHERE       c.name LIKE '%MyName%'
ORDER BY    TableName ,ColumnName;
```

# Search Tables & Views

```sql
SELECT      COLUMN_NAME AS 'ColumnName',TABLE_NAME AS  'TableName'
FROM        INFORMATION_SCHEMA.COLUMNS
WHERE       COLUMN_NAME LIKE '%MyName%'
ORDER BY    TableName ,ColumnName;
```
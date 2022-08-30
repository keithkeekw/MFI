---
Tags: SQL, script
Client: Generic
---
# Checking the Current Primary Key Sequence
```sql
DBCC CHECKIDENT ('msaChannelColour')
```

# Reseed the Primary Key Sequence
```sql
DBCC CHECKIDENT ('msaChannelColour', RESEED, 100047)
```
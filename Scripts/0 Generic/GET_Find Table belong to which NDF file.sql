select o.Name as TableName, fg.groupname as FileGroupName 
from sysobjects o 
 inner join sysindexes i 
  on i.id = o.id 
 inner join sysfilegroups fg 
  on i.groupid = fg.groupid 
where type = 'U' 
 and i.indid in (0,1)
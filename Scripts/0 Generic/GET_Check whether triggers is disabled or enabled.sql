/*
Written by Kee KW
Date: 24th May 2022
Objective: To find all the custom triggers by Astro
*/


SELECT tr.name AS "Trigger Name", o.name AS 'Database',
CASE
	WHEN tr.is_disabled = 0 THEN 'Enabled'
	ELSE 'Disabled'
END AS 'Trigger Status'
FROM sys.triggers tr
INNER JOIN sys.objects o ON o.object_id = tr.parent_id
WHERE tr.name LIKE 'tgr_%' --- This is to find Astro's custom triggers
ORDER BY o.name ASC
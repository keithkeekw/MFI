/*
Objective: Find information about Component Type
Author: Kee KW
*/

With CTE_ComponentType AS (
	SELECT
		C.ComponentID,
		C.ComponentType,
		C.ComponentDescription,
		C.ComponentDuration,
		C.ComponentTypeID,
		R_CompType.Type,
		R_CompType.Commercial AS Commercial,
		R_CompType.Promotion AS Promotion
	FROM msaComponent C
	LEFT JOIN msaRefComponentType R_CompType ON R_CompType.ComponentTypeID = C.ComponentTypeID
)

--- The Overview table
SELECT * FROM CTE_ComponentType

--- Count the amount of Component based on the Component Type
--SELECT Type, ComponentTypeID, COUNT(Type) AS 'Total' 
--FROM CTE_ComponentType
--GROUP BY Type, ComponentTypeID
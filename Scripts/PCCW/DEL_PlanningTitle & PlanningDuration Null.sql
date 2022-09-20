/*
Issue: Unable to create sale log.
Error: Conversion from type 'DBNull' to type 'Date' is not valid
*/

--- List all the planning with both PlanningTitle & PlanningDuration are null.
SELECT
	P.PlanningID,
	P.PlanningTitle,
	P.PlanningDuration,
	P.ChannelID,
	C.ChannelDescription
FROM msaPlanning P
LEFT JOIN msaChannel C ON C.ChannelID = P.ChannelID
WHERE 
P.PlanningDuration IS NULL 
AND P.PlanningTitle IS NULL
AND P.PlanningDate > GETDATE()

-- Delete all the planning with both PlanningTitle & PlanningDuration are null.
DELETE FROM msaPlanning
WHERE PlanningID IN (
	SELECT
	PlanningID
	FROM msaPlanning
	WHERE 
	PlanningDuration IS NULL 
	AND PlanningTitle IS NULL
	AND PlanningDate > GETDATE()
)
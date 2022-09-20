/*
Objective: To find planning item with PlanningDuration is zero
Author: Kee KW
*/

--- Parameter to narrow down the search
DECLARE @C_Desc NVARCHAR(100) = '%TV6%'
DECLARE @C_ID INT = (SELECT ChannelID FROM msaChannel WHERE ChannelDescription LIKE @C_Desc)
DECLARE @Start_Date DATETIME = '2022-09-22 06:00:00.000'
DECLARE @End_Date DATETIME = '2022-09-23 05:59:59.000'

--- Find planning item with PlanningDuration is 0. Front-end will not able to see this entry
SELECT 
	*
FROM msaPlanning P
WHERE P.ChannelID = @C_ID
AND P.PlanningDate >= @Start_Date
AND P.PlanningEndDate < = @End_Date
AND P.PlanningDuration = 0000

--- Find PresentationSchedule entry as well.
SELECT
	*
FROM msaPresentation
WHERE PlanningID = 

--- Delete the record from msaPlanning
DELETE FROM msaPlanning
WHERE PlanningDuration = 0000
AND PlanningID = 419437
AND ChannelID = 8

/*
Title: Get the Planning Schedule
Written: Kee KW
Version: 1.0
*/

DECLARE @Channel_ID INT = (SELECT ChannelID FROM msaChannel WHERE ChannelDescription = 'Astro Ria HD')
DECLARE @Region_ID INT = (SELECT TOP 1 RegionID FROM msaRegion WHERE RegionDescription = 'Malaysia')
DECLARE @Start_DateTime DateTime = '2022-05-01 06:00:00.000'
DECLARE @End_DateTime DateTime = DateAdd(day, 1, @Start_DateTime)


SELECT
	PlanningID,
	PlanningTitle,
	PlanningTime,
	PlanningDuration,
	PlanningDate,
	PlanningEndDate
FROM msaPlanning
WHERE ChannelID = @Channel_ID
AND RegionID = @Region_ID
AND PlanningDate >= @Start_DateTime
AND PlanningEndDate < @End_DateTime
ORDER BY PlanningDate ASC
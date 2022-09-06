/*
Objective: To get information for Secondary Event
*/

--- Relate to Database
SELECT * FROM msaRefSpotType
SELECT * FROM msaAdvertiser
SELECT * FROM msaBrand

--- To list information for a specific record using the SE Title
DECLARE @SE_Title NVARCHAR(200) = 'KKW%'

SELECT 
	SE.SecondaryEventID, 
	SE.SecondaryEventTitle, 
	SE.AdvertiserID, 
	A.AdvertiserName, 
	SE.BrandID, 
	B.BrandName, 
	SE.SecondaryEventType, 
	SE.SpotTypeID, 
	R_SPT.SpotTypeDescription,
	R_SPT.SpotTypeSecondaryEvent
FROM msaSecondaryEvent SE
LEFT JOIN msaRefSpotType R_SPT ON R_SPT.SpotTypeID = SE.SpotTypeID
LEFT JOIN msaAdvertiser A ON A.AdvertiserID = SE.AdvertiserID
LEFT JOIN msaBrand B ON B.BrandID = SE.BrandID
WHERE SecondaryEventTitle LIKE @SE_Title

--- To list down all the secondary event with Adveriser and Brand
SELECT 
	SE.SecondaryEventID, 
	SE.SecondaryEventTitle, 
	SE.AdvertiserID, 
	A.AdvertiserName, 
	SE.BrandID, 
	B.BrandName, 
	SE.SecondaryEventType, 
	SE.SecondaryEventSEType, 
	SE.SpotTypeID, 
	R_SPT.SpotTypeDescription,
	R_SPT.SpotTypeSecondaryEvent
FROM msaSecondaryEvent SE
LEFT JOIN msaRefSpotType R_SPT ON R_SPT.SpotTypeID = SE.SpotTypeID
LEFT JOIN msaAdvertiser A ON A.AdvertiserID = SE.AdvertiserID
LEFT JOIN msaBrand B ON B.BrandID = SE.BrandID
WHERE SE.AdvertiserID IS NOT NULL AND SE.AdvertiserID NOT IN (0) AND SE.SpotTypeID IS NULL

--- 
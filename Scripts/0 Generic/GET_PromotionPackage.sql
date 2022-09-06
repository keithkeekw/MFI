/*
Objective: To retrieve all the information about Promotion Package
Author: Kee KW
*/

DECLARE @PP_ID INT = (SELECT PromotionPackageID FROM msaPromotionPackage WHERE PromotionPackageTitle LIKE 'KKW_PromotionPackage_Nabeh');
WITH CTE_PromotionPackage AS (
	SELECT 
		PP.PromotionPackageID, 
		PP.PromotionPackageTitle, 
		PP_O.PromotionPackageOrderID, 
		PP_OW.PromotionPackageOrderWeekID 
	FROM msaPromotionPackage PP
	LEFT JOIN msaPromotionPackageOrder PP_O ON PP_O.PromotionPackageID = PP.PromotionPackageID
	LEFT JOIN msaPromotionPackageOrderWeek PP_OW ON PP_OW.PromotionPackageOrderID = PP_O.PromotionPackageOrderID
)

--- Get all the IDs
SELECT * FROM CTE_PromotionPackage WHERE PromotionPackageID = @PP_ID

--- Find PromotionPackage Order Information
SELECT
	OW.PromotionPackageOrderID,
	OW.PromotionPackageOrderWeekID,
	OW.PromotionPackageOrderWeekStartDate AS 'Start Date',
	OW.PromotionPackageOrderWeekEndDate AS 'End Date',
	OW.PromotionPackageOrderWeekSpots,
	OW.PromotionPackageOrderBookedSpots,
	C.ChannelDescription,
	R.RegionDescription
FROM msaPromotionPackageOrderWeek OW
LEFT JOIN msaChannel C ON C.ChannelID = OW.PromotionPackageOrderChannelID
LEFT JOIN msaRegion R ON R.RegionID = OW.PromotionPackageOrderRegionID
WHERE PromotionPackageOrderWeekID IN (
	SELECT PromotionPackageOrderWeekID 
	FROM CTE_PromotionPackage 
	WHERE PromotionPackageID IN (@PP_ID)
)

--- Find Promotion Package Copies
SELECT
	PP_OP.PromotionPackageOrderID,
	PP_OP.PromotionPackageOrderPercentage,
	PP_OP.PromotionPackageOrderRatio,
	PP_OP.PromotionPackageOrderSequence,
	PP_OP.PromotionID,
	P.PromotionTitle
FROM msaPromotionPackageOrderCopy PP_OP
LEFT JOIN msaCommercial C ON C.CommercialID = PP_OP.CommercialID
LEFT JOIN msaPromotion P ON P.PromotionID = PP_OP.PromotionID
WHERE PromotionPackageOrderID IN (SELECT PromotionPackageOrderID FROM msaPromotionPackageOrder WHERE PromotionPackageID IN (@PP_ID))
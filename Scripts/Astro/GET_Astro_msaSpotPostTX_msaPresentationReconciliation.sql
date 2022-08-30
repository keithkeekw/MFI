/*
Astro Arena HD = 10000285
Astro Supersport HD  = 10000157
SELECT * FROM msaChannel WHERE ChannelDescription LIKE '%AEC%'
*/


DECLARE @CID INT = 10000194
DECLARE @TrafficDate DATETIME = '2022-08-22 00:00:00.000'

SELECT
	SpotPostTxID,
	SpotPostTXStatus,
	SpotPostTXPromotionID,
	SpotPostTXCommercialID,
	OrderID,
	ContractID,
	SpotPostTXDescription,
	SpotID,
	SpotPostTXMCRAdded
FROM msaSpotPostTX
WHERE TrafficPostTXID IN (
	SELECT TrafficPostTXID FROM msaTrafficPostTX
	WHERE ChannelID = @CID AND TrafficPostTXDate = @TrafficDate
) 

SELECT PromotionID,* FROM msaPresentationReconciliation
/*
Objective: To populate all the region to the channel
Author: Kee KW
Dev: Nic
*/

WITH CTE_ChannelRegionWPF AS (
	SELECT * FROM msaChannelRegionWPF
	WHERE UserID IS NULL
	-- AND ChannelID = 961  -- Remove the comment if want to apply to a single channel
	---AND RegionID = 1     -- Remove the comment if want to apply to a single channel
)

Insert INTO msaChannelRegionWPF (ChannelID,RegionID,ChannelRegionCarryCode,DefaultRegion,UserID,IsPrimary,ExcludeFromRunCountAmortisation)
SELECT B.ChannelID, A.RegionID, B.ChannelRegionCarryCode, DefaultRegion, UserID, IsPrimary, ExcludeFromRunCountAmortisation FROM msaRegion A
LEFT OUTER JOIN CTE_ChannelRegionWPF B ON 1=1
WHERE
NOT EXISTS (SELECT 1 FROM msaChannelRegionWPF WHERE RegionID = A.RegionID AND B.ChannelID = ChannelID AND UserID IS NULL)
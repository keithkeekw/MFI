---
Tags: SQL, script
Client: Astro
---

```sql
---To detect the duplicate spotposttxid for 'v' status only
DECLARE @Contract_ID INT = 78594
SELECT * FROM msaSpotPostTX WITH(NOLOCK) 
WHERE ContractID = @Contract_ID 
AND TrafficPostTXID NOT IN (SELECT TrafficPostTXID FROM msaTrafficPostTX WITH(NOLOCK)) AND SpotPostTXStatus = 'V'
 
--- To delete once spotposttxid is detected 
DELETE FROM msaSpotPostTX WHERE SpotPostTXID IN (SELECT SpotPostTXID FROM msaSpotPostTX WITH(NOLOCK) WHERE ContractID = @Contract_ID AND TrafficPostTXID 
NOT IN (SELECT TrafficPostTXID FROM msaTrafficPostTX WITH(NOLOCK)) AND SpotPostTXStatus = 'V')
```

```sql
DECLARE @CNO INT = 48553
DECLARE @CampaignNo INT = 18
DECLARE @CID INT

SELECT @CID = ContractID FROM msaContract WHERE ContractNo = @CNO AND ContractCampaignNo = @CampaignNo

SELECT 
	SPTX.SpotPostTXID,
	SPTX.SpotPostTXStatus,
	SPTX.SpotID,
	SPTX.ContractID,
	C.ContractNo,
	C.ContractCampaignNo,
	SPTX.OrderID,
	O.OrderLineNo
FROM msaSpotPostTX SPTX 
INNER JOIN msaContract C ON C.ContractID = SPTX.ContractID
INNER JOIN msaOrder O ON O.OrderID = SPTX.OrderID
WHERE SPTX.SpotID IN (
	SELECT SpotID FROM msaSpotPostTX
	GROUP BY SpotID
	HAVING COUNT(SpotID) > 1 AND SpotID NOT IN (0)
)
AND SPTX.ContractID = @CID
```
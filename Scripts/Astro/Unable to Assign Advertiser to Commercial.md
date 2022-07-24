---
Tags: SQL, script
Client: Astro
---

```sql
/*
Author: Kee KW
Date: 24 May 2022
Description: This script to pull out data on missing data for AdvertiserID in msaCommercialAdvertiser table
*/

/*1. Find the commercial in msaCommercialAdvertiser to see is there any duplicate records or data which is NULL*/
DECLARE @CCID NVARCHAR(20) = 'KBPLT'
SELECT CA.CommercialID, A.AdvertiserName FROM msaCommercialAdvertiser CA INNER JOIN msaAdvertiser A ON A.AdvertiserID = CA.AdvertiserID WHERE CA.CommercialID IN (SELECT CommercialID FROM msaCommercial WHERE CommercialClipID = @CCID)

/*2. Delete all the data from msaCommercialAdvertiser*/
---DELETE FROM msaCommercialAdvertiser WHERE CommercialID IN (SELECT CommercialID FROM msaCommercial WHERE CommercialClipID = @CCID)

/*3. Proceed to select the advertiser again in ForeTV*/

/*Note: 
Script below is to check if any such records

SELECT CommercialID as 'Count' FROM msaCommercialAdvertiser
GROUP BY CommercialID
HAVING Count(AdvertiserID) > 1

*/
```
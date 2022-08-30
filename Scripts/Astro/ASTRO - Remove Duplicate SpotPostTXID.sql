---To detect the duplicate spotposttxid for 'v' status only
declare @Contract_ID int = 78594
select * from msaSpotPostTX with(nolock) 
where ContractID = @Contract_ID 
and TrafficPostTXID not in (select TrafficPostTXID from msaTrafficPostTX with(nolock)) and spotposttxstatus = 'V'
 
--- To delete once spotposttxid is detected 
delete from msaSpotPostTX where spotposttxid in (select * from msaSpotPostTX with(nolock) where ContractID = @Contract_ID and TrafficPostTXID 
not in (select TrafficPostTXID from msaTrafficPostTX with(nolock)) and spotposttxstatus = 'V ')
/*
This is a restore DB scripts in MSA Environment
*/


--- RTM Live
RESTORE DATABASE [rtm_live]

FROM DISK = N'g:\DBBackup\RTM\RTM_LIVE_04MAR2020.bak' WITH FILE = 1,
MOVE N'ForeTV_DB' TO N'd:\database\70\rtm_live\ForeTV_data.mdf',
MOVE N'ForeTV_Admin' TO N'd:\database\70\rtm_live\ForeTV_Admin.ndf',
MOVE N'ForeTV_Reports' TO N'd:\database\70\rtm_live\ForeTV_Reports.ndf',
MOVE N'ForeTV_Audience' TO N'd:\database\70\rtm_live\ForeTV_Audience.ndf',
MOVE N'ForeTV_Libraries' TO N'd:\database\70\rtm_live\ForeTV_Libraries.ndf',
MOVE N'ForeTV_Media' TO N'd:\database\70\rtm_live\ForeTV_Media.ndf',
MOVE N'ForeTV_Other' TO N'd:\database\70\rtm_live\ForeTV_Other.ndf',
MOVE N'ForeTV_Presentation' TO N'd:\database\70\rtm_live\ForeTV_Presentation.ndf',
MOVE N'ForeTV_Programmes' TO N'd:\database\70\rtm_live\ForeTV_Programmes.ndf',
MOVE N'ForeTV_Sales' TO N'd:\database\70\rtm_live\ForeTV_Sales.ndf',
MOVE N'ForeTV_Scheduling' TO N'd:\database\70\rtm_live\ForeTV_Scheduling.ndf',
MOVE N'ForeTV_Traffic' TO N'd:\database\70\rtm_live\ForeTV_Traffic.ndf',
MOVE N'ForeTV_Workflow' TO N'd:\database\70\rtm_live\ForeTV_Workflow.ndf',
MOVE N'ForeTV_DataIndex_IDX' TO N'd:\database\70\rtm_live\ForeTV_DataIndex_IDX.ndf',
MOVE N'ForeTV_Log' TO N'd:\database\70\rtm_live\ForeTV_log.ldf',
KEEP_REPLICATION, NOUNLOAD, REPLACE, STATS = 10
GO

USE [rtm_live]
GO
delete from msaRefLicenseServer

USE [rtm_live]
GO
delete from msalock
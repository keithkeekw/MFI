/*
This is a restore DB scripts in MSA Environment
*/


--- StarHub Live
RESTORE DATABASE [StarHub_Live]

FROM DISK = N'G:\Database_backup\GlobeCast\StarHub_Live_backup_05Jul2022.bak' WITH FILE = 1,
MOVE N'ForeTV_DB' TO N'F:\Database\65\StarHub_Live\ForeTV_data.mdf',
MOVE N'ForeTV_Admin' TO N'F:\Database\65\StarHub_Live\ForeTV_Admin.ndf',
MOVE N'ForeTV_Reports' TO N'F:\Database\65\StarHub_Live\ForeTV_Reports.ndf',
MOVE N'ForeTV_Audience' TO N'F:\Database\65\StarHub_Live\ForeTV_Audience.ndf',
MOVE N'ForeTV_Libraries' TO N'F:\Database\65\StarHub_Live\ForeTV_Libraries.ndf',
MOVE N'ForeTV_Media' TO N'F:\Database\65\StarHub_Live\ForeTV_Media.ndf',
MOVE N'ForeTV_Other' TO N'F:\Database\65\StarHub_Live\ForeTV_Other.ndf',
MOVE N'ForeTV_Presentation' TO N'F:\Database\65\StarHub_Live\ForeTV_Presentation.ndf',
MOVE N'ForeTV_Programmes' TO N'F:\Database\65\StarHub_Live\ForeTV_Programmes.ndf',
MOVE N'ForeTV_Sales' TO N'F:\Database\65\StarHub_Live\ForeTV_Sales.ndf',
MOVE N'ForeTV_Scheduling' TO N'F:\Database\65\StarHub_Live\ForeTV_Scheduling.ndf',
MOVE N'ForeTV_Traffic' TO N'F:\Database\65\StarHub_Live\ForeTV_Traffic.ndf',
MOVE N'ForeTV_Workflow' TO N'F:\Database\65\StarHub_Live\ForeTV_Workflow.ndf',
MOVE N'ForeTV_DataIndex_IDX' TO N'F:\Database\65\StarHub_Live\ForeTV_DataIndex_IDX.ndf',
MOVE N'ForeTV_Log' TO N'F:\Database\65\StarHub_Live\ForeTV_log.ldf',
KEEP_REPLICATION, NOUNLOAD, REPLACE, STATS = 10
GO
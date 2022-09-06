/*
This is a restore DB scripts in MSA Environment
*/


--- SingTel Live
RESTORE DATABASE [singtel_live]

FROM DISK = N'F:\DB Backup\ForeTV_Live_backup_2022_06_19_220001_2197947.bak' WITH FILE = 1,
MOVE N'ForeTV_DB' TO N'd:\db\65\singtel_live\ForeTV_data.mdf',
MOVE N'ForeTV_Admin' TO N'd:\db\65\singtel_live\ForeTV_Admin.ndf',
MOVE N'ForeTV_Reports' TO N'd:\db\65\singtel_live\ForeTV_Reports.ndf',
MOVE N'ForeTV_Audience' TO N'd:\db\65\singtel_live\ForeTV_Audience.ndf',
MOVE N'ForeTV_Libraries' TO N'd:\db\65\singtel_live\ForeTV_Libraries.ndf',
MOVE N'ForeTV_Media' TO N'd:\db\65\singtel_live\ForeTV_Media.ndf',
MOVE N'ForeTV_Other' TO N'd:\db\65\singtel_live\ForeTV_Other.ndf',
MOVE N'ForeTV_Presentation' TO N'd:\db\65\singtel_live\ForeTV_Presentation.ndf',
MOVE N'ForeTV_Programmes' TO N'd:\db\65\singtel_live\ForeTV_Programmes.ndf',
MOVE N'ForeTV_Sales' TO N'd:\db\65\singtel_live\ForeTV_Sales.ndf',
MOVE N'ForeTV_Scheduling' TO N'd:\db\65\singtel_live\ForeTV_Scheduling.ndf',
MOVE N'ForeTV_Traffic' TO N'd:\db\65\singtel_live\ForeTV_Traffic.ndf',
MOVE N'ForeTV_Workflow' TO N'd:\db\65\singtel_live\ForeTV_Workflow.ndf',
MOVE N'ForeTV_DataIndex_IDX' TO N'd:\db\65\singtel_live\ForeTV_DataIndex_IDX.ndf',
MOVE N'ForeTV_Log' TO N'd:\db\65\singtel_live\ForeTV_log.ldf',
KEEP_REPLICATION, NOUNLOAD, REPLACE, STATS = 10
GO
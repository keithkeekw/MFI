declare @MissingEpi as table
(
ProgrammeID int,
EpisodeID int
)

declare @programmeid int,
@episodeid int,
@ClipID nvarchar(max)
,@progVerID int
,@progammeVersionID int
,@progMasterID int
,@episodeVersionID int
,@MasterVerEpisodeID int
,@EpisodeVerLinkID as int

insert into @MissingEpi
select a.ProgrammeID, EpisodeID from msaEpisode a with(nolock) inner join msaprogramme b with(nolock) on a.ProgrammeID = b.ProgrammeID inner join msaProgrammeVerParam d with(nolock) on d.ProgrammeID = b.ProgrammeID where EpisodeID not in (select EpisodeID from msaEpisodeVerParam with(nolock))
and  ProgrammeTitle like 'FIH Pro League Season 3%'

-- insert version param details-----
insert into msaEpisodeVerParam
select b.EpisodeID,ProgrammeVerParamTitle
,ProgrammeVerParamSubtitle
,ProgrammeVerParamDolby
,ProgrammeVerParamStereo
,ProgrammeVerParamHiDef
,ProgrammeVerParamStandardDef
,ProgrammeVerParamCut
,ProgrammeVerParamUnCut
,ProgrammeVerParamWideScreen
,ProgrammeVerParamDefaultVer
,ProgrammeVerParamVerTempID
,ProductionSiteID
,'N'
,ProgrammeVerParamNonLinear
,ProgrammeVerParamRedeemable
,ProgrammeVerParamEpg
,ProgrammeVerParamMediaType
,ProgrammeVerParamSupplierID
,ProgrammeVerParamProviderID
,ProgrammeVerParamProviderName
,ProgrammeVerParamSVOD
,MediaHDSDFormatID
,AspectRatioID
,AudioPropertyID
,ProgrammeVerParamApplyCatchUpRules
,ProgrammeVerParamApplyCatchUpRulesAllDeployments
,ProviderID
from msaProgrammeVerParam a with(nolock)
inner join @MissingEpi b on a.ProgrammeID = b.ProgrammeID

insert into msaEpisodeVerParamChan
select b.EpisodeID, a.ChannelID from msaProgrammeVerParamChan a with(nolock) inner join @MissingEpi b on a.ProgrammeID = b.ProgrammeID

insert into msaEpisodeVerParamReg
select b.EpisodeID, a.RegionID from msaProgrammeVerParamReg a with(nolock) inner join @MissingEpi b on a.ProgrammeID = b.ProgrammeID

While (select count(1) from @MissingEpi) >0
BEGIN
select top 1 @programmeid = programmeid , @episodeid = episodeid from @MissingEpi

--- insert link to master episode if missing ----
if (select count(1) from msaEpisodeVerLink where VerEpisodeID = @episodeid) = 0
BEGIN
	insert into msaEpisodeVerLink (MasterVerEpisodeID, VerEpisodeID)
	select EpisodeID, @episodeid from msaEpisode with(nolock) where ProgrammeID in (select MasterVerProgrammeID from msaProgrammeVerLink with(nolock) where VerProgrammeID = @programmeid)
	and EpisodeNumber in (select EpisodeNumber from msaEpisode with(nolock) where EpisodeID = @episodeid)

END
-----

---- insert episodeversion if missing -----------
if (select count(1) from msaEpisodeVersion where episodeid in (select masterverepisodeid from msaEpisodeVerLink where VerEpisodeID = @episodeid) ) = 1
BEGIN
	select @progVerID = ProgrammeID  from msaEpisode where EpisodeID = @episodeid

	select @progammeVersionID = ProgrammeVersionID , @progMasterID = MasterVerProgrammeID  from msaProgrammeVerLink where VerProgrammeID = @progVerID

	select @MasterVerEpisodeID = MasterVerEpisodeID, @EpisodeVerLinkID = EpisodeVerLinkID from msaEpisodeVerLink where VerEpisodeID = @episodeid

	insert into msaEpisodeVersion (ProgrammeVersionID,EpisodeID,ProgrammeID,EpisodeNumber,EpisodeTitle,
	EpisodeDuration,EpisodeComments,EpisodeCertificate,EpisodeProductionNo,EpisodeContent,EpisodeStatus,EpisodeCensor,EpisodeMiniSynopsis,
	EpisodeMarkedForErase,EpisodeAltTitle,EpisodeJobNo,EpisodeSlotDuration,EpisodeNoOfSegment,EpisodeProjectNo,EpisodeHouseNo,EpisodeBudgetCode,
	EpisodeScheduleRemark,EpisodeMasterVersion,EpisodeClipID,EpisodeSeriesLinkID,EpisodeStandby,ProductionSiteID,EpisodeBXFTransfer,EpisodeBXFUpdate,
	EpisodeSource,EpisodeExtID,EpisodeMAMID,EpisodeMAMURL,AuditUserId,AuditLastModifiedDate,EpisodeCatchupAvailable,EpisodeCatchupOffsetFromTX,
	EpisodeCatchupAvailabilityPeriod,EpisodeCatchupNewDays,EpisodeCatchupLastChanceDays,IsTrashed,TrashedDate,TrashedBy,IsTrashedHidden,EpisodeInBlackAndWhite,
	EpisodeExportedUnlink,EpisodeYearOfRelease,EpisodeCatchupSpecific,EpisodeExtRefID,EpisodeExtNo,EpisodePremierStartDate,EpisodePremierEndDate,
	EpisodePremierStartTime,EpisodePremierEndTime,EpisodeTimezone,EpisodeVerLinkID)
	(select @progammeVersionID,@MasterVerEpisodeID,@progMasterID,EpisodeNumber,EpisodeTitle,
	EpisodeDuration,EpisodeComments,EpisodeCertificate,EpisodeProductionNo,EpisodeContent,EpisodeStatus,EpisodeCensor,EpisodeMiniSynopsis,
	EpisodeMarkedForErase,EpisodeAltTitle,EpisodeJobNo,EpisodeSlotDuration,EpisodeNoOfSegment,EpisodeProjectNo,EpisodeHouseNo,EpisodeBudgetCode,
	EpisodeScheduleRemark,EpisodeMasterVersion,EpisodeClipID,EpisodeSeriesLinkID,EpisodeStandby,ProductionSiteID,EpisodeBXFTransfer,EpisodeBXFUpdate,
	EpisodeSource,EpisodeExtID,EpisodeMAMID,EpisodeMAMURL,AuditUserId,AuditLastModifiedDate,EpisodeCatchupAvailable,EpisodeCatchupOffsetFromTX,
	EpisodeCatchupAvailabilityPeriod,EpisodeCatchupNewDays,EpisodeCatchupLastChanceDays,IsTrashed,TrashedDate,TrashedBy,IsTrashedHidden,EpisodeInBlackAndWhite,
	EpisodeExportedUnlink,EpisodeYearOfRelease,EpisodeCatchupSpecific,EpisodeExtRefID,EpisodeExtNo,EpisodePremierStartDate,EpisodePremierEndDate,
	EpisodePremierStartTime,EpisodePremierEndTime,EpisodeTimezone,@EpisodeVerLinkID from msaEpisode where EpisodeID = @episodeid)

	SELECT @episodeVersionID = EpisodeVersionID from msaEpisodeVersion where EpisodeID = @MasterVerEpisodeID

	update msaEpisodeVerLink set episodeVersionID  =  @episodeVersionID
	where MasterVerEpisodeID = @MasterVerEpisodeID and VerEpisodeID =  @episodeid
END

---------------------

-- update episode clip --------
select @ClipID = EpisodeClipID from msaEpisode a with(nolock) inner join msaEpisodeVerLink b with(nolock) on a.EpisodeID = b.MasterVerEpisodeID
where VerEpisodeID = @episodeid

update msaepisode set EpisodeClipID = @ClipID where EpisodeID = @episodeid and isnull(EpisodeClipID,'') <> @ClipID
----------------

delete from @MissingEpi where ProgrammeID = @programmeid and EpisodeID = @episodeid

END
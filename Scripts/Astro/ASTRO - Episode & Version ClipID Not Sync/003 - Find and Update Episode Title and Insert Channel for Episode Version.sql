-------------select episode version that has different title from master --------------
select a.EpisodeID, a.EpisodeTitle, c.EpisodeTitle as MasterEpisodeTitle from msaepisode a with(nolock)
inner join msaEpisodeVerLink b with(nolock) on a.EpisodeID = b.VerEpisodeID
inner join msaepisode c with(nolock) on c.EpisodeID = b.MasterVerEpisodeID
inner join msaprogramme d with(nolock) on a.ProgrammeID = d.ProgrammeID
where a.EpisodeTitle <> c.EpisodeTitle
and d.ProgrammeTitle like 'fih pro%'

-------------select episode version that has missing channel ---------------
select a.EpisodeID,b.* from msaepisode a with(nolock)
inner join msaProgrammeVerParamChan b with(nolock) on a.ProgrammeID = b.ProgrammeID
inner join msaprogramme d with(nolock) on a.ProgrammeID = d.ProgrammeID
where d.ProgrammeTitle like 'fih pro%'
and not exists(select 1 from msaEpisodeVerParamChan where EpisodeID = a.EpisodeID)

---------update title-------------
update a
set a.EpisodeTitle = c.EpisodeTitle
from msaepisode a with(nolock)
inner join msaEpisodeVerLink b with(nolock) on a.EpisodeID = b.VerEpisodeID
inner join msaepisode c with(nolock) on c.EpisodeID = b.MasterVerEpisodeID
inner join msaprogramme d with(nolock) on a.ProgrammeID = d.ProgrammeID
where a.EpisodeTitle <> c.EpisodeTitle
and d.ProgrammeTitle like 'fih pro%'

----------insert episode version channel --------
insert into msaEpisodeVerParamChan
select a.EpisodeID,b.ChannelID from msaepisode a with(nolock)
inner join msaProgrammeVerParamChan b with(nolock) on a.ProgrammeID = b.ProgrammeID
inner join msaprogramme d with(nolock) on a.ProgrammeID = d.ProgrammeID
where d.ProgrammeTitle like 'fih pro%'
and not exists(select 1 from msaEpisodeVerParamChan where EpisodeID = a.EpisodeID)
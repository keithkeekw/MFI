select c.ProgrammeID,c.ProgrammeTitle, d.ProgrammeVerParamTitle, b.EpisodeID,b.EpisodeTitle, b.EpisodeNumber, b.EpisodeExtNo 
from  msaepisode b with(nolock)
inner join msaprogramme c with(nolock) on c.ProgrammeID = b.ProgrammeID
inner join msaProgrammeVerParam d with(nolock) on d.ProgrammeID = c.ProgrammeID
where b.EpisodeID not in (select EpisodeID from msaEpisodeVerParam with(nolock))
and  ProgrammeTitle like 'Kollywood Court%'
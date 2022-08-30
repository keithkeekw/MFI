/*
Objective: To get details about SVOD Import
Client: SingTel
Written BY: Kee KW
Version: 1.0
*/

DECLARE @ProgTitle nvarchar(100) = 'Ridiculousness'
DECLARE @ProgSeriesNo INT = 11

--- Get Programme Details and Count the Total Episode Number
SELECT E.ProgrammeID, P.ProgrammeTitle, P.ProgrammeSeriesNo, PVP.ProgrammeVerParamTitle, Count(E.ProgrammeID) AS 'Total Episodes'
FROM msaEpisode E
INNER JOIN msaProgramme P ON P.ProgrammeID = E.ProgrammeID
LEFT JOIN msaProgrammeVerParam PVP ON PVP.ProgrammeID = E.ProgrammeID
WHERE E.ProgrammeID IN (SELECT ProgrammeID  FROM msaProgramme P WHERE P.ProgrammeTitle = @ProgTitle AND P.ProgrammeSeriesNo = @ProgSeriesNo)
GROUP BY E.ProgrammeID,PVP.ProgrammeVerParamTitle,P.ProgrammeTitle, P.ProgrammeSeriesNo
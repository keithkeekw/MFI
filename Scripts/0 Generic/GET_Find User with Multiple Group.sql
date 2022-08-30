/* Description: This is script is to find out user with multiple Group
Author: Kee, Ee Hang and Yi Fan
Date: 11 May 2022
*/

SELECT UG.UserID, U.UserDisplayName, UG.GroupID, G.GroupName
FROM msaUserGroup UG
INNER JOIN msaUser U ON U.UserID = UG.UserID
INNER JOIN msaGroup G ON UG.GroupID = G.GroupID
WHERE
UG.UserID IN (
	Select UserID
	FROM msaUserGroup
	GROUP BY UserID
	HAVING Count(GroupID) > 1
)
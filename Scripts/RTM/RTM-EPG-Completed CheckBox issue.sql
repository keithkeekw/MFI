---Find the ID for EPGCompleted Menu
select * from msaMenu where MenuName LIKE '%Completed%'  --- MenuID = 701

--Find GroupID
select * from msaGroup where GroupName = 'RTM PLANNER/SCHEDULER/EPG/REPORT' --- GroupID = 1103

---Check whether is there any record in this table.
select * from msaGroupMenu --- If there's no record hence unable to flag the checkbox.


--- Below is the script to populate the GroupMenu table. Once it is done, user in the group able to flag the checkbox.
declare @groupid int, @menuid int, @groupmenulookuponly bit
set @groupid = 1103 
set @menuid = 701
set @groupmenulookuponly = 0

if exists (select * from msaGroupMenu where GroupID = @groupid and MenuID = @menuid)
begin
	delete from msaGroupMenu where GroupID = @groupid and MenuID = @menuid 
end

insert into msaGroupMenu (GroupID, MenuID, GroupMenuLookupOnly)
select @groupid, @menuid, @groupmenulookuponly

if exists (select * from msaMenuAccessGroup where GroupID = @groupid and MenuID = @menuid)
begin
	delete from msaMenuAccessGroup where GroupID = @groupid and MenuID = @menuid
end

insert into msaMenuAccessGroup (MenuAccessID, MenuAccessCommonID, MenuID, GroupID, GroupMenuLookupOnly)
select MenuAccessID, MenuAccessCommonID, MenuID, @groupid, @groupmenulookuponly from msaMenuAccess where MenuID = @menuid
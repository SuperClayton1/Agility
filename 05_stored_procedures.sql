-- Clayton Bartlett
-- 03/08/2026
-- Stored procedures for 2220442DB
USE AgilityDB
GO

--  SP: Show Projects by Owners with 'Basic' Permission Set

CREATE PROCEDURE sp_GetProjectsWithBasicOwners
AS
SELECT p.ProjectID, p.ProjectName, u.UserID AS BasicOwnerID, u.PermissionSet
FROM dbo.Projects p
JOIN dbo.Users u
    ON p.ProjectOwnerID = u.UserID
WHERE u.PermissionSet = 'Basic';
GO

-- SP: Show all tasks currently in Review status

CREATE PROCEDURE sp_TasksInReview
AS
SELECT t.TaskID, AssigneeID
From dbo.Tasks t
JOIN dbo.TaskStatus ts 
    ON t.StatusID = ts.StatusID
WHERE ts.StatusName = 'Review'
GO
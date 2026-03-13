-- Clayton Bartlett
-- 03/07/2026
-- Creates views for 2220442DB

USE AgilityDB
GO

-- View shows Tasks by Status
CREATE VIEW vw_TaskStatus
AS
SELECT t.TaskID, ts.StatusName
FROM dbo.Tasks t
JOIN dbo.TaskStatus ts 
    ON t.StatusID = ts.StatusID;
GO

-- View shows Tasks and related Sprints
CREATE VIEW vw_TaskSprints
AS
SELECT t.TaskID, s.SprintID
FROM dbo.Tasks t 
JOIN dbo.Sprints s 
    ON t.SprintID = s.SprintID;
GO

CREATE VIEW vw_ProjectOwnerPermissions
AS
SELECT p.ProjectID, p.ProjectName, u.PermissionSet
FROM dbo.Projects p
JOIN dbo.Users u 
    ON p.ProjectOwnerID = u.UserID;
GO

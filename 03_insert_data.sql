-- Clayton Bartlett
-- 03/08/2026
-- Inserts data into 2220442DB

USE AgilityDB
GO

INSERT INTO dbo.Users (PermissionSet, CreatedDate)
VALUES
    ('Admin', GETDATE()),
    ('Admin', GETDATE()),
    ('Admin', GETDATE()),
    ('Admin', GETDATE()),
    ('Standard', GETDATE()),
    ('Standard', GETDATE()),
    ('Standard', GETDATE()),
    ('Standard', GETDATE()),
    ('Basic', GETDATE()),
    ('Basic', GETDATE()),
    ('Basic', GETDATE()),
    ('Basic', GETDATE());

INSERT INTO dbo.Projects (ProjectOwnerID, ProjectName)
VALUES
    (1, 'New Feature'),
    (2, 'New Feature'),
    (3, 'New Feature'),
    (4, 'New Feature'),
    (5, 'Refactor'),
    (6, 'Refactor'),
    (7, 'Refactor'),
    (8, 'Refactor'),
    (9, 'Research'),
    (10, 'Research'),
    (11, 'Research'),
    (12, 'Research');

INSERT INTO dbo.Sprints (ProjectID, StartDate, EndDate)
VALUES
    (1, GETDATE(),DATEADD(DAY, 14, GETDATE())),
    (2, GETDATE(),DATEADD(DAY, 14, GETDATE())),
    (3, GETDATE(),DATEADD(DAY, 14, GETDATE())),
    (4, GETDATE(),DATEADD(DAY, 14, GETDATE())),
    (5, GETDATE(),DATEADD(DAY, 21, GETDATE())),
    (6, GETDATE(),DATEADD(DAY, 21, GETDATE())),
    (7, GETDATE(),DATEADD(DAY, 21, GETDATE())),
    (8, GETDATE(),DATEADD(DAY, 21, GETDATE())),
    (9, GETDATE(),DATEADD(DAY, 7, GETDATE())),
    (10, GETDATE(),DATEADD(DAY, 7, GETDATE())),
    (11, GETDATE(),DATEADD(DAY, 7, GETDATE())),
    (12, GETDATE(),DATEADD(DAY, 7, GETDATE()));

INSERT INTO TaskStatus (StatusName)
VALUES
    ('To do'),
    ('In Progress'),
    ('Review'),
    ('Done');

INSERT INTO dbo.Tasks (SprintID, StatusID, AssigneeID)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (2, 1, 3),
    (2, 3, 4),
    (3, 2, 5),
    (3, 4, 6),
    (4, 1, 7),
    (4, 2, 8),
    (5, 3, 9),
    (5, 4, 10),
    (6, 1, 11),
    (6, 2, 12),
    (7, 3, 1),
    (8, 4, 2),
    (9, 1, 3),
    (9, 2, 4),
    (10, 3, 5),
    (10, 4, 6),
    (11, 1, 7),
    (12, 2, 8);
    

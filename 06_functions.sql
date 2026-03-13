-- Clayton Bartlett
-- 03/08/2026
-- Creates functions for 2220442DB

USE AgilityDB
GO

-- Function: Count tasks by Sprint

CREATE FUNCTION  fn_TaskCountBySprint (@SprintID INT)
RETURNS INT
AS
BEGIN
    DECLARE @SprintTaskCount INT;

    SELECT @SprintTaskCount = COUNT(*)
    FROM dbo.Tasks
    WHERE SprintID = @SprintID

    RETURN @SprintTaskCount;
END
GO

-- How to use fn_TaskCountBySprint
SELECT dbo.fn_TaskCountBySprint(1) AS SprintTaskCount;
GO
-- Function: Count tasks by User

CREATE FUNCTION fn_TaskCountByUser (@UserID INT)
RETURNS INT
AS
BEGIN
    DECLARE @UserTaskCount INT;

    SELECT @UserTaskCount = COUNT(*)
    FROM dbo.Tasks
    WHERE AssigneeID = @UserID

    RETURN @UserTaskCount;
END
GO

-- How to use fn_TaskCountByUser
SELECT dbo.fn_TaskCountByUser(1) AS UserTaskCount;



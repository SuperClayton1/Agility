-- Clayton Bartlett
-- 03/08/2026
-- Create trigger for 2220442DB

USE AgilityDB
GO

-- Trigger: Blocks skipping 'Review' Status when updating a Task

CREATE TRIGGER trg_StatusGuardrail
ON dbo.Tasks
AFTER UPDATE
AS 
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i 
        JOIN deleted d ON i.TaskID = d.TaskID
        WHERE d.StatusID IN (1,2)
        AND i.StatusID = 4
    )
    BEGIN
        RAISERROR('Tasks cannot move directly to "Done" Status without being reviewed.',16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO

-- Trigger test THIS WILL THROW AN ERROR

UPDATE Tasks
SET  StatusID = 4
WHERE StatusID IN (1,2)
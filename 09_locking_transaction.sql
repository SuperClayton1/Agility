-- Clayton Bartlett
-- 03/08/2026
-- Locking and transactions for 2220442DB

USE AgilityDB
GO

-- Locking and Transactions: Update a Status

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE dbo.Tasks
    SET StatusID = 2
    WHERE TaskID = 1;

    WAITFOR DELAY '00:00:10';

    COMMIT TRANSACTION;

    PRINT 'Status Updated Successfully';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Unable to update status';
END CATCH;
GO

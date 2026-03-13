-- Clayton Bartlett
-- 03/08/2026 
-- Create login for 2220442DB

USE master
GO

CREATE LOGIN TaskAssignee
WITH PASSWORD = 'PasswordPlaceholder123';
GO

USE AgilityDB
GO

CREATE USER TaskAssignee FOR LOGIN TaskAssignee;
GO

GRANT SELECT, INSERT, UPDATE ON dbo.Tasks TO TaskAssignee;
GO
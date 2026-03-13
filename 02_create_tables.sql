-- Clayton Bartlett
-- 03/07/2026
-- Creates tables and indexes for 2220442DB

USE AgilityDB
GO

CREATE TABLE [dbo].[Users] (
    [UserID] INT IDENTITY(1,1) NOT NULL,
    [PermissionSet] VARCHAR(50) NULL,
    [CreatedDate] DATETIME2 NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserID] ASC)
    );
    GO

CREATE TABLE [dbo].[Projects] (
    [ProjectID] INT IDENTITY(1,1) NOT NULL,
    [ProjectOwnerID] INT NOT NULL,
    [ProjectName] VARCHAR(50) NULL,
    [DueDate] DATETIME2 NULL,
    CONSTRAINT [FK_Projects_Users] FOREIGN KEY ([ProjectOwnerID]) REFERENCES [dbo].[Users]([UserID]),
    CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED ([ProjectID] ASC)
    );
    GO

CREATE TABLE [dbo].[Sprints] (
    [SprintID] INT IDENTITY(1,1) NOT NULL,
    [ProjectID] INT NOT NULL,
    [StartDate] DATETIME2 NOT NULL,
    [EndDate] DATETIME2 NULL,
    CONSTRAINT [FK_Sprints_Projects] FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[Projects]([ProjectID]),
    CONSTRAINT [PK_Sprints] PRIMARY KEY CLUSTERED ([SprintID] ASC)
    );
    GO

CREATE TABLE [dbo].[TaskStatus] (
    [StatusID] INT IDENTITY(1,1) NOT NULL,
    [StatusName] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_TaskStatus] PRIMARY KEY CLUSTERED ([StatusID] ASC)
    );
    GO

CREATE TABLE [dbo].[Tasks] (
    [TaskID] INT IDENTITY(1,1) NOT NULL,
    [SprintID] INT NOT NULL,
    [StatusID] INT NOT NULL,
    [AssigneeID] INT NULL,
    CONSTRAINT [FK_Tasks_Sprints] FOREIGN KEY ([SprintID]) REFERENCES [dbo].[Sprints]([SprintID]),
    CONSTRAINT [FK_Tasks_Status] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[TaskStatus]([StatusID]),
    CONSTRAINT [FK_Tasks_Users] FOREIGN KEY ([AssigneeID]) REFERENCES [dbo].[Users]([UserID]),
    CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED ([TaskID] ASC)
    );
    GO

CREATE INDEX I_Projects_ProjectOwnerID
    ON dbo.Projects(ProjectOwnerID);
    GO

CREATE INDEX I_Sprints_ProjectID
    ON dbo.Sprints(ProjectID);
    GO

CREATE INDEX I_Tasks_SprintID
    ON dbo.Tasks(SprintID);
    GO

CREATE INDEX I_Tasks_StatusID
    ON dbo.Tasks(StatusID);
    GO

CREATE INDEX I_Tasks_AssigneeID
    ON dbo.Tasks(AssigneeID);
    GO



-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-18
-- Description: CLUSTERED INDEX
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- F12
-- SELECT * FROM AdventureWorks2019.HumanResources.Department

DROP TABLE IF EXISTS [HumanResources].[Department_WithIndexes]

CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
)

-- CLUSTERED INDEX on single field
-- CREATE CLUSTERED INDEX cix_Department_WithIndexes_DepartmentID
--     ON [HumanResources].[Department_WithIndexes] (DepartmentID)
-- 

-- CLUSTERED INDEX on two fields
-- CREATE CLUSTERED INDEX cix_Department_WithIndexes_DepartmentID_Name
--     ON [HumanResources].[Department_WithIndexes] (DepartmentID, [Name])

CREATE CLUSTERED INDEX cix_Department_WithIndexes_Name
    ON [HumanResources].[Department_WithIndexes] ([Name])



INSERT INTO [HumanResources].[Department_WithIndexes] (
	[Name],
	[GroupName],
	[ModifiedDate])
    SELECT
        [Name],
        [GroupName],
        [ModifiedDate] FROM HumanResources.Department


-- Shows how the first SELECT Statement is ordered by Name (just how we created it to be)
SELECT * FROM [HumanResources].[Department_WithIndexes]
SELECT * FROM [HumanResources].[Department]
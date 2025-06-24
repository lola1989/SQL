-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-24
-- Description: NONCLUSTERED INDEX (ix or IX)
-- is used to speed up data retrieval operations
-- a non-clustered index is a separate structure that 
-- points to the actual data rows
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- SELECT * FROM AdventureWorks2019.HumanResources.Department

DROP TABLE IF EXISTS [HumanResources].[Department_WithIndexes]

CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
)

-- CLUSTERED INDEX on two fields
CREATE CLUSTERED INDEX cix_Department_WithIndexes_GroupName_DepartmentID
    ON [HumanResources].[Department_WithIndexes] (GroupName, DepartmentID)

-- NONCLUSTERED INDEX on with INCLUDE
CREATE NONCLUSTERED INDEX ix_Department_WithIndexes_Name
    ON [HumanResources].[Department_WithIndexes] ([Name]) INCLUDE (ModifiedDate)

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
-- SELECT * FROM [HumanResources].[Department]
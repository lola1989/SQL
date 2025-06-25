-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-25
-- Description: UNIQUE
-- The constraint ensures all values in a column are UNIQUE
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- SELECT * FROM AdventureWorks2019.HumanResources.Department

DROP TABLE IF EXISTS [HumanResources].[Department_WithIndexes]

-- Adding a UNIQUE CONSTRAINT on the Table with GroupName & Name
CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
    -- CONSTRAINT uq_GroupName_Name UNIQUE ([Name], [GroupName])
)

/* 
-- Using ALTER TABLE to ADD CONSTRAINT
ALTER TABLE HumanResources.Department_WithIndexes 
    ADD CONSTRAINT uq_GroupName_Name UNIQUE ([Name], [GroupName])

-- CLUSTERED INDEX on two fields
CREATE CLUSTERED INDEX cix_Department_WithIndexes_GroupName_DepartmentID
    ON [HumanResources].[Department_WithIndexes] (GroupName, DepartmentID)
*/

-- /* 
-- Creating a Key using the ALTER TABLE & CLUSTERED INDEX with GroupName & DepartmentID
ALTER TABLE HumanResources.Department_WithIndexes 
    ADD CONSTRAINT uq_GroupName_DepartmentID UNIQUE ([DepartmentID], [GroupName])

CREATE CLUSTERED INDEX cix_Department_WithIndexes_GroupName_DepartmentID
    ON [HumanResources].[Department_WithIndexes] (GroupName, DepartmentID)
-- */

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

-- SELECT statement WITH INDEX - just an example, not recommended 
SELECT * FROM [HumanResources].[Department_WithIndexes]
    -- WITH(INDEX(cix_Department_WithIndexes_GroupName_DepartmentID))

-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: COMPOSIT KEY - a PRIMARY KEY with multiple fields
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO


DROP TABLE IF EXISTS [HumanResources].[Department_WithIndexes]

-- /*
-- Add a COMPOSIT KEY as a CONSTRAINT on the Table on DepartmentID & GroupName
CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
    CONSTRAINT pk_DepartmentID_GroupName PRIMARY KEY (DepartmentID, GroupName)
)
-- */

/*
-- More common way way to:
-- ADD a COMPOSIT KEY as a CONSTRAINT via ALTER TABLE on DepartmentID & GroupName
CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
)

ALTER TABLE [HumanResources].[Department_WithIndexes]
    ADD CONSTRAINT pk_DepartmentID_GroupName PRIMARY KEY (DepartmentID, GroupName)
-- */

INSERT INTO [HumanResources].[Department_WithIndexes] (
	[Name],
	[GroupName],
	[ModifiedDate])
    SELECT
        [Name],
        [GroupName],
        [ModifiedDate] FROM HumanResources.Department

SELECT * FROM [HumanResources].[Department_WithIndexes]


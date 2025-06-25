-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: PRIMARY KEY uniquely identifies each record in a table
-- Primary keys must contain UNIQUE values, and cannot contain NULL values
-- A table can have only ONE primary key; and in the table,
-- this primary key can consist of single or multiple columns (fields).
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- SELECT * FROM AdventureWorks2019.HumanResources.Department

DROP TABLE IF EXISTS [HumanResources].[Department_WithIndexes]

-- /*
-- Add a PRIMARY KEY on the Table on DepartmentID
CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
)
-- */

/*
-- Another way to:
-- Add a PRIMARY KEY as a CONSTRAINT on the Table on DepartmentID
CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
    CONSTRAINT pk_DepartmentID PRIMARY KEY (DepartmentID)
)
-- */

/*
-- More common way way to:
-- ADD a PRIMARY KEY as a CONSTRAINT via ALTER TABLE on DepartmentID
CREATE TABLE [HumanResources].[Department_WithIndexes](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
)

ALTER TABLE [HumanResources].[Department_WithIndexes]
    ADD CONSTRAINT pk_DepartmentID PRIMARY KEY (DepartmentID)
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


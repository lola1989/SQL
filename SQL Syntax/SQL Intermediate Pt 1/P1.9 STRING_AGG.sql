-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-29
-- Description: STRING_AGG - used to aggregate sting values
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Select all rows in table to show there are multiple Names in a GroupName
SELECT [Department].[DepartmentID],
    [Department].[Name],
    [Department].[GroupName],
    [Department].[ModifiedDate]
FROM HumanResources.Department AS Department

-- Select total GroupNames
SELECT DISTINCT
    [Department].[GroupName]
FROM HumanResources.Department AS Department

-- List out all of the Departments inside of a group in a single row
SELECT
    [Department].[GroupName],
    STRING_AGG([Name], ', ') AS DepartmentInGroup,
    STRING_AGG([Name], ';') AS DepartmentInGroupProgram
FROM HumanResources.Department AS Department
GROUP BY [Department].[GroupName]
-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-18
-- Description: EXCEPT - where anything that has a full match
-- is filtered out
-- Most common in data warehousing to pull the latest version 
-- and truncate older data
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Use EXCEPT to see how it is like a WHERE 
-- clause in it's inverse
SELECT Department.DepartmentID,
    Department.[Name],
    Department.GroupName,
    Department.ModifiedDate
FROM HumanResources.Department AS Department
EXCEPT
SELECT Department.DepartmentID,
    Department.[Name],
    Department.GroupName,
    Department.ModifiedDate
FROM HumanResources.Department AS Department
    WHERE GroupName = 'R and D'

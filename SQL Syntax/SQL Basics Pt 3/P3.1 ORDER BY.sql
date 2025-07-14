-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-26
-- Description: Understand how ORDER BY works
-- ORDER BY default is in ascending order
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO


-- ORDER BY GroupName
SELECT [DepartmentID]
    ,[Name]
    ,[GroupName]
    ,[ModifiedDate]
FROM HumanResources.Department
ORDER BY GroupName

-- ORDER BY GroupName and Name
SELECT [DepartmentID]
    ,[Name]
    ,[GroupName]
    ,[ModifiedDate]
FROM HumanResources.Department
ORDER BY GroupName, [Name]

-- ORDER BY GroupName in decending order and Name
SELECT [DepartmentID]
    ,[Name]
    ,[GroupName]
    ,[ModifiedDate]
FROM HumanResources.Department
ORDER BY GroupName DESC, [Name]

-- ORDER BY GroupName and Name in decending order 
SELECT [DepartmentID]
    ,[Name]
    ,[GroupName]
    ,[ModifiedDate]
FROM HumanResources.Department
ORDER BY GroupName DESC, [Name] DESC

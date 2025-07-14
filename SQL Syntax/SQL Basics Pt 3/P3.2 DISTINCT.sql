-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-26
-- Description: Use DISTINCT
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Use DISTINCT to obtain the Distince GroupNames
SELECT DISTINCT [GroupName],
    [ModifiedDate]
FROM HumanResources.Department
ORDER BY GroupName

-- Use DISTINCT to obtain the Distince Name, GroupNames, and ModifiedDate
SELECT DISTINCT [Name],
    [GroupName],
    [ModifiedDate]
FROM HumanResources.Department
ORDER BY GroupName

SELECT DISTINCT [ModifiedDate]
FROM HumanResources.Department
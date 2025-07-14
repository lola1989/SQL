-- ----------------------------------------------------------------
-- Author: 
-- Create date: 2025-05-26
-- Description: Understand TRUNCATE
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

DROP TABLE IF EXISTS HumanResources.DepartmentCopy

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate]
    INTO HumanResources.DepartmentCopy
FROM HumanResources.Department
WHERE DepartmentID >10

-- Remove everyting from the HumanResources.DepartmentCopy table
TRUNCATE TABLE HumanResources.DepartmentCopy

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate]
FROM HumanResources.DepartmentCopy


-- Adding a Data departement using INSERT INTO
INSERT INTO HumanResources.DepartmentCopy (
     [Name],
    [GroupName],
    [ModifiedDate] )
    VALUES ('Data', 'Operations', '2023-08-05')

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate]
FROM HumanResources.DepartmentCopy
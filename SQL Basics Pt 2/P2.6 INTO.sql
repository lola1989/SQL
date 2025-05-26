-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-26
-- Description: Use INTO to create a temporary table
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

SET NOCOUNT ON;

-- Use INTO create a new copy table
DROP TABLE IF EXISTS HumanResources.DepartmentCopy

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate]
    INTO HumanResources.DepartmentCopy
FROM HumanResources.Department

SELECT * FROM HumanResources.DepartmentCopy



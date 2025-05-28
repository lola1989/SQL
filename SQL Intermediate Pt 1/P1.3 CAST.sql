-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-28
-- Description: CAST
-- CAST() function converts a value (of any type) 
-- into a specified datatype
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Query Table information
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Person'

-- Creating a Scalar Variable
DECLARE @SearchValue NVARCHAR(255)
-- SET @SearchValue = '3'
SET @SearchValue = '92c4279f-1207-48a3-8448-4636514eb7e2'

-- Query to compare 2 variables that are CAST to the same type
SELECT [Person].[Title],
    [Person].[FirstName],
    [Person].[MiddleName],
    [Person].[LastName],
    [Person].[BusinessEntityID],
    [Person].[rowguid]
FROM Person.Person AS Person
WHERE CAST([Person].[BusinessEntityID] AS NVARCHAR(255)) = @SearchValue
    OR CAST([Person].[rowguid] AS NVARCHAR(255)) = @SearchValue
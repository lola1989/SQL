-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-03
-- Description: INNER JOIN selects records that have matching 
-- values in both tables
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

SELECT [EDH].[BusinessEntityID],
    [EDH].[DepartmentID],
    [EDH].[ShiftID],
    [EDH].[StartDate],
    [EDH].[EndDate],
    [EDH].[ModifiedDate]
FROM HumanResources.EmployeeDepartmentHistory AS EDH

SELECT [Person].[BusinessEntityID],
    [Person].[PersonType],
    [Person].[NameStyle],
    [Person].[Title],
    [Person].[FirstName],
    [Person].[MiddleName],
    [Person].[LastName],
    [Person].[Suffix],
    [Person].[EmailPromotion],
    [Person].[AdditionalContactInfo],
    [Person].[Demographics],
    [Person].[rowguid],
    [Person].[ModifiedDate] 
FROM Person.Person AS Person
WHERE PersonType = 'EM'


-- The Table in the FROM Statement is the Left table and the Table after the join is the Right Table


-- INNER JOIN EmployeeDepartmentHistory with Person on BusinessEntityID, Only Records that exists in both tables 
SELECT [EDH].[BusinessEntityID],
    [EDH].[DepartmentID],
    [EDH].[ShiftID],
    [EDH].[StartDate],
    [EDH].[EndDate],
    [EDH].[ModifiedDate],
    [Person].[Title],
    [Person].[FirstName],
    [Person].[MiddleName],
    [Person].[LastName]
FROM HumanResources.EmployeeDepartmentHistory AS EDH
    INNER JOIN Person.Person AS Person 
        ON Person.BusinessEntityID = EDH.BusinessEntityID


-- JOIN is the same as INNER JOIN (same amount of rows return: 116)
SELECT * FROM HumanResources.EmployeeDepartmentHistory AS EDH
    JOIN Person.Person AS Person 
        ON Person.BusinessEntityID = EDH.BusinessEntityID


-- The order of the JOIN Statement does not matter on INNER JOIN or JOIN
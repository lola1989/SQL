-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-03
-- Description: LEFT JOIN returns all records from the left table 
-- (table1), and the matching records from the right table (table2)
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


-- LEFT JOIN EmployeeDepartmentHistory with Person on BusinessEntityID
-- All records from EDH will retrun along with any that match from the Persons table
-- 116 rows
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
    LEFT JOIN Person.Person AS Person 
        ON EDH.BusinessEntityID = Person.BusinessEntityID

/*
SELECT column_name(s)
FROM LeftTable
LEFT JOIN RightTable
ON LeftTable.column_name = RightTable.column_name;
*/


-- LEFT JOIN Person with EmployeeDepartmentHistory on BusinessEntityID
-- All records from the Person table will retrun along with any that match from the EDR table
-- 19,977 rows
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
FROM Person.Person AS Person 
    LEFT JOIN HumanResources.EmployeeDepartmentHistory AS EDH
        ON Person.BusinessEntityID = EDH.BusinessEntityID 


-- If a left join has nothing to match on in the table
-- that it is  joining to there will just be null values
-- the row will still be included 
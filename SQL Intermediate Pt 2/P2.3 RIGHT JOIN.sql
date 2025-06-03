-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-03
-- Description: RIGHT JOIN returns all records from the right table 
-- (table1), and the matching records from the left table (table2)
-- RIGHT OUTER JOIN (T-SQL) is the same as a RIGHT JOIN
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


-- The Table in the FROM Statement is the Left table and the Table after the Join is the Right Table


-- RIGHT JOIN EmployeeDepartmentHistory with Person on BusinessEntityID
-- All records from EDH will retrun along with any that match from the Persons table
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
FROM HumanResources.EmployeeDepartmentHistory AS EDH
    RIGHT JOIN Person.Person AS Person 
        ON EDH.BusinessEntityID = Person.BusinessEntityID

/*
SELECT column_name(s)
FROM LeftTable
RIGHT JOIN RightTable
ON LeftTable.column_name = RightTable.column_name;
*/


-- RIGHT JOIN Person with EmployeeDepartmentHistory on BusinessEntityID
-- All records from the Person table will retrun along with any that match from the EDR table
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
FROM Person.Person AS Person 
    RIGHT JOIN HumanResources.EmployeeDepartmentHistory AS EDH
        ON Person.BusinessEntityID = EDH.BusinessEntityID 



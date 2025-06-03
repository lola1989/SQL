-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-03
-- Description: FULL OUTER JOIN returns all records when there's 
-- a match in left (table1) or right (table2) table records
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- The Table in the FROM Statement is the Left table and the Table after the Join is the Right Table


-- FULL OUTER JOIN
-- All records from EDH and Persons table will retrun weather there is a match or not
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
    FULL OUTER JOIN Person.Person AS Person 
        ON EDH.BusinessEntityID = Person.BusinessEntityID
-- FROM Person.Person AS Person 
--     FULL OUTER JOIN HumanResources.EmployeeDepartmentHistory AS EDH
--         ON Person.BusinessEntityID = EDH.BusinessEntityID 

/*
SELECT column_name(s)
FROM LeftTable
FULL OUTER JOIN RightTable
ON LeftTable.column_name = RightTable.column_name;
*/





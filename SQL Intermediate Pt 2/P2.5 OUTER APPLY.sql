-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-05
-- Description: OUTER APPLY - like a LEFT JOIN
-- Can be used to pull full query and attach it to each row
-- Use to obtain aggregate info with out using GROUP BY
-- Used to know select information from another table
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Use OUTER APPLY to append each row of the Department Table to all rows
-- returns 225 rows 15*15
SELECT * FROM HumanResources.Department AS RootDepartment
OUTER APPLY (SELECT * FROM HumanResources.Department) AS InnerDepartment


-- Use OUTER APPLY to append each row of the Department Table to itsself
-- returns 15 rows
SELECT * FROM HumanResources.Department AS RootDepartment
    OUTER APPLY (SELECT * FROM HumanResources.Department AS NestedDepartment
        WHERE NestedDepartment.DepartmentID = RootDepartment.DepartmentID) AS InnerDepartment


-- Use OUTER APPLY to know how many people are in each department
SELECT * FROM HumanResources.Department AS RootDepartment
    OUTER APPLY (
        SELECT COUNT(*) AS EmployeeCount 
            FROM HumanResources.EmployeeDepartmentHistory AS EmployeeCount
                WHERE EmployeeCount.DepartmentID = RootDepartment.DepartmentID
    ) AS EmployeesInDepartment



-- Use OUTER APPLY to know how many Active & History Total Employees are in each department
SELECT * FROM HumanResources.Department AS RootDepartment
    OUTER APPLY (
        SELECT COUNT(*) AS ActiveEmployeeCount 
            FROM HumanResources.EmployeeDepartmentHistory AS EmployeeCount
                WHERE EmployeeCount.DepartmentID = RootDepartment.DepartmentID 
                    AND EmployeeCount.EndDate IS NULL
    ) AS EmployeesInDepartment
    OUTER APPLY (
        SELECT COUNT(*) AS EmployeeCount 
            FROM HumanResources.EmployeeDepartmentHistory AS EmployeeCount
                WHERE EmployeeCount.DepartmentID = RootDepartment.DepartmentID
    ) AS EmployeesInDepartment2



-- Use OUTER APPLY to know who the first Employee was using TOP 1 
SELECT * FROM HumanResources.Department AS RootDepartment
    OUTER APPLY (
        SELECT TOP 1 FirstEmployee.BusinessEntityID
            FROM HumanResources.EmployeeDepartmentHistory AS FirstEmployee
                WHERE FirstEmployee.DepartmentID = RootDepartment.DepartmentID
            ORDER BY FirstEmployee.StartDate
    ) AS FirstEmployeesInDepartment
        OUTER APPLY (
        SELECT  Person.FirstName + ' ' + Person.LastName AS FullName
            FROM Person.Person AS Person
                WHERE Person.BusinessEntityID = FirstEmployeesInDepartment.BusinessEntityID
    ) AS FirstEmployees
    

-- Use OUTER APPLY to know the first Employee was using TOP 1 & how many Active Employees are in each department
-- Correct way
SELECT * FROM HumanResources.Department AS RootDepartment
    OUTER APPLY (
        SELECT TOP 1 Person.FirstName + ' ' + Person.LastName AS FullName
            FROM HumanResources.EmployeeDepartmentHistory AS FirstEmployee
                JOIN Person.Person
                    ON FirstEmployee.BusinessEntityID = Person.BusinessEntityID
                WHERE FirstEmployee.DepartmentID = RootDepartment.DepartmentID 
                    AND FirstEmployee.EndDate IS NULL
            ORDER BY FirstEmployee.StartDate
    ) AS EmployeesInDepartment
    OUTER APPLY (
        SELECT COUNT(*) AS EmployeeCount 
            FROM HumanResources.EmployeeDepartmentHistory AS EmployeeCount
                WHERE EmployeeCount.DepartmentID = RootDepartment.DepartmentID
                    AND EmployeeCount.EndDate IS NULL
    ) AS EmployeesInDepartment2

-- SELECT all Active Employees in each Department
SELECT * FROM HumanResources.Department AS RootDepartment
    OUTER APPLY (
        SELECT Person.FirstName + ' ' + Person.LastName AS FullName
            FROM HumanResources.EmployeeDepartmentHistory AS FirstEmployee
                JOIN Person.Person
                    ON FirstEmployee.BusinessEntityID = Person.BusinessEntityID
                WHERE FirstEmployee.DepartmentID = RootDepartment.DepartmentID 
                    AND FirstEmployee.EndDate IS NULL
    ) AS EmployeesInDepartment





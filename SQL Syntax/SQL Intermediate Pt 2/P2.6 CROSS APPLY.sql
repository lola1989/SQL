-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-05
-- Description: CROSS APPLY - like a INNER JOIN
-- Only returns records that both have a match
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Use CROSS APPLY to know how many people are in each department
SELECT * FROM HumanResources.Department AS RootDepartment
    CROSS APPLY (
        SELECT COUNT(*) AS EmployeeCount 
            FROM HumanResources.EmployeeDepartmentHistory AS EmployeeCount
                WHERE EmployeeCount.DepartmentID = RootDepartment.DepartmentID
    ) AS EmployeesInDepartment



-- Use CROSS APPLY
SELECT * FROM HumanResources.Department AS RootDepartment
    CROSS APPLY (
        SELECT TOP 1 Person.FirstName + ' ' + Person.LastName AS FullName
            FROM HumanResources.EmployeeDepartmentHistory AS FirstEmployee
                JOIN Person.Person
                    ON FirstEmployee.BusinessEntityID = Person.BusinessEntityID
                WHERE FirstEmployee.DepartmentID = RootDepartment.DepartmentID 
                    -- AND FirstEmployee.EndDate IS NULL
                    AND FirstEmployee.DepartmentID = 2
            ORDER BY FirstEmployee.StartDate
    ) AS EmployeesInDepartment
    OUTER APPLY (
        SELECT COUNT(*) AS EmployeeCount 
            FROM HumanResources.EmployeeDepartmentHistory AS EmployeeCount
                WHERE EmployeeCount.DepartmentID = RootDepartment.DepartmentID
                    AND EmployeeCount.EndDate IS NULL
    ) AS EmployeesInDepartment2







-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-26
-- Description: WHERE Assignment
-- ----------------------------------------------------------------
USE AdventureWorks2019
GO

-- Use WHERE to select all married employees from the 
-- HumanResources.Employee table.
SELECT [BusinessEntityID],
    [NationalIDNumber],
    [LoginID],
    [OrganizationNode],
    [OrganizationLevel],
    [JobTitle],
    [BirthDate],
    [MaritalStatus],
    [Gender],
    [HireDate],
    [SalariedFlag],
    [VacationHours],
    [SickLeaveHours],
    [CurrentFlag],
    [rowguid],
    [ModifiedDate] 
FROM HumanResources.Employee
WHERE MaritalStatus = 'M'



-- Next, look in the HumanResources.EmployeeDepartmentHistory 
-- table for each Employee's current Department.
-- The Department is current if the EndDate field is NULL.
-- Remember you can't use equal(=) or not equal(<>) 
-- comparison operators to check if a field is null.

SELECT [BusinessEntityID],
    [DepartmentID],
    [ShiftID],
    [StartDate],
    [EndDate],
    [ModifiedDate] 
FROM HumanResources.EmployeeDepartmentHistory
WHERE EndDate IS NULL
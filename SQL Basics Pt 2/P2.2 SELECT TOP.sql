-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-26
-- Description: SELECT TOP for quickly finding out what kind 
-- of information is in a table
-- ----------------------------------------------------------------
USE AdventureWorks2019
GO

SELECT TOP (7) [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department

SELECT TOP 10 [BusinessEntityID],
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

SELECT TOP 5 [BusinessEntityID],
    [RateChangeDate],
    [Rate],
    [PayFrequency],
    [ModifiedDate] 
FROM HumanResources.EmployeePayHistory

SELECT TOP 20 [JobCandidateID],
    [BusinessEntityID],
    [Resume],
    [ModifiedDate] 
FROM HumanResources.JobCandidate
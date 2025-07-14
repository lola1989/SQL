-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-07-01
-- Description: View Indexes
-- Columns must be unique, can alias 
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

CREATE OR ALTER VIEW HumanResources.vwEmployeeInfoIndex
/*
    SELECT * FROM HumanResources.vwEmployeeInfoIndex 
*/
WITH SCHEMABINDING
AS
    SELECT [Employee].[BusinessEntityID],
        [Employee].[NationalIDNumber],
        [Employee].[LoginID],
        [Employee].[OrganizationNode],
        [Employee].[OrganizationLevel],
        [Employee].[JobTitle],
        [Employee].[BirthDate],
        [Employee].[MaritalStatus],
        [Employee].[Gender],
        [Employee].[HireDate],
        [Employee].[SalariedFlag],
        [Employee].[VacationHours],
        [Employee].[SickLeaveHours],
        [Employee].[CurrentFlag],
        [Person].[PersonType],
        [Person].[NameStyle],
        [Person].[Title],
        [Person].[FirstName],
        [Person].[MiddleName],
        [Person].[LastName],
        [Person].[Suffix],
        [Person].[EmailPromotion],
        [Person].[Demographics]
    FROM Person.Person
        JOIN HumanResources.Employee 
            ON Employee.BusinessEntityID = Person.BusinessEntityID

GO
-- UNIQUE CLUSTERED INDEX - Same as unique constraint & clustered index on the same set of fields
-- Must also have SCHEMABINDING on as well
-- Index will be removed anytime the veiw is editied 
CREATE UNIQUE CLUSTERED INDEX cix_vwEmployeeInfoIndex_BusinessEntityID ON HumanResources.vwEmployeeInfoIndex(BusinessEntityID)

-- SP_HELPINDEX 'HumanResources.vwEmployeeInfoIndex'
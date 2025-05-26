-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-26
-- Description: GROUP BY
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- COUNT rows in table
SELECT COUNT(*) AS Count
FROM Production.Product

-- COUNT Color in table
SELECT COUNT(Color) AS ProductColor
FROM Production.Product

-- COUNT DISTINCT Color in table
SELECT COUNT(DISTINCT Color) AS ProductColor
FROM Production.Product

-- COUNT DISTINCT ReorderPoint in table
SELECT COUNT(DISTINCT ReorderPoint) AS ReorderPoint
FROM Production.Product

-- How many of each ReorderPoint values are in the table
SELECT ReorderPoint,
    COUNT(ReorderPoint) AS ReorderPointCount    
FROM Production.Product
GROUP BY ReorderPoint
ORDER BY ReorderPoint

SELECT [ProductID],
    [Name],
    [ProductNumber],
    [MakeFlag],
    [FinishedGoodsFlag],
    [Color],
    [SafetyStockLevel],
    [ReorderPoint],
    [StandardCost],
    [ListPrice],
    [Size],
    [SizeUnitMeasureCode],
    [WeightUnitMeasureCode],
    [Weight],
    [DaysToManufacture],
    [ProductLine],
    [Class],
    [Style],
    [ProductSubcategoryID],
    [ProductModelID],
    [SellStartDate],
    [SellEndDate],
    [DiscontinuedDate],
    [rowguid],
    [ModifiedDate]
FROM Production.Product

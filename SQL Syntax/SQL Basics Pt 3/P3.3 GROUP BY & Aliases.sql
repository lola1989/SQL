-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-26
-- Description: Using GROUP BY & Aliases with the aggregate function COUNT
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

-- You can keep adding values as long as they are aggregate values
-- Added ROUND to show only 2 decimal places for the aggregate value
SELECT ReorderPoint,
    COUNT(ReorderPoint) AS ReorderPointCount,
    SUM(StandardCost) AS Sum_StandardCost,
    MIN(StandardCost) AS Min_StandardCost,
    MAX(StandardCost) AS Max_StandardCost,
    ROUND(AVG(StandardCost),2)  AS Avg_StandardCost 
FROM Production.Product
GROUP BY ReorderPoint
ORDER BY ReorderPoint

-- Query to show the Alis on all column names
SELECT [Product].[ProductID],
[Product].[Name],
[Product].[ProductNumber],
[Product].[MakeFlag],
[Product].[FinishedGoodsFlag],
[Product].[Color],
[Product].[SafetyStockLevel],
[Product].[ReorderPoint],
[Product].[StandardCost],
[Product].[ListPrice],
[Product].[Size],
[Product].[SizeUnitMeasureCode],
[Product].[WeightUnitMeasureCode],
[Product].[Weight],
[Product].[DaysToManufacture],
[Product].[ProductLine],
[Product].[Class],
[Product].[Style],
[Product].[ProductSubcategoryID],
[Product].[ProductModelID],
[Product].[SellStartDate],
[Product].[SellEndDate],
[Product].[DiscontinuedDate],
[Product].[rowguid],
[Product].[ModifiedDate] FROM Production.Product AS Product

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


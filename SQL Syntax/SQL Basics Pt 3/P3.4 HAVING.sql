-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-27
-- Description: HAVING allows you to put aggregate functions 
-- in the WHERE clause
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Query to show that WHERE using aggregates throws an error
SELECT ReorderPoint,
    COUNT(ReorderPoint) AS ReorderPointCount,
    SUM(StandardCost) AS Sum_StandardCost,
    MIN(StandardCost) AS Min_StandardCost,
    MAX(StandardCost) AS Max_StandardCost,
    ROUND(AVG(StandardCost),2) AS Avg_StandardCost 
FROM Production.Product
WHERE SUM(StandardCost) > 200
GROUP BY ReorderPoint
ORDER BY ReorderPoint

-- Correct way to use an aggregate as a filter using HAVING
SELECT ReorderPoint,
    COUNT(ReorderPoint) AS ReorderPointCount,
    SUM(StandardCost) AS Sum_StandardCost,
    MIN(StandardCost) AS Min_StandardCost,
    MAX(StandardCost) AS Max_StandardCost,
    ROUND(AVG(StandardCost),2) AS Avg_StandardCost 
FROM Production.Product
WHERE Color = 'Black'
GROUP BY ReorderPoint
HAVING SUM(StandardCost) > 200
ORDER BY ReorderPoint


SELECT * FROM Production.Product
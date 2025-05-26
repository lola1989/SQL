-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-25
-- Description: Understanding the SELECT statement
-- ----------------------------------------------------------------
USE TestDatabase
GO

-- SELECT Everything using *
SELECT * FROM Inventory.Furniture

-- SELECT certain fields, takes up less memeory for processing
SELECT [FurnitureId],
    [FurnitureType],
    [FurnitureName],
    [Price],
    [Quantity]
FROM Inventory.Furniture

-- SELECT certain fields using and Alais
SELECT [F1].[FurnitureId],
    [F1].[FurnitureType],
    [F1].[FurnitureName],
    [F1].[Price],
    [F1].[Quantity],
    [F1].[ReleaseDate],
    [F1].[CreateDate],
    [F1].[UpdateDate] 
FROM Inventory.Furniture AS F1




----------------------------------------------------------------
-- ALTER rows via UPDATE & SET
----------------------------------------------------------------
USE TestDatabase
GO


SELECT * FROM Inventory.Furniture

-- UPDATE table & SET a specfic column to a specific value
UPDATE Inventory.Furniture SET Quantity = 40




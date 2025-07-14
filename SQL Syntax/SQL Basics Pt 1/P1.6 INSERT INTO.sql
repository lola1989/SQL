-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-25
-- Description: INSERT VALUES into Inventory.Furniture
-- ----------------------------------------------------------------
USE TestDatabase;
GO 

INSERT INTO Inventory.Furniture(
    [FurnitureType],
    [FurnitureName],
    [Price],
    [Quantity],
    [ReleaseDate],
    [CreateDate],
    [UpdateDate]
) VALUES (
    'Couch',
    'The Super Delux Sectional',
    1299.99,
    34,
    '2023-08-15',
    '2023-08-15 20:00:00',
    '2023-08-15 20:00:00'
);
GO




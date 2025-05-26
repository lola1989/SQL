----------------------------------------------------------------
-- INSERT VALUES into Inventory.Furniture
-- Inventory is the Schema 
-- Furniture is the Table name
----------------------------------------------------------------


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




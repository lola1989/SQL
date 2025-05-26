-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-25
-- Description: Create Furniture Table on the Inventory Schema
----------------------------------------------------------------
USE TestDatabase;
GO 

DROP TABLE IF EXISTS Inventory.Furniture

CREATE TABLE Inventory.Furniture (
    FurnitureId 	    INT IDENTITY(1,1),       -- (1,1) - start with 1 and increment by 1
    FurnitureType 	    VARCHAR(50) NULL,        -- (50) - 50 characters in lenght
    FurnitureName 	    VARCHAR(50) NOT NULL,    -- (50) - 50 characters in lenght
    Price 		        DECIMAL(18,4),           -- (18,4) 18 characters in front of decimal & 4 behind
    Quantity 		    INT DEFAULT (0),         -- ~2.1 billion
    ReleaseDate 	    DATE,                    -- Short Date
    CreateDate 		    DATETIME,                -- Date Time
    UpdateDate 		    DATETIME
);
GO
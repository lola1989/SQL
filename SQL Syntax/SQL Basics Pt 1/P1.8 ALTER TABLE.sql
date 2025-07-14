-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-25
-- Description: ALTER TABLE
-- ----------------------------------------------------------------
USE TestDatabase
GO

-- ADD Subcategory column with a DEFAULT value
ALTER TABLE Inventory.Furniture 
ADD Subcategory VARCHAR (50) NOT NULL DEFAULT ('')

SELECT * FROM Inventory.Furniture

-- DROP COLUMN Subcategory column
ALTER TABLE Inventory.Furniture 
DROP COLUMN Subcategory

-- Error thrown as there is a constraint on the table
-- DROP CONSTRAINT first 
ALTER TABLE Inventory.Furniture 
DROP CONSTRAINT DF__Furniture__Subca__38996AB5

-- ADD Subcategory column with a nullable value
ALTER TABLE Inventory.Furniture 
ADD Subcategory VARCHAR (50) NULL


-- ADD CONSTRAINT: DEFAULT value for 
ALTER TABLE Inventory.Furniture 
ADD CONSTRAINT DF_Furniture_Subcategory DEFAULT ('')
FOR Subcategory

-- UPDATE Subcategory to DEFAULT
UPDATE Inventory.Furniture SET Subcategory = DEFAULT
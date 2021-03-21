-- Which data set to use
USE health;

-- Create table
CREATE TABLE `health`.`fat_supply_quantity_data` (
  `Country` VARCHAR(45) NOT NULL,
  `Animal_Products` FLOAT NOT NULL,
  `Animal_fats` FLOAT NOT NULL,
  `Cereals` FLOAT NOT NULL,
  `Eggs` FLOAT NOT NULL,
  `Fish` FLOAT NOT NULL,
  `Fruits` FLOAT NOT NULL,
  `Meat` FLOAT NOT NULL,
  `Miscellaneous` FLOAT NOT NULL,
  `Milk` FLOAT NOT NULL,
  `Offals` FLOAT NOT NULL,
  `Oilcrops` FLOAT NOT NULL,
  `Pulses` FLOAT NOT NULL,
  `Spices` FLOAT NOT NULL,
  `Starchy_Roots` FLOAT NOT NULL,
  `Stimulants` FLOAT NOT NULL,
  `Sugar_Crops` FLOAT NOT NULL,
  `Sugar_Sweeteners` FLOAT NOT NULL,
  `Treenuts` FLOAT NOT NULL,
  `Vegetal_Products` FLOAT NOT NULL,
  `Vegetable_Oils` FLOAT NOT NULL,
  `Vegetables` FLOAT NOT NULL,
  `Obesity` FLOAT NOT NULL,
  `Undernourished` FLOAT NOT NULL,
  `Confirmed` FLOAT NOT NULL,
  `Deaths` FLOAT NOT NULL,
  `Recovered` FLOAT NOT NULL,
  `Active` FLOAT NOT NULL,
  `Population` FLOAT NOT NULL,
  PRIMARY KEY (`Country`),
  UNIQUE INDEX `Country_UNIQUE` (`Country` ASC) VISIBLE);

-- Update Table - join two tables
UPDATE food_supply_quantity_kg_data 
JOIN Suicide_rate on food_supply_quantity_kg_data.Country=Suicide_rate.Country
SET food_supply_quantity_kg_data.Suicide_rate=suicide_rate.Suicide_rate;

-- Delete column
ALTER TABLE health.food_supply_kcal_data                         
DROP COLUMN aquatic_products; 

-- Create table
CREATE TABLE `health`.`suicide_rate_1` (
  `Country` VARCHAR(45) NOT NULL,
  `Suicide_rate` VARCHAR(45) NULL,
  `ISO_code` VARCHAR(45) NULL,
  PRIMARY KEY (`Country`));
  
  -- Drop table
  DROP TABLE suicide_rate_1; 

-- Delete row 
DELETE FROM health.protein_supply_quantity_data
WHERE Country = "Vanuatu"; 

-- Insert row and data into table
INSERT INTO health.protein_supply_quantity_data(
			Country, Alcoholic_Beverages, Animal_Products, Animal_fats, Aquatic_Products, 
			Cereals, Eggs, Fish, Fruits, Meat, Milk, Offals, Oilcrops, Pulses, Spices, 
            Starchy_Roots, Stimulants, Sugar_Crops, Sugar_Sweeteners, Treenuts, 
            Vegetal_Products, Vegetable_Oils, Vegetables, Miscellaneous, Obesity, 
            Undernourished, Confirmed, Deaths, Recovered, Active, Population) 
VALUES ('Antigua and Barbuda', '0.1535', '33.1901', '0.1289', '0',
		'10.5108', '0.485', '8.2146', '1.2586', '16.067', '7.4349', '0.8534', '0.7674', '0.8841', '0.3438',
        '0.4666', '0.4113', '0', '0', '0.0737', 
        '16.8161', '0.043', '1.6024', '0.2947', '19.1', 
        '0', '0.293877551020408', '0.00714285714285714', '0.190816326530612','0.0959183673469388', '98000'); 

-- Checking higest obesity numbers around the world
SELECT Country, Obesity, Deaths, Active, Recovered
FROM health.food_supply_quantity_kg_data
WHERE Obesity > '30'
ORDER BY Obesity DESC; 

-- Countries with higest activity rate  
SELECT *
FROM health.food_supply_quantity_kg_data
WHERE Active > '1'
ORDER BY Active DESC;    

-- Querry to know what suicide rates are
SELECT Suicide_rate, count(Suicide_rate)
FROM health.food_supply_quantity_kg_data
GROUP BY Suicide_rate;
            
-- CREATE VIEW
CREATE VIEW high_risk
AS
SELECT *
FROM health.protein_supply_quantity_data
WHERE Alcoholic_Beverages > '0.5'
AND Obesity > '10'
ORDER BY Deaths DESC;	
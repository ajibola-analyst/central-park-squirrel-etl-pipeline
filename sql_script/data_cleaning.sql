CREATE DATABASE squirrel_project;
USE squirrel_project;

-- CLEANING

SELECT * FROM squirrels LIMIT 10;

SET SQL_SAFE_UPDATES = 0;

UPDATE squirrels
SET Date = STR_TO_DATE(Date, '%m%d%Y');

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE squirrels 
MODIFY COLUMN Date DATE;

UPDATE squirrels
SET Running = CASE WHEN Running = 'true' THEN 1 ELSE 0 END,
    Chasing = CASE WHEN Chasing = 'true' THEN 1 ELSE 0 END,
    Climbing = CASE WHEN Climbing = 'true' THEN 1 ELSE 0 END,
    Eating = CASE WHEN Eating = 'true' THEN 1 ELSE 0 END,
    Foraging = CASE WHEN Foraging = 'true' THEN 1 ELSE 0 END,
    Kuks = CASE WHEN Kuks = 'true' THEN 1 ELSE 0 END,
    Quaas = CASE WHEN Quaas = 'true' THEN 1 ELSE 0 END,
    Moans = CASE WHEN Moans = 'true' THEN 1 ELSE 0 END,
    `Tail flags` = CASE WHEN `Tail flags` = 'true' THEN 1 ELSE 0 END,
    `Tail twitches` = CASE WHEN `Tail twitches` = 'true' THEN 1 ELSE 0 END,
    Approaches = CASE WHEN Approaches = 'true' THEN 1 ELSE 0 END,
    Indifferent = CASE WHEN Indifferent = 'true' THEN 1 ELSE 0 END,
    `Runs from` = CASE WHEN `Runs from` = 'true' THEN 1 ELSE 0 END;
    
ALTER TABLE squirrels 
MODIFY COLUMN Running TINYINT(1),
MODIFY COLUMN Chasing TINYINT(1),
MODIFY COLUMN Climbing TINYINT(1),
MODIFY COLUMN Eating TINYINT(1),
MODIFY COLUMN Foraging TINYINT(1),
MODIFY COLUMN Kuks TINYINT(1),
MODIFY COLUMN Quaas TINYINT(1),
MODIFY COLUMN Moans TINYINT(1),
MODIFY COLUMN `Tail flags` TINYINT(1),
MODIFY COLUMN `Tail twitches` TINYINT(1),
MODIFY COLUMN Approaches TINYINT(1),
MODIFY COLUMN Indifferent TINYINT(1),
MODIFY COLUMN `Runs from` TINYINT(1);

ALTER TABLE squirrels 
DROP COLUMN `Lat/Long`;

ALTER TABLE squirrels 
MODIFY COLUMN X DECIMAL(10, 7),
MODIFY COLUMN Y DECIMAL(10, 7);

UPDATE squirrels
SET Age = NULL WHERE Age = '' OR Age = '?';

UPDATE squirrels
SET `Primary Fur Color` = NULL WHERE `Primary Fur Color` = '';

UPDATE squirrels
SET Location = NULL WHERE Location = '';

-- First, replace 'FALSE' and empty strings with NULL
UPDATE squirrels
SET `Above Ground Sighter Measurement` = NULL
WHERE `Above Ground Sighter Measurement` = 'FALSE' 
   or `Above Ground Sighter Measurement` = 'false'
   or `Above Ground Sighter Measurement` = ''
   or `Above Ground Sighter Measurement` = 'Ground Plane'; 
   
   UPDATE squirrels
SET `Above Ground Sighter Measurement` = NULL
WHERE `Above Ground Sighter Measurement` = 'Ground Plane';

-- Now that it only contains numbers and NULLs, change it to an Integer type!
ALTER TABLE squirrels
MODIFY COLUMN `Above Ground Sighter Measurement` INT;

UPDATE squirrels
SET 
    `Highlight Fur Color` = NULLIF(`Highlight Fur Color`, ''),
    `Color notes` = NULLIF(`Color notes`, ''),
    `Specific Location` = NULLIF(`Specific Location`, ''),
    `Other Activities` = NULLIF(`Other Activities`, ''),
    `Other Interactions` = NULLIF(`Other Interactions`, '');
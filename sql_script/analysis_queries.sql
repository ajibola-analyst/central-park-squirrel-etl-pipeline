-- Analysing 

SELECT 
    Hectare, 
    COUNT(`Unique Squirrel ID`) AS Total_Squirrels
FROM squirrels
GROUP BY Hectare
ORDER BY Total_Squirrels DESC
LIMIT 5;

SELECT 
    Shift,
    COUNT(`Unique Squirrel ID`) AS Total_Sightings,
    SUM(Running) AS Running_Count,
    SUM(Chasing) AS Chasing_Count,
    SUM(Climbing) AS Climbing_Count,
    SUM(Eating) AS Eating_Count,
    SUM(Foraging) AS Foraging_Count
FROM squirrels
GROUP BY Shift;


SELECT 
    `Primary Fur Color`, 
    Age, 
    COUNT(`Unique Squirrel ID`) AS Total_Squirrels
FROM squirrels
WHERE `Primary Fur Color` IS NOT NULL 
  AND Age IS NOT NULL
GROUP BY `Primary Fur Color`, Age
ORDER BY Total_Squirrels DESC;


SELECT 
    SUM(Approaches) AS approaches_human,
    SUM(Indifferent) AS ignores_human,
    SUM(`Runs from`) AS runs_away
FROM squirrels;
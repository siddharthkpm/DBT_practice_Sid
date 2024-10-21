{{ config(materialized='table') }}

WITH a AS (
    SELECT 
        B.name AS TeamName,
        A.year,
        SUM(A.G) AS no_of_goals,
        ROW_NUMBER() OVER (PARTITION BY A.year ORDER BY SUM(A.G) DESC) AS Top_5
    FROM 
     hockeydb.hockey.scoring A
    JOIN 
        hockeydb.hockey.teams B ON s.tmid = t.tmid
    WHERE 
        s.year = 2011
    GROUP BY 
        B.name, A.year
)
SELECT 
    Team_Name,
    year,
    no_of_goals
FROM 
    a
WHERE 
    rank_1 <=5

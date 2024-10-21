{{ config(materialized='table') }}

SELECT t.name,
    round(AVG(s.G),2) AS avg_goal
FROM HOCKEYDB.HOCKEY.SCORING s
JOIN HOCKEYDB.HOCKEY.TEAMS t ON s.tmid = t.tmid
GROUP BY t.name

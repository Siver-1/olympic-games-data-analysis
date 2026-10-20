-- =========================================================
-- OLYMPIC GAMES DATA ANALYSIS
-- File: 02_morocco_analysis.sql
-- Scope: Morocco — Summer Olympic Games (1896–2024)
-- Purpose: Analyze Morocco's participation and medal performance
-- =========================================================


-- =========================================================
-- SECTION 1: MOROCCO'S MEDAL EVOLUTION
-- =========================================================


-- Q1. Evolution of Morocco's medal count across Olympic editions
-- Objective: Track medal totals and changes between editions.

WITH Medal_Count AS (
    SELECT
        year,
        games,
        SUM(gold) AS Gold_Medals,
        SUM(silver) AS Silver_Medals,
        SUM(bronze) AS Bronze_Medals,
        SUM(Total) AS Total_Medals
    FROM medal_summary
    WHERE noc = 'MAR'
    GROUP BY year, games
),
Prev_Medals AS (
    SELECT
        *,
        LAG(Total_Medals) OVER (ORDER BY year) AS Previous_Medals
    FROM Medal_Count
)
SELECT
    year,
    games,
    Gold_Medals,
    Silver_Medals,
    Bronze_Medals,
    Total_Medals,
    Previous_Medals,
    Total_Medals - Previous_Medals AS Medals_Evolution
FROM Prev_Medals
ORDER BY year;

-- =========================================================
-- SECTION 2: MOROCCO'S PERFORMANCE ANALYSIS
-- Additional validated queries will be added below.
-- =========================================================
-- Q1 How has the participation of Moroccan athletes changed from one edition to the next?
SELECT * FROM Medal_Summary ;
WITH Medal_Count AS(
SELECT
    Year,
    Games,
    sum(gold) AS Gold_Medals,
    sum(silver) AS Silver_Medals,
    sum(bronze) AS Bronze_Medals,
    sum(total) AS Total_Medals
FROM medal_summary
WHERE noc = 'MAR'
GROUP BY Year,Games
),
Prev_Medals AS (
SELECT 
	*,
    Lag(Total_Medals) OVER(Order by year asc) AS Med_Evol
 FROM  Medal_Count )
SELECT *,
 Total_Medals-Med_Evol AS Medals_Evolution
 FROM Prev_Medals ;
 
 -- Q2 In which sports has Morocco won the most medals?

WITH Morocco_Medals AS (
    SELECT DISTINCT
        Year,
        Sport,
        Event,
        Medal
    FROM olympics
    WHERE NOC = 'MAR'
      AND Medal IN ('Gold', 'Silver', 'Bronze')
)
SELECT
    Sport,
    COUNT(*) AS Total_Medals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM Morocco_Medals
GROUP BY Sport
ORDER BY Total_Medals DESC;

-- Q3 What is Morocco's Olympic medal tally?

SELECT
    NOC,
    SUM(gold) AS Gold_Medals,
    SUM(silver) AS Silver_Medals,
    SUM(bronze) AS Bronze_Medals,
    SUM(total) AS Total_Medals
FROM medal_summary
WHERE NOC = 'MAR'
GROUP BY NOC;

-- Q4 Which Moroccan athletes have competed in at least three Olympic Games?
SELECT
    Name,
    COUNT(DISTINCT Year) AS Editions_Participated
FROM olympics
WHERE NOC = 'MAR'
GROUP BY Name
HAVING COUNT(DISTINCT Year) >= 3
ORDER BY Editions_Participated DESC ;

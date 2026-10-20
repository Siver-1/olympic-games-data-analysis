
-- =========================================================
-- OLYMPIC GAMES DATA ANALYSIS
-- File: 03_north_africa_comparison.sql
-- Scope: Summer Olympic Games (1896–2024)
-- Countries: Morocco, Algeria, Tunisia, Egypt
-- =========================================================


-- Q1. How do Morocco, Algeria, Tunisia, and Egypt compare
-- in Olympic medal results at each edition?

SELECT
    Year,
    NOC AS Country_Code,
    country AS Country,
    gold AS Gold,
    silver AS Silver,
    bronze AS Bronze,
    total AS Total_Medals,
    RANK() OVER (
        PARTITION BY Year
        ORDER BY total DESC
    ) AS Medal_Rank
FROM medal_summary
WHERE NOC IN ('MAR', 'ALG', 'TUN','EGY')
ORDER BY Year, Medal_Rank;

-- Q2. How does each country's medal count evolve
-- between successive Olympic editions?


-- Q2. How does each country's medal count evolve
-- between successive Olympic editions, including editions
-- with zero medals?

WITH Editions AS (
    SELECT DISTINCT
        Year,
        games
    FROM medal_summary
),
Countries AS (
    SELECT 'MAR' AS NOC, 'Morocco' AS Country
    UNION ALL SELECT 'ALG', 'Algeria'
    UNION ALL SELECT 'TUN', 'Tunisia'
    UNION ALL SELECT 'EGY', 'Egypt'
),
Country_Edition AS (
    SELECT
        e.Year,
        e.games,
        c.NOC AS Country_Code,
        c.Country,
        COALESCE(m.total, 0) AS Total_Medals
    FROM Editions e
    CROSS JOIN Countries c
    LEFT JOIN medal_summary m
        ON m.Year = e.Year
        AND m.games = e.games
        AND m.noc = c.NOC
),
Country_Evolution AS (
    SELECT
        Year,
        games,
        Country_Code,
        Country,
        Total_Medals,
        LAG(Total_Medals) OVER (
            PARTITION BY Country_Code
            ORDER BY Year
        ) AS Previous_Medals
    FROM Country_Edition
)
SELECT
    Year,
    games,
    Country_Code,
    Country,
    Total_Medals,
    Previous_Medals,
    Total_Medals - Previous_Medals AS Medals_Evolution
FROM Country_Evolution
ORDER BY Year, Country_Code;


-- Q3. In which sports does each country win the most medals?

WITH Unique_Medals AS (
    SELECT DISTINCT
        NOC,
        Year,
        Sport,
        Event,
        Medal
    FROM olympics
    WHERE NOC IN ('MAR', 'ALG', 'TUN','EGY')
      AND Medal IN ('Gold', 'Silver', 'Bronze')
)
SELECT
    NOC AS Country_Code,
    Sport,
    COUNT(*) AS Total_Medals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM Unique_Medals
GROUP BY NOC, Sport
ORDER BY Country_Code, Total_Medals DESC;

-- Q4. Which country wins the most medals in each sport
-- at each Olympic edition?

WITH Unique_Medals AS (
    SELECT DISTINCT
        NOC,
        Year,
        Sport,
        Event,
        Medal
    FROM olympics
    WHERE NOC IN ('MAR', 'ALG', 'TUN','EGY')
      AND Medal IN ('Gold', 'Silver', 'Bronze')
),
Sport_Results AS (
    SELECT
        Year,
        Sport,
        NOC AS Country_Code,
        COUNT(*) AS Total_Medals
    FROM Unique_Medals
    GROUP BY Year, Sport, NOC
)
SELECT
    Year,
    Sport,
    Country_Code,
    Total_Medals,
    DENSE_RANK() OVER (
        PARTITION BY Year, Sport
        ORDER BY Total_Medals DESC
    ) AS Sport_Rank
FROM Sport_Results
;

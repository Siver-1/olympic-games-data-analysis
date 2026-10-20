-- =========================================================
-- OLYMPIC GAMES DATA ANALYSIS
-- File: 01_global_analysis.sql
-- Scope: Summer Olympic Games (1896–2024)
-- Purpose: Explore the dataset and analyze global trends
-- =========================================================


-- =========================================================
-- SECTION 1: BASIC DATA EXPLORATION
-- =========================================================
-- 1.Creation Of Our Databases
CREATE DATABASE Olympic_Games_analysis;

-- 2. Creating The Table Olympics
CREATE TABLE Olympics (
player_id INT,
Name	VARCHAR(75),
Sex	CHAR(1),
Team	VARCHAR(75),
NOC	CHAR(4),
Year	INT,
Season	varchar(25),
City	VARCHAR(25),
Sport	VARCHAR(100),
Event	VARCHAR(255),
Medal VARCHAR(25) 
) ;
LOAD DATA LOCAL INFILE 'C:/Users/SAAAD/Downloads/olympics_dataset.csv' 
INTO TABLE Olympics
FIELDS TERMINATED BY ','
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES ;

-- 3. Creating The Table Medal_Summary
CREATE TABLE Medal_Summary (
edition_id INT,
games	VARCHAR(75),
year	INT,
season	CHAR(25),
noc	CHAR(4),
country	VARCHAR(75),
gold	INT,
silver	INT,
bronze	INT,
total INT );

SET GLOBAL LOCAL_infile = 1;
LOAD DATA LOCAL INFILE 'C:/Users/SAAAD/Downloads/medal_table_summary.bi.csv' 
INTO TABLE Medal_Summary
FIELDS TERMINATED BY ','
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES ;

-- Q1. Count distinct athletes
-- Objective: Determine the total number of athletes in the dataset.

SELECT
    COUNT(DISTINCT Name) AS Total_Athletes
FROM olympics;


-- Q2. Count represented National Olympic Committees
-- Objective: Measure the number of distinct NOCs represented.

SELECT
    COUNT(DISTINCT NOC) AS Total_NOCs
FROM olympics;


-- Q3. Count distinct sports
-- Objective: Determine the number of sports represented.

SELECT
    COUNT(DISTINCT Sport) AS Total_Sports
FROM olympics;


-- =========================================================
-- SECTION 2: ADVANCED GLOBAL ANALYSIS
-- Additional analytical queries follow below.
-- =========================================================

--Q1. -- Which sports saw the largest increase in the number of athletes between two consecutive editions?

WITH Total_Athletes AS ( SELECT Year,
Count(DISTINCT Name ) AS Athletes
FROM olympics
GROUP BY Year) ,
Prev_Athlete AS ( 
 SELECT Year,
        Athletes,
		   LAG(Athletes) OVER(ORDER BY Year ASC) AS Prev_Athlete
 FROM Total_Athletes 
 )
 SELECT Year,
        Athletes,
        Prev_Athlete,
		Athletes - Prev_Athlete AS Athlete_evolution ,
        ROUND((Athletes - Prev_Athlete)/Prev_Athlete *100,2 ) AS Athlete_evolution_Percentage
 FROM Prev_Athlete ;

--Q2. Which athletes have competed in the most Olympic Games, and how do they compare to the others?


WITH Athletes_Participation AS(
     SELECT Name,
            COUNT(DISTINCT Event) Total_Participations
FROM olympics 
GROUP BY Name 
)
SELECT *,
dense_rank() OVER(ORDER BY Total_Participations DESC)
 FROM Athletes_Participation ;
 
--Q3. Which sports have the highest proportion of women?

WITH Gender_Analysis AS (
    SELECT Year,
        Sport,
        SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END)
            AS women_count,
        COUNT(*) AS total_athletes,
        ROUND(
            100.0 * SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END)
            / NULLIF(COUNT(*), 0),
            2
        ) AS women_percentage
    FROM olympics
    GROUP BY Sport, Year
),
Ranking AS (
    SELECT
        Year,
        Sport,
        women_count,
        total_athletes,
        women_percentage,
        DENSE_RANK() OVER (partition by Year
            ORDER BY women_percentage DESC
        ) AS sport_rank
    FROM Gender_Analysis
)
SELECT Year,
    sport_rank,
    Sport,
    women_count,
    total_athletes,
    women_percentage
FROM Ranking
WHERE sport_rank <= 10
ORDER BY Year DESC ,Sport_rank ASC;

--Q4. Which countries have the best medal tallies by sport, and which countries dominate each discipline?
WITH Medal_Analysis AS (
       SELECT Noc,
       Sport,
       Sum(CASE WHEN Medal IN ('Gold','Silver','Bronze') THEN 1 
       ELSE 0 
       END 
       ) As Total_Medals
FROM Olympics
Group by NOC,Sport),
Noc_Rankings AS (
		SELECT Noc,
        Sport,
        Total_Medals,
        DENSE_RANK() OVER(Partition By Sport Order By Total_Medals DESC) AS Rank_of_Countries
        FROM Medal_Analysis
)
SELECT Noc,
        Sport,
        Total_Medals,
        Rank_of_Countries
FROM Noc_Rankings  
WHERE Rank_of_Countries =1
; 

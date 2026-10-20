# Data Dictionary

## 1. Project Overview

This project analyzes historical data from the **Summer Olympic Games**, focusing on global Olympic trends, Morocco's performance, and comparisons between Morocco, Algeria, Tunisia, and Egypt.

The analysis uses two complementary tables:
- `olympic`: athlete-level data, including participation, sports, events, and medal results.
- `medal_summary`: country-level medal statistics for each Olympic edition.

## 2. Table: `olympic`

**Purpose:** Analyze athlete participation, gender distribution, sports, events, and individual or team medal records.

| Variable | Description |
|---|---|
| `Player_Id` | Unique identifier assigned to a player or athlete. |
| `Name` | Athlete's name. |
| `sex` | Athlete's gender, as recorded in the dataset. |
| `Team` | Team or delegation name associated with the athlete. |
| `NOC` | National Olympic Committee code. |
| `Year` | Year of the Olympic edition. |
| `Season` | Olympic season. This project focuses only on Summer Games. |
| `City` | Host city of the Olympic edition. |
| `Sport` | Sport in which the athlete competed. |
| `Event` | Specific Olympic event in which the athlete competed. |
| `Medal` | Medal result: Gold, Silver, Bronze, or NA when no medal is recorded. |

## 3. Table: `medal_summary`

**Purpose:** Analyze country-level medal totals and compare national Olympic performance across Summer Olympic editions.

| Variable | Description |
|---|---|
| `edition_id` | Identifier for an Olympic edition. |
| `games` | Name or description of the Olympic edition. |
| `year` | Year of the Olympic edition. |
| `season` | Olympic season. The analysis includes Summer Games only. |
| `noc` | National Olympic Committee code. |
| `country` | Country name associated with the NOC. |
| `gold` | Number of gold medals. |
| `silver` | Number of silver medals. |
| `bronze` | Number of bronze medals. |
| `Total` | Total number of medals recorded for the country in that edition. |

## 4. Data Usage

- `medal_summary` is used for country-level medal totals, historical trends, and international comparisons.
- `olympic` is used for athlete participation, gender analysis, and sport- or event-level analysis.
- The two tables have different levels of detail. Their measures must be calculated according to the level of analysis required.
- The `NOC` field can be used to identify and compare national delegations across the two tables.

## 5. Data Quality Considerations

The medal_summary table is used for global medal statistics and country-level comparisons. The olympic table is used for athlete-level and sport-level analyses. Because team events may generate multiple athlete records for a single medal, medal counts calculated directly from olympic require appropriate deduplication and validation.

Sport-level analyses based on the olympic table must account for team events, where multiple athlete records may correspond to a single medal. Appropriate deduplication is required when calculating medal counts by sport.

Country-level medal totals and international comparisons are based on the medal_summary table, which provides aggregated medal statistics by country and Olympic edition.

## 6. Scope of the Analysis

The project focuses exclusively on the **Summer Olympic Games** and covers three main areas:

- **Global Analysis:** Historical trends in Olympic participation, sports, and medal results.
- **Morocco Analysis:** Morocco's Olympic participation and medal performance over time.
- **North African Comparison:** Comparative analysis of Morocco, Algeria, Tunisia, and Egypt.

## 7. Notes

The data dictionary describes the variables available in the source tables. All calculations and conclusions should be validated against the database before publication.

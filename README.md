# Olympic Games Data Analysis | SQL & Power BI

## Project Overview

This project analyzes historical Olympic Summer Games data From 1896 to 2024 using SQL and Microsoft Power BI. It explores Olympic participation, medal performance, and the evolution of Morocco's results compared with Algeria ,Tunisia and Egypt.

The goal is to transform raw data into meaningful insights through SQL queries, data analysis, and interactive visualizations.

## Project Objectives

- Analyze the historical evolution of the Olympic Summer Games.
- Explore Morocco's Olympic medal performance across editions.
- Compare Morocco, Algeria, Tunisia and Egypt using historical medal data.
- Identify sports contributing to each country's medal results.
- Build an interactive dashboard to communicate key findings.

## Tools & Technologies

- **SQL / MySQL Workbench:** Data exploration, aggregation, Subqueries, CTEs, and window functions.
- **Microsoft Power BI:** Interactive dashboards and data visualization.
- **DAX:** Measures and performance indicators.

## Dataset

The project uses two complementary tables:

- **`medal_summary`** — country-level medal statistics by Olympic edition.
- **`olympics`** — detailed athlete, sport, event, and medal records.

The two tables support different types of analysis. Official country-level medal totals are analyzed using the summary table, while Individual analyses concerning athletes and sports use the detailed table.

Special attention is given to duplicate medal counts in team events.

## Project Structure

The repository is organized into three analytical sections:

### 1. Global Olympic Analysis
Exploration of participation, sports, and medal trends across Olympic editions.

### 2. Morocco Analysis
Analysis of Morocco's medal evolution, sports performance, and athlete participation.

### 3. Morocco, Algeria, Tunisia & Egypt Comparison
Comparative analysis of medal performance, historical progression, and sports specialization.

## Dashboard

The Power BI dashboard contains three pages:

- **Global:** Overall Olympic trends and performance indicators.
- **Morocco:** Historical performance and medal distribution.
- **Morocco–Algeria–Tunisia-Egypt:** Comparative analysis of four North African countries.

Dashboard screenshots will be added to this repository.

## SQL Analysis

### SQL Analysis

The SQL analysis is organized into three parts:

- [Global Olympic Analysis](sql/01_global_analysis.sql) — General trends in Olympic participation, sports, and countries.
- [Morocco Analysis](sql/02_morocco_analysis.sql) — Morocco's Olympic performance and medal evolution.
- [North African Comparison](sql/03_north_africa_comparison.sql) — Comparison of Morocco, Algeria, Tunisia, and Egypt.

For column definitions and data details, see the [Data Dictionary](docs/data_dictionary.md).

## Key Findings

*Key findings will be added after validating the final SQL results and Power BI indicators.*

## Limitations

- Results depend on the coverage and structure of the source dataset.
- Athlete-level medal records may count multiple members of the same medal-winning team.
- Sport-level medal calculations require deduplication and validation.
- Comparisons should account for differences between the official medal summary and detailed athlete records.

## Author

**Saad Zouaki**  
Master's student in Economic Analysis and Modeling

**Areas of interest:** Economics,Data Analytics, Econometrics, SQL, and Power BI.

# 🏅 Olympic Games Data Analysis (1896–2024) | SQL & Power BI

## 📌 Project Overview

This project analyzes historical Olympic Summer Games data from 1896 to 2024 using SQL and Microsoft Power BI. It explores Olympic participation, medal performance, and the evolution of Morocco's results compared with Algeria, Tunisia, and Egypt.

The goal is to transform raw data into meaningful insights through SQL queries, data analysis, and interactive visualizations.

## 🎯 Project Objectives

- Analyze the historical evolution of the Olympic Summer Games.
- Explore Morocco's Olympic medal performance across editions.
- Compare Morocco, Algeria, Tunisia, and Egypt using historical medal data.
- Identify sports contributing to each country's medal results.
- Build an interactive dashboard to communicate key findings.

## 🛠️ Tools and Technologies

- **SQL / MySQL Workbench:** Data exploration, aggregation, subqueries, CTEs, and window functions.
- **Microsoft Power BI:** Interactive dashboards and data visualization.
- **DAX:** Measures and performance indicators.

## Dataset

The project uses two complementary tables:

- **`medal_summary`**: country-level medal statistics by Olympic edition.
- **`olympics`**: detailed athlete, sport, event, and medal records.

The two tables support different types of analysis. Official country-level medal totals are analyzed using the summary table, while individual analyses concerning athletes and sports use the detailed table.

Special attention is given to duplicate medal counts in team events.


## 🗄️ Data Sources

The dataset used in this project is available on Kaggle:

- **Summer Olympics Medals (1896–2024):** [View dataset on Kaggle](https://www.kaggle.com/datasets/stefanydeoliveira/summer-olympics-medals-1896-2024)

The dataset provides historical Olympic data used for the SQL analysis and Power BI dashboards.


## 📂 Repository Structure

```text
olympic-games-data-analysis/
│
├── README.md
├── Analysis_And_Results.md
├── data_dictionary.md
│
├── Data/
│   ├── medal_table_summary.csv
│   └── olympics_dataset1.xlsx
│
├── Images/
│   ├── Global_Analysis_Dashboard.png
│   ├── Maroc_Analysis.png
│   └── North_African_Comparison_Dahboard.png
│
└── SQL/
    ├── Global_Analysis.sql
    ├── Morocco_Analysis.sql
    └── North_Africa_Comparison.sql
```

## Project Structure

The analysis is organized into three sections:

### 1. Global Olympic Analysis
Exploration of participation, sports, and medal trends across Olympic editions.

### 2. Morocco Analysis
Analysis of Morocco's medal evolution, sports performance, and athlete participation.

### 3. Morocco, Algeria, Tunisia & Egypt Comparison
Comparative analysis of medal performance, historical progression, and sports specialization.

## 📊 Power BI Dashboards

The Power BI dashboard contains three pages:

- **Global:** Overall Olympic trends and performance indicators.[Global Dashboard](Images/Global_Analysis_Dashboard.png)
- **Morocco:** Morocco's medal evolution and sports performance.[Morocco Dashboard](Images/Maroc_Analysis.png)
- **Comparison:** Morocco, Algeria, Tunisia, and Egypt side by side.[North Africa Dashboard](Images/North_African_Comparison_Dahboard.png)

## 💻 SQL Analysis

The SQL analysis is organized into three parts:

- [Global Olympic Analysis](SQL/Global_Analysis.sql): General trends in Olympic participation, sports, and countries.
- [Morocco Analysis](SQL/Morocco_Analysis.sql): Morocco's Olympic performance and medal evolution.
- [North African Comparison](SQL/North_Africa_Comparison.sql): Comparison of Morocco, Algeria, Tunisia, and Egypt.

For column definitions and data details, see the [Data Dictionary](data_dictionary.md).

## 🔍 Key Findings

- **Olympic participation:** The dataset records 11,088 athletes in 2024, compared with 176 in 1896.
- **Morocco's performance:** Morocco recorded 523 athletes, participated in 33 sports, and won 26 medals: 8 gold, 5 silver, and 13 bronze.
- **Morocco's sporting specialization:** Athletics accounts for 21 of Morocco's 26 medals, approximately 80.8%.
- **North African comparison:** Egypt, Algeria, Morocco, and Tunisia show different sporting specializations. Egypt's current medal summary reports 39 medals, with two retrospectively awarded medals associated with Abeer Abdelrahman requiring reconciliation with the dataset.
- **Women's contribution in Morocco:** The current analysis attributes 4 of Morocco's 26 medals to women and 22 to men.

For the detailed results, tables, interpretations, and methodological limitations, see **[Analysis and Results](Analysis_And_Results.md)**.


## Limitations

- Results depend on the coverage and structure of the source dataset.
- Athlete-level medal records may count multiple members of the same medal-winning team.
- Comparisons should account for differences between the official medal summary and detailed athlete records.

- 
## 🤝 Contributions

Contributions are welcome! If you have ideas, suggestions, or improvements, feel free to open an issue or submit a pull request. Let’s collaborate to make this project even better.


## Author

**Saad Zouaki**
Master's student in Economic Analysis and Modeling 

**Areas of interest:** Economics, Data Analytics, Econometrics, Python, Excel, SQL, and Power BI.

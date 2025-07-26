# Car Data Analysis

This repository contains an end-to-end analysis and exploration of an automotive dataset using both **Python (Jupyter Notebook)** and **SQL**. The dataset is from India and the date range is from 2015 to 2024. The goal is to provide useful business insights for car pricing, technical specifications, fuel efficiency, maintenance cost, and more ― using advanced data analysis and querying approaches.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
- [Files in this Repository](#files-in-this-repository)
- [Key Analysis Performed](#key-analysis-performed)
- [How to Use](#how-to-use)
- [License](#license)

---

## Overview

A comprehensive analysis of car features, pricing and performance.  
- Explore, visualize, and aggregate car data using Pandas/SQL.
- Compare brands, fuel types, transmissions, and more to extract actionable insights.
- Identify trends in car pricing, service costs, best/worst performers (by various factors).

---

## Features

- Data Exploration: Missing values, data types, and anomalies
- Summary statistics, averages, brand & fuel segmentations
- Year-on-year price changes and top/least expensive models
- Outlier analysis and percentile rankings
- Visualizations (in Notebook)
- Both SQL queries and pandas code for reproducibility

---

## Files in this Repository

| File                                    | Description                                |
|-----------------------------------------|--------------------------------------------|
| `Cars_Data_Analysis.ipynb`              | Jupyter Notebook for EDA & visualization   |
| `Cars_Data_Analysis.sql`                | All main SQL queries for car dataset       |
| `Cars.csv`                              | Source data file                           |

---

## Key Analysis Performed

-  **Total number of cars** and **brands** in the dataset  
-  Average car price, mileage, engine capacity, and service cost  
-  Fuel type, transmission (automatic/manual) 
-  Which brands are most/least expensive, best mileage, etc.  
-  YOY average price change for every brand  
-  Top 3 expensive & least expensive models for every brand  
-  Brands with the highest/lowest service cost  
-  Visualizations for trends & distribution (see notebook)

See SQL file (`Cars_Data_Analysis.sql`) for full query list.

---

## Key Visualization Performed (jupyter Notebook)
- Count of Cars by Fuel Type
  <img width="564" height="361" alt="image" src="https://github.com/user-attachments/assets/d6ecb440-da27-4d12-8a8c-f07974c62607" />

- Brands with Avg Price
  <img width="622" height="361" alt="image" src="https://github.com/user-attachments/assets/a59296ae-7903-4b5b-a4fa-8749b3ad4979" />

- Best Fuel Type by Avg Mileage
  <img width="636" height="372" alt="image" src="https://github.com/user-attachments/assets/804f1849-e0c2-4975-9109-24130609f08e" />

- Average Price per Brand for Diesel Cars
  <img width="629" height="366" alt="image" src="https://github.com/user-attachments/assets/4bb0cad8-7694-47fa-ade7-1f19c05c80ca" />

- Total No of Automatic and Manual Cars by Brand
  <img width="731" height="412" alt="image" src="https://github.com/user-attachments/assets/91262574-3d6d-4b74-b09b-b9d4278d9ac4" />

- Top Brands by Price per CC
  <img width="788" height="357" alt="image" src="https://github.com/user-attachments/assets/f6acbfd4-fdd7-4f4b-8599-01705aa9c9da" />

- Brand Performance Percentile by Service Cost
  <img width="782" height="383" alt="image" src="https://github.com/user-attachments/assets/c26eb4b6-6ece-4ed6-9470-87753fc26424" />

- Outlier Cars within the Brand
  <img width="865" height="383" alt="image" src="https://github.com/user-attachments/assets/b9133cc3-9964-41ae-b245-97c0dde0253d" />

- Brands Where Average Price Increased Consistently
  <img width="861" height="398" alt="image" src="https://github.com/user-attachments/assets/c66330f5-3688-43f1-9933-841e8fc0d201" />

  ---
## Key Insights
- **Brands vary widely in service cost**: Some brands are much more economical to maintain than others.

- **Clear segmentation**: Quartiles categorize brands into budget-friendly, moderate, or expensive-to-maintain groups.

- **Fuel type matters**: Petrol cars are most popular, influencing both pricing and market focus.

- **Transmission trends**: Some brands offer more automatics, appealing to city buyers; others focus on manuals.

- **Brands differ in price per CC**: Reveals which brands are premium or value-oriented.

- **Yearly price trends show strategy**: Some brands steadily increase prices, others stay stable.

- **Outlier prices**: Certain high-priced models stand out; often special editions.

- **Mileage analysis**: Highlights efficient brands/fuel types for cost-conscious buyers.





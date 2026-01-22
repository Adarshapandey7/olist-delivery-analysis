# Improving Delivery Efficiency and Reducing Delays in Brazilian E-commerce Using Olist Data

## Project Overview
This project analyzes the Brazilian e-commerce logistics ecosystem using the **Olist Public Dataset** to identify factors that contribute to delivery inefficiencies, high freight costs, and customer dissatisfaction. The goal is to provide **data-driven insights** and **recommendations** to improve delivery efficiency and customer satisfaction.

The analysis covers over **100,000 orders** from 2016 to 2018 and incorporates **descriptive, predictive, and prescriptive analytics**, as well as interactive visualizations in **Tableau**.

## Problem Statement
The Brazilian e-commerce market faces logistical challenges including:
- High transportation costs  
- Geographical barriers  
- Uneven infrastructure development  

These issues result in **delivery delays**, **customer dissatisfaction**, and reduced **operational efficiency**. This project explores the impact of factors such as **region, freight cost, product characteristics, and distance** on delivery performance.

## Data
- Source: [Olist Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  
- Data includes:
  - Orders and payments
  - Deliveries and logistics performance
  - Customer reviews
  - Product characteristics  

- Tools used for data preparation:
  - PostgreSQL (data cleaning, merging datasets, standardizing timestamps)
  - Excel (descriptive and predictive analytics)
  - Tableau Public (data visualization)

## Project Steps

### 1. Data Preparation and Cleaning
- Imported **9 CSV files** into PostgreSQL  
- Removed errors, missing values, and unnecessary columns  
- Standardized timestamps into datetime format  
- Joined multiple tables to create a **comprehensive dataset**  
- Exported cleaned dataset as CSV for further analysis  

### 2. Descriptive Analytics
- Used **Excel Pivot Tables** to analyze delivery patterns  
- Key findings:
  - Northern and Northeastern states (e.g., Alagoas, Maranhão) had late-delivery rates >20%  
  - Customer review scores decreased as delivery delays increased  
  - Freight costs were highest in remote/infrastructure-poor states  
  - Larger products (e.g., furniture) had longer delivery times  

### 3. Predictive Analytics
- Performed **regression and correlation analysis** in Excel  
- Key predictors of delivery delays:
  - Delivery distance  
  - Freight value  
  - Product size (length, height)  
  - Payment installments  
  - Estimated delivery days  
- Regression model explained **43.9% of variation in delays**, indicating meaningful predictive relationships  

### 4. Prescriptive Analytics
- Conducted **Excel What-If modeling** to evaluate operational improvements  
- Key recommendations:
  - Expand regional warehouse networks to reduce delivery times  
  - Promote same-state fulfillment where possible  
  - Partner with local delivery carriers  
  - Improve payment processing speed and update delivery forecast models  

### 5. Data Visualization
- Created interactive visualizations and a **dashboard in Tableau Public** to:
  - Highlight regional delivery delays  
  - Show correlation between delays and customer satisfaction  
  - Compare freight costs across states  
  - Visualize delivery time differences by product category and state  

Tableau Dashboard: [Insert your Tableau Public link here]

## Repository Contents
SQL_Cleaning_and_Analysis.ipynb # PostgreSQL data preparation and SQL analysis
Olist_Cleaned_Dataset.csv # Cleaned dataset used for analysis
Excel_Analytics.xlsx # Descriptive and predictive analysis
Tableau_Visualizations.twbx # Tableau workbook
README.md # Project documentation

## Skills & Tools Demonstrated
- **Data Cleaning & Preparation:** PostgreSQL, SQL, Excel  
- **Data Analysis:** Descriptive, Predictive, Prescriptive Analytics  
- **Data Visualization:** Tableau Public  
- **Analytical Techniques:** Pivot Tables, Regression, Correlation, What-If Scenarios  

## Key Insights
- Delivery performance varies significantly by region; Northern and Northeastern states face the worst delays  
- Delivery delays are strongly linked to decreased customer satisfaction  
- Freight value and product size are important predictors of late deliveries  
- Promoting same-state fulfillment and expanding regional warehouses can reduce delays and improve customer satisfaction  

## References
1. [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  
2. Tolve, V. (2025, Feb 25). *Brazil e-commerce: Too risky for my business?* Nocnoc.  
3. Freixa, A., & Albuquerque, G. (2024, Jan 30). *The Transportation and Logistics Challenges in Northern Brazil.* ALG.  
4. [Brazil - Digital Economy](https://www.trade.gov/country-commercial-guides/brazil-digital-economy)

---

This project demonstrates the **end-to-end process of data analytics**, from data cleaning and descriptive analysis to predictive modeling, prescriptive recommendations, and visualization.

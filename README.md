# 📊 Adventure Works Sales Analytics | End-to-End Data Analytics Project

## 📌 Project Overview

This project demonstrates an end-to-end Sales Analytics solution built using **Excel, Python, MySQL, Power BI, and GitHub**. The objective was to transform raw sales data into meaningful business insights by following a complete data analytics workflow—from data cleaning and SQL analysis to interactive dashboard development.

The project analyzes over **56,000 sales transactions**, **17,000 customers**, and **293 products** to answer key business questions related to revenue, customer behavior, product performance, profitability, and returns.

---

# 🎯 Business Objectives

This project answers the following business questions:

- How has revenue changed over time?
- Which countries generate the highest revenue and profit?
- Which customer segments contribute the most revenue?
- Which products are the best and worst performers?
- Which product categories drive business growth?
- Which products have the highest return rate?
- How profitable is the business overall?
- What actionable insights can improve business performance?

---

# 🛠 Tech Stack

| Tool | Purpose |
|------|----------|
| Microsoft Excel | Raw Data Source |
| Python (Pandas) | Data Cleaning & Feature Engineering |
| MySQL | Data Storage & SQL Analysis |
| Power BI | Interactive Dashboard Development |
| Git & GitHub | Version Control & Project Portfolio |

---

# 📂 Project Workflow

```
Raw Excel Data
        │
        ▼
Python Data Cleaning
        │
        ▼
Feature Engineering
        │
        ▼
MySQL Database
        │
        ▼
SQL Business Analysis
        │
        ▼
Power BI Dashboard
        │
        ▼
Business Insights & Recommendations
```

---

# 📊 Dataset Overview

The project uses the Adventure Works Sales dataset consisting of:

| Table | Records |
|---------|---------:|
| Sales | 56,046 |
| Customers | 18,148 |
| Products | 293 |
| Product Subcategories | 37 |
| Product Categories | 4 |
| Territories | 10 |
| Returns | 1,809 |
| Calendar | 912 |

---

# 🗄 Database Schema

The project follows a **Star Schema** consisting of:

- Fact Sales
- Fact Returns
- Customer Dimension
- Product Dimension
- Product Category
- Product Subcategory
- Territory Dimension
- Calendar Dimension

This model enables efficient reporting and analytical querying.

---

# 🐍 Python Workflow

Python was used for:

- Importing multi-sheet Excel workbook
- Data validation
- Handling missing values
- Data type conversion
- Feature engineering
- Customer segmentation
- Revenue analysis
- Product analysis
- Profitability analysis
- Exploratory Data Analysis (EDA)

---

# 💾 SQL Analysis

SQL scripts were written to perform:

- Database creation
- Table creation
- Data loading
- Sales Master table creation
- KPI Analysis
- Customer Analytics
- Product Analytics
- Profitability Analysis
- Return Analysis

Key SQL concepts demonstrated:

- INNER JOIN
- LEFT JOIN
- GROUP BY
- Aggregate Functions
- CASE Statements
- Common Table Expressions (CTEs)
- Views
- Window Functions (where applicable)

---

# 📈 Power BI Dashboard

The dashboard consists of **4 interactive pages**.

---

## 📌 Page 1 – Executive Overview

Provides a high-level business summary.

KPIs Included:

- Revenue
- Profit
- Total Orders
- Units Sold
- Customers

Visualizations:

- Revenue Trend
- Revenue by Country
- Revenue by Category

### Executive Insights

- Total revenue reached **$24.91M** across **25K orders** and **17K customers**.
- Revenue increased from **$6.4M (2015)** to **$9.3M (2016)** before stabilizing in **2017**.
- United States and Australia contributed over **60% of total revenue**.
- Bikes generated nearly **95% of total revenue**.

---

## 👥 Page 2 – Customer Analytics

Analyzes customer demographics and purchasing behavior.

Visualizations:

- Revenue by Occupation
- Revenue by Income Group
- Revenue by Gender
- Revenue by Age Group
- Revenue per Customer
- Top Customers

### Customer Insights

- Professional customers generated the highest revenue.
- Customers aged **56–65** contributed the largest revenue share.
- Medium-income customers generated the highest sales.
- Revenue distribution between male and female customers was nearly balanced.

---

## 🚴 Page 3 – Product Analytics

Analyzes product performance.

Visualizations:

- Top Revenue Products
- Revenue by Category
- Revenue by Subcategory
- Revenue Contribution %
- Revenue vs Quantity
- Product Performance Table

### Product Insights

- Bikes contributed approximately **95% of total revenue**.
- Road Bikes generated the highest revenue among all subcategories.
- Accessories sold the highest number of units.
- Mountain-200 series products were the top revenue generators.

---

## 💰 Page 4 – Profitability & Returns

Analyzes profitability and product returns.

Visualizations:

- Profit by Country
- Profit by Occupation
- Profit by Category
- Top Returned Products
- Return Rate Analysis
- Return Heatmap

### Profitability Insights

- Bikes generated over **94% of total profit**.
- United States contributed the highest profit.
- Professional customers generated the highest profit.
- Water Bottle – 30 oz. recorded the highest number of returns.
- Overall return rate remained approximately **2.17%**, indicating healthy product performance.

---

# 📌 Key Business Insights

✔ Total Revenue: **$24.91 Million**

✔ Total Profit: **$7.81 Million**

✔ Profit Margin: **31%**

✔ Total Orders: **25K**

✔ Customers: **17K**

✔ Units Sold: **84K**

✔ Return Rate: **2.17%**

Key Findings:

- Revenue is highly concentrated in the Bikes category.
- Professional customers are the most valuable customer segment.
- United States is the strongest performing market.
- Accessories generate high sales volume but relatively low revenue.
- Mountain-200 series products dominate overall revenue.
- Return rates remain low, indicating strong product quality.

---

# 📁 Repository Structure

```
AdventureWorks-Sales-Analytics/
│
├── data/
├── notebooks/
├── sql/
├── powerbi/
├── screenshots/
├── README.md
└── requirements.txt
```

---

# 🚀 Skills Demonstrated

### Data Cleaning

- Data Validation
- Missing Value Handling
- Feature Engineering
- Data Transformation

### SQL

- Joins
- Aggregations
- Window Functions
- CTEs
- Views
- Business Queries

### Python

- Pandas
- NumPy
- Exploratory Data Analysis
- Business Insights

### Power BI

- Star Schema Modeling
- DAX Measures
- Interactive Dashboards
- KPI Cards
- Drill-down Analysis
- Slicers
- Heatmaps
- Treemaps
- Scatter Plots

---

# 📌 Future Enhancements

- Automated data refresh using Power BI Service
- Sales forecasting using Machine Learning
- Customer Segmentation using Clustering
- Predictive Analytics for Returns
- AI-generated business insights using Python/OpenAI API

---

# 👨‍💻 Author

**Mahima Shukla**

If you found this project helpful or interesting, feel free to ⭐ the repository.

Connect with me on LinkedIn and GitHub to explore more Data Analytics projects.

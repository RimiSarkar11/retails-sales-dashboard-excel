# 🛒 Retail Sales Dashboard (Excel + SQL + Python)

## 📌 Project Overview
This project analyzes an Online Retail dataset and builds an interactive Excel dashboard after performing structured data cleaning and transformation using SQL and Python.

The workflow follows a complete data analysis pipeline:
1. Database setup and transformation using MySQL
2. Data cleaning and validation using Python (Pandas)
3. Interactive dashboard creation using Excel Pivot Tables and Slicers

---

## 🗂 Dataset
- Online Retail transactional dataset
- Columns include:
  - InvoiceNo
  - StockCode
  - Description
  - Quantity
  - InvoiceDate
  - UnitPrice
  - CustomerID
  - Country

---

## 🛠 Step 1: SQL – Database Setup & Transformation

- Created `retail_analysis` database
- Created structured `retail` table with appropriate data types
- Loaded dataset using `LOAD DATA INFILE`
- Engineered new columns:
  - Revenue = Quantity × UnitPrice
  - Month
  - Year
  - MonthName

Purpose:
Prepare structured and enriched dataset for further analysis.

File:
`retail_analysis_setup.sql`

---

## 🐍 Step 2: Python – Data Cleaning & Validation

Performed cleaning using Pandas in Jupyter Notebook:

- Removed cancelled invoices
- Removed null CustomerID values
- Filtered negative quantities
- Checked for duplicates
- Validated row counts and data consistency

File:
`onlineRetailAnalysis.ipynb`

---

## 📊 Step 3: Excel – Interactive Dashboard

Built an interactive dashboard using:

- Pivot Tables
- Pivot Charts
- Slicers (Year)
- KPI Cards:
  - Total Revenue
  - Total Orders
  - Total Customers
- Monthly Revenue Trend
- Revenue by Country

Features:
- Dynamic filtering by year
- Automatically updating KPIs
- Top performing countries visualization

File:
`RetailDashboard_Portfolio.xlsx`

---

## 🎯 Key Skills Demonstrated

- SQL (Database design & data transformation)
- Python (Data cleaning & validation)
- Excel (Pivot Tables, Slicers, Dashboard design)
- Data modeling workflow
- End-to-end analytics pipeline

---

## 🚀 Outcome

Developed a complete retail sales analysis pipeline from raw transactional data to an interactive business dashboard.

This project demonstrates practical data analyst workflow and multi-tool integration.

## 📁 Dataset
Online Retail dataset (2010–2011)

## 🎯 Objective
To analyze retail sales performance and build an interactive business dashboard for insights.

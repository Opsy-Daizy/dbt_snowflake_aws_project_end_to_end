# 🏠 Airbnb Data Engineering Pipeline

![AWS](https://img.shields.io/badge/AWS-S3-orange)
![Snowflake](https://img.shields.io/badge/Snowflake-Data%20Warehouse-blue)
![dbt](https://img.shields.io/badge/dbt-Transformation-orange)
![Python](https://img.shields.io/badge/Python-3.12-blue)
![Status](https://img.shields.io/badge/Status-Production--Style-success)

---

## 📌 Overview

This project demonstrates a **production-style data engineering pipeline** built using **AWS, Snowflake, and dbt** to process Airbnb data from raw ingestion to analytics-ready datasets.

The pipeline is designed with scalability and maintainability in mind, leveraging a **medallion architecture (Bronze → Silver → Gold)** to progressively refine data for business use.

---

## 🏗️ Architecture

### 🔄 Data Flow


### 🧱 Layer Responsibilities

| Layer   | Purpose |
|--------|--------|
| Bronze | Raw ingestion with minimal transformation |
| Silver | Data cleaning, validation, and standardization |
| Gold   | Business-ready models optimized for analytics |

---

## 🧰 Tech Stack

| Category | Tools |
|--------|------|
| Cloud Storage | AWS S3 |
| Data Warehouse | Snowflake |
| Transformation | dbt |
| Language | Python 3.12 |
| Version Control | Git |

---

## ⚙️ Key Features

- 🔁 **Incremental Processing** for scalable data pipelines  
- 🕒 **SCD Type 2 Snapshots** for historical tracking  
- 🧩 **Modular dbt Models** for maintainability  
- 🔄 **Reusable Macros** for dynamic transformations  
- ✅ **Data Quality Tests** for reliability  
- 📊 **Analytics-Ready Tables** for reporting  

---

## 📊 Data Modeling

### 🥉 Bronze Layer (Raw)

- `bronze_bookings`
- `bronze_hosts`
- `bronze_listings`

Stores raw source data with minimal processing.

---

### 🥈 Silver Layer (Refined)

- `silver_bookings`
- `silver_hosts`
- `silver_listings`

Applies:
- Data cleansing  
- Standardization  
- Business rules  

---

### 🥇 Gold Layer (Analytics)

- `fact`
- `obt` (One Big Table)

Optimized for BI tools and reporting.

---

## ⏳ Historical Data Tracking

This project uses **dbt snapshots** to implement **Slowly Changing Dimensions (SCD Type 2)**.

Tracked entities:
- Hosts  
- Listings  
- Bookings  

Enables:
- Point-in-time analysis  
- Historical trend analysis  
- Auditability of changes  

---

## 🚀 Getting Started

### 1️⃣ Set Up Environment

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

```

## 2️⃣ Configure dbt Profile

Create a file at:

~/.dbt/profiles.yml


Add your Snowflake credentials (do not commit this file).

---

## 3️⃣ Load Data

Upload Airbnb CSV files into Snowflake staging tables.

---

## 4️⃣ Run Pipeline

```bash
dbt debug
dbt run
dbt test
dbt snapshot
```

## 📈 What This Project Demonstrates
- End-to-end data pipeline design
- Medallion architecture implementation
- Incremental processing at scale
- Historical tracking with SCD Type 2
- Production-style dbt structure
- Strong data modeling practices

## 👤 Author

Opeyemi Ijidakinro

Data Engineering Portfolio Project

Tech Stack: AWS · Snowflake · dbt · Python

## ⭐ Acknowledgment

This project was inspired by publicly available data engineering workflows.
Enhancements were made to improve structure, scalability, and production readiness.

# aws_dbt_snowflake_project


🏠 **Airbnb End-to-End Data Engineering Pipeline**

---

## 📌 Overview

This project demonstrates an **end-to-end data engineering pipeline** built using **AWS, Snowflake, and dbt**.  
The goal is to ingest raw Airbnb data, apply scalable transformations using a **medallion architecture**, and produce **analytics-ready datasets** for reporting and insights.

The pipeline supports:
- Incremental data loading  
- Historical tracking using **Slowly Changing Dimensions (SCD Type 2)**  
- Industry-standard data engineering best practices  

---

## 🏗️ Architecture

### Data Flow

CSV Files → AWS S3 → Snowflake Staging → Bronze → Silver → Gold

### Layer Responsibilities

- **Bronze** → Raw ingested data  
- **Silver** → Cleaned & standardized data  
- **Gold** → Business-ready analytics tables  

---

## 🧰 Technology Stack

- **Cloud Storage**: AWS S3  
- **Data Warehouse**: Snowflake  
- **Transformation Tool**: dbt  
- **Programming Language**: Python 3.12  
- **Version Control**: Git  

### Key dbt Features Used

- Incremental models  
- Snapshots (SCD Type 2)  
- Jinja templating  
- Custom macros  
- Tests & documentation  

---

## 📊 Data Modeling

### 🥉 Bronze Layer (Raw)

Tables:
- `bronze_bookings`
- `bronze_hosts`
- `bronze_listings`

Minimal transformations are applied. Data is stored as received from the source.

---

### 🥈 Silver Layer (Cleaned)

Key transformations:
- Data validation  
- Standardized formats  
- Business logic (price bucketing, quality checks)  

Tables:
- `silver_bookings`
- `silver_hosts`
- `silver_listings`

---

### 🥇 Gold Layer (Analytics)

Optimized for reporting and BI consumption.

Tables:
- `fact`
- `obt` (One Big Table)

---

## ⏳ Slowly Changing Dimensions (SCD Type 2)

Snapshots are used to track historical changes for:
- Hosts  
- Listings  
- Bookings  

This enables **point-in-time analysis** and preserves historical records automatically using **dbt snapshots**.


---

## 🚀 How to Run the Project

### 1️⃣ Setup Python Environment

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### 2️⃣ Configure Snowflake

Create `~/.dbt/profiles.yml` with your Snowflake credentials.

---

### 3️⃣ Load Source Data

Upload CSV files into Snowflake staging tables.

---

### 4️⃣ Run dbt Commands

```bash
dbt debug
dbt run
dbt test
dbt snapshot

```


## ⭐ Key Features & Learnings

- Designed a **medallion architecture** in Snowflake
- Implemented **incremental loading** for scalable pipelines
- Used **dbt snapshots** for SCD Type 2 tracking
- Built **reusable custom dbt macros**
- Applied **data quality tests and documentation**
- Followed **production-style folder and model structure**

---

## 🔐 Best Practices Followed

- No credentials committed to Git
- Layer-wise schema separation
- Incremental processing for performance
- Modular and reusable SQL models

---

## 👤 Author

**Eswar Kandula**  
Data Engineering Portfolio Project  

**Technologies**: AWS, Snowflake, dbt, Python




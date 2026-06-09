# Airbnb Data Pipeline Diagram

## High-Level Architecture

```mermaid
flowchart LR
    csv["Airbnb CSV files"] --> s3["AWS S3 raw data bucket"]
    s3 --> stage["Snowflake staging schema<br/>AIRBNB.STAGING"]

    stage --> bronze["Bronze layer<br/>raw incremental dbt models"]
    bronze --> silver["Silver layer<br/>cleaned and standardized models"]
    silver --> gold["Gold layer<br/>analytics-ready models"]

    gold --> bi["BI / reporting / analysis"]

    dbt["dbt Core"] -. orchestrates .-> bronze
    dbt -. orchestrates .-> silver
    dbt -. orchestrates .-> gold
    dbt -. runs .-> tests["dbt tests"]
    dbt -. runs .-> snapshots["dbt snapshots<br/>SCD Type 2 history"]
```

## dbt Model Lineage

```mermaid
flowchart TD
    subgraph source["Snowflake source: AIRBNB.STAGING"]
        src_bookings["source('staging', 'bookings')"]
        src_listings["source('staging', 'listings')"]
        src_hosts["source('staging', 'hosts')"]
    end

    subgraph bronze["Bronze schema"]
        bronze_bookings["bronze_bookings<br/>incremental"]
        bronze_listings["bronze_listings<br/>incremental"]
        bronze_hosts["bronze_hosts<br/>incremental"]
    end

    subgraph silver["Silver schema"]
        silver_bookings["silver_bookings<br/>booking totals"]
        silver_listings["silver_listings<br/>price tags and listing fields"]
        silver_hosts["silver_hosts<br/>host standardization and response quality"]
    end

    subgraph gold["Gold schema"]
        obt["obt<br/>one big table"]
        fact["fact<br/>analytics fact table"]
        eph_bookings["bookings<br/>ephemeral"]
        eph_listings["listings<br/>ephemeral"]
        eph_hosts["hosts<br/>ephemeral"]
        dim_bookings["dim_bookings<br/>snapshot / SCD Type 2"]
        dim_listings["dim_listings<br/>snapshot / SCD Type 2"]
        dim_hosts["dim_hosts<br/>snapshot / SCD Type 2"]
    end

    src_bookings --> bronze_bookings --> silver_bookings
    src_listings --> bronze_listings --> silver_listings
    src_hosts --> bronze_hosts --> silver_hosts

    silver_bookings --> obt
    silver_listings --> obt
    silver_hosts --> obt

    obt --> eph_bookings --> dim_bookings
    obt --> eph_listings --> dim_listings
    obt --> eph_hosts --> dim_hosts

    obt --> fact
    dim_listings --> fact
    dim_hosts --> fact
```

## Layer Responsibilities

| Layer | Objects | Purpose |
| --- | --- | --- |
| Source | `AIRBNB.STAGING.bookings`, `listings`, `hosts` | Landing tables loaded from CSV files after S3/Snowflake ingestion. |
| Bronze | `bronze_bookings`, `bronze_listings`, `bronze_hosts` | Raw incremental copies from the staging source tables using `created_at` filters. |
| Silver | `silver_bookings`, `silver_listings`, `silver_hosts` | Cleaned and enriched tables, including booking totals, listing price tags, host name standardization, and response-rate quality. |
| Gold | `obt`, `fact` | Reporting-ready outputs. `obt` joins bookings, listings, and hosts. `fact` selects analytics columns from the OBT and joins snapshot dimensions. |
| Snapshots | `dim_bookings`, `dim_listings`, `dim_hosts` | SCD Type 2 history using timestamp strategy and `dbt_valid_to_current`. |
| Tests | `source_test.sql` | Warns when staging booking amounts are below the defined threshold. |

## Suggested Presentation Diagram

```mermaid
flowchart LR
    A["CSV files"] --> B["AWS S3"]
    B --> C["Snowflake staging<br/>bookings, listings, hosts"]
    C --> D["dbt Bronze<br/>incremental raw tables"]
    D --> E["dbt Silver<br/>cleaned + business logic"]
    E --> F["dbt Gold OBT<br/>joined analytics table"]
    F --> G["Snapshots<br/>SCD Type 2 dimensions"]
    F --> H["Fact table"]
    G --> H
    H --> I["Dashboards / analytics"]
```


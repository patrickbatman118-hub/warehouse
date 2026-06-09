# SQL Data Warehouse for Retail Sales Analytics

## Overview

A production-style SQL Data Warehouse built using Microsoft SQL Server and T-SQL to support analytical reporting and business intelligence workflows. The project implements ETL pipelines, dimensional modeling, and a layered Medallion Architecture to transform raw transactional data into business-ready insights.

## Objectives

* Design a scalable data warehouse architecture
* Implement end-to-end ETL workflows
* Build dimensional models for analytical reporting
* Improve data quality through validation and cleansing
* Enable efficient business intelligence queries

## Tech Stack

* Microsoft SQL Server
* T-SQL
* SQL Server Management Studio (SSMS)
* Git
* Draw.io

## Architecture

The warehouse follows a Medallion Architecture:

### Bronze Layer

* Raw data ingestion
* Source system replication
* Initial validation checks

### Silver Layer

* Data cleansing
* Standardization
* Business rule validation
* Data transformation

### Gold Layer

* Analytics-ready datasets
* Star Schema implementation
* Business intelligence reporting layer

## Data Model

### Fact Tables

* FactSales

### Dimension Tables

* DimCustomer
* DimProduct
* DimStore
* DimDate

The Gold Layer uses a Star Schema to optimize analytical query performance and reporting.

## ETL Workflow

### Extract

* Load raw datasets into staging tables

### Transform

* Handle missing values
* Remove duplicates
* Standardize formats
* Validate business rules

### Load

* Populate fact and dimension tables
* Maintain referential integrity

## Key Features

* End-to-end ETL pipeline implementation
* Star Schema dimensional modeling
* Multi-layer data validation
* Structured warehouse architecture
* Query optimization for analytics
* Comprehensive project documentation

## Skills Demonstrated

* Data Warehousing
* ETL Pipeline Development
* T-SQL Programming
* Database Design
* Dimensional Modeling
* Star Schema Design
* Data Quality Engineering
* Business Intelligence Concepts
* Microsoft SQL Server

## Learning Outcomes

This project provided hands-on experience in designing and implementing enterprise-style data warehouses, developing ETL pipelines, applying dimensional modeling techniques, and building analytics-ready data systems using SQL Server.

## Project Status

Completed

# Customer Segmentation for a Subscription Service

## Table of Contents
1. [Project Overview](#project-overview)
2. [Tools Used](#tools-used)
3. [Dataset Description](#dataset-description)
4. [Steps Undertaken](#steps-undertaken)
   - [Data Preparation](#data-preparation)
   - [Excel Analysis](#excel-analysis)
   - [SQL Analysis](#sql-analysis)
   - [Power BI Dashboard](#power-bi-dashboard)
5. [Key Insights](#key-insights)
6. [Acknowledgements](#acknowledgements)

## Project Overview
This project analyzes customer data for a subscription service to identify segments and trends. The goal is to understand customer behaviour, track subscription types, and highlight trends in cancellations and renewals. The final deliverable is a Power BI dashboard that visualizes these insights.

## Tools Used
- **Excel**: For data analysis and reporting.
- **SQL Server**: To query and extract insights from the dataset.
- **Power BI**: To create an interactive dashboard.

## Dataset Description
- **Source**: Excel sheet.
- **Description**: The sheet contains customer data with column headers namely CustomerID, CustomerName, Region,	SubscriptionType,	SubscriptionStart,	SubscriptionEnd, Subscription Status, and	Revenue. There are 75000 rows of data.

## Steps Undertaken

### Data Preparation
- **Loaded Data**: Imported the dataset into Excel and SQL Server.
- **Data Cleaning**: Checked for missing values and performed necessary data cleaning.

### Excel Analysis
- **Initial Exploration**: Performed an initial exploration of the customer data.
![Excel Customer](https://github.com/user-attachments/assets/9696af28-68eb-47c7-b7dc-3207412212ec)
- **Calculations**: 
  - Subscription duration (days).
 - **Code/Formula**: 
  ```excel
  =SubscriptionStart-SubscriptionEnd
 ```
- **Pivot Tables**: Created pivot tables to analyze subscription patterns.
![Excel Analysis Customer](https://github.com/user-attachments/assets/204c3462-2f13-44c1-8d07-075251bc8678)

### SQL Analysis
- **Setup**: Loaded the dataset into SQL Server.
- **Queries Executed**: 
  - Total number of customers from each region.
  - Most popular subscription type by the number of customers.
  - Customers who cancelled their subscription within 6 months.
  - Average subscription duration for all customers.
  - Customers with subscriptions longer than 12 months.
  - Total revenue by subscription type.
  - Top 3 regions by subscription cancellations.
  - Total number of active and cancelled subscriptions.
- **Code example**: Total number of customers from each region.
  ```sql
  select Region, COUNT(CustomerID) as Total_Customers_Region from Customer Data group by Region
  ```
![SQL C 1](https://github.com/user-attachments/assets/89157f17-4f35-4be3-a20f-66bda5a54fbd)
![SQL C 2](https://github.com/user-attachments/assets/d8f1786f-eec2-41e3-b702-27758f7b10ae)

### Power BI Dashboard
- **Dashboard Creation**: Developed an interactive dashboard visualizing key customer segments and trends.
- **Features**:
- A revenue bin measure was created using groups to capture revenue in ranges.
  ![Revenue bin](https://github.com/user-attachments/assets/cd7c0588-9aac-4356-aa09-4b3d4adcf829)
  - Using the DAX function below, this revenue measure was then used to create a revenue bin column to assign the ranges as "Low", "Medium" and "High".
 ``` DAX
Revenue Bin = 
SWITCH(
    TRUE(),
    'CustomerData'[Revenue] <= 1667, "Low",
    'CustomerData'[Revenue] <= 2333, "Medium",
    'CustomerData'[Revenue] > 2333, "High"
)
 ```   
  - The dashboard included key customer segments, cancellations, and subscription trends.
  - A subscription start (year) slicer was used for the dashboard.
![Power BI CSA](https://github.com/user-attachments/assets/fa7262dc-d9a8-42fd-a702-0de9d0fd57ac)

## Key Insights
  - Approximately $150M was generated in revenue from 75,000 customers.
  - 33,750 customers cancelled their subscriptions while 41,250 customers renewed of which 26,250 are basic subscribers taking up the majority.
  - The Basic subscription type is the most popular among customers with 37,500 subscribers and approximately $75M generated in revenue (50% of the total).
  - Customers who cancelled their subscriptions are distributed evenly across Basic, Standard and Premium subscription types and the North, South and West regions.
  - The customer value segments in terms of revenue and region i.e. total number of customers by revenue groups and region were approximately equal.
  - The average subscription duration was 365 days (12 months).
  - The month with the highest number of cancelled and renewed subscriptions are April and July respectively.
  
Below are the dashboards for 2022 and 2023, and their key insights respectively.
![Power BI CSA 1](https://github.com/user-attachments/assets/9402df1d-1acb-4b36-8d74-ff7ee6fac081)

For the year 2022,
  - Approximately $90M was generated in revenue from 45,000 customers.
  - 18,750 customers cancelled their subscriptions while 26,250 customers renewed of which 18,750 are basic subscribers taking up the majority.
  - The Basic subscription type is the most popular among customers with 22,500 subscribers and approximately $45M generated in revenue (50% of the total).
  - The regions with the highest number of cancelled and renewed subscriptions are the South (11,250) and East (11,250) regions respectively
  - The customer value segments in terms of revenue and region i.e. total number of customers by revenue groups and region were approximately equal.
  - The average subscription duration was 365 days (12 months).
  
![Power BI CSA 2](https://github.com/user-attachments/assets/7a63e2f1-699a-4482-9e8a-085490ab36e7)

For the year 2023,
  - Approximately $60M was generated in revenue from 30,000 customers.
  - 15,000 customers cancelled their subscriptions while 15,000 customers renewed.
  - The Basic subscription type is the most popular among customers with 15,000 subscribers and approximately $30M generated in revenue (50% of the total).
  - The North and West regions had an equal number of cancelled subscriptions (7500). The East and South regions had an equal number of renewed subscriptions (7500).
  - The customer value segments in terms of revenue and region i.e. total number of customers by revenue groups and region were approximately equal.
  - The average subscription duration was 366 days (12 months).



## Acknowledgements
  - Special thanks to the instructors at The Incubator Hub for guidance throughout the learning period.









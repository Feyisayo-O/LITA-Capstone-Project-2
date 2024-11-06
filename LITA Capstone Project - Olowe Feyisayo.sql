create database LITA_CAPSTONE_PROJECT

---PROJECT 1: SALES PERFORMANCE ANALYSIS FOR A RETAIL STORE---
select * from [dbo].[Sales Data]

---Total Sales for Each Category---
select [Product], SUM(Quantity) as Total_Sales_Category from [dbo].[Sales Data]
group by [Product]

---Number of Sales Transactions in Each Region---
select [Region], COUNT(Quantity) as No_of_Sales_Transactions_Region from [dbo].[Sales Data]
group by [Region]

---Highest Selling Product by Total Sales Value---
select TOP(1) SUM(Quantity) as Top_Selling_Product, [Product] from [dbo].[Sales Data]
group by [Product]
order by SUM(Quantity) desc

---Total Revenue per Product---
select [Product], SUM(Revenue) as Total_Revenue_Product from [dbo].[Sales Data]
group by [Product]

---Monthly Sales Totals for the Current Year---
alter table [dbo].[Sales Data]
add OrderDay varchar (MAX),
    OrderMonth varchar (MAX),
    OrderYear int 

update [dbo].[Sales Data]
set OrderDay = DAY(OrderDate),
    OrderMonth = MONTH(OrderDate),
	OrderYear = YEAR(OrderDate)

select OrderMonth, SUM(Quantity) as Monthly_Sales_Totals_2024 from [dbo].[Sales Data]
where OrderYear = '2024'
group by OrderMonth 
order by OrderMonth asc

---Top 5 Customers by Total Purchase Amount---
select TOP(5) SUM(Revenue) as Top_5Customers_Purchase, [Customer_Id] from [dbo].[Sales Data]
group by [Customer_Id]
order by SUM(Revenue) desc

---Percentage of Total Sales Contributed by Each Region---
select [Region], SUM(Quantity) as Total_Sales, ROUND(SUM(Quantity) / cast((select SUM(Quantity) from [dbo].[Sales Data]) as float) * 100, 2)
as PercentSales_Region
from [dbo].[Sales Data]
group by [Region]



---PROJECT 2: CUSTOMER SEGMENTATION FOR A SUBSCRIPTION SERVICE---
select * from [dbo].[Customer Data]

---Total Number of Customers from Each Region---
select [Region], COUNT(CustomerID) as Total_Customers_Region from [dbo].[Customer Data]
group by [Region]

---Most Popular Subscription Type by Number of Customers---
select TOP(1) COUNT(CustomerID), [SubscriptionType] from [dbo].[Customer Data]
group by [SubscriptionType]
order by COUNT(CustomerID) desc

---Customers who Canceled Their Subscription Within 6 Months---
select [CustomerID] from [dbo].[Customer Data] 
where [Canceled] = 'TRUE' and [SubscriptionDuration_Days] <= '183'

---Average Subscription for All Customers---
select AVG(SubscriptionDuration_Days) as Average_Sub from [dbo].[Customer Data]

---Customers with Subscriptions Longer than 12 Months---
select [CustomerID] from [dbo].[Customer Data] 
where [SubscriptionDuration_Days] > '366'

---Total Revenue by Subscription Type---
select [SubscriptionType], SUM(Revenue) as TotalRevenue_SubType from [dbo].[Customer Data]
group by [SubscriptionType]

---Top 3 Regions by Subscription Cancelations---
select TOP(3) COUNT([Canceled]), [Region] from [dbo].[Customer Data]
where [Canceled] = 'TRUE'
group by [Region]
order by COUNT([Canceled]) desc

---Total Number of Active and Canceled Subscription---
select COUNT([Canceled]) as Active_Subs from [dbo].[Customer Data]
where [Canceled] = 'FALSE'

select COUNT([Canceled]) as Canceled_Subs from [dbo].[Customer Data]
where [Canceled] = 'TRUE'

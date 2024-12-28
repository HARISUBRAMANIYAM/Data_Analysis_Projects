Walmart  Analysis Using MYSQL

Project Overview
The Walmart Query Analysis project focuses on analyzing sales data to uncover trends, patterns, and actionable insights. Using SQL, this project performs operations like data transformation, querying, and aggregation on Walmart sales datasets to provide meaningful business intelligence.

Features
 Data Loading and Table Setup: Creation and management of database tables to store sales data.
 Timebased Analysis: Insights into sales trends based on time, day, and month.
 Customer Segmentation: Analysis of customer types, genders, and purchasing behaviors.
 Revenue Analysis: Identification of highrevenue product lines, cities, and customer types.
 Product Performance: Evaluation of product lines based on sales quantity and customer ratings.
 Payment Methods: Insights into the most commonly used payment methods.
 Custom Metrics: Creation of derived columns like `time_of_day`, `day_name`, `month_name`, and `product_category`.

SQL Operations
	Table Creation
 	Designed schemas for `sales`, `sales2`, and `sales3` tables with comprehensive fields 	covering invoice details, customer information, sales metrics, and ratings.

Data Loading
 Used the `LOAD DATA LOCAL INFILE` statement to import sales data from a CSV file into the `sales`  table.

Transformations
 Added columns like `time_of_day`, `day_name`, `month_name`, and `product_category` to enhance the  dataset with derived insights.

Queries
 Aggregations: 
   Sum, average, and count operations for fields like `quantity`, `unit_price`, `rating`, and `vat`.
   Grouping and Ordering: 
   Grouped data by attributes like `branch`, `city`, `day_name`, `time_of_day`, and `product_line` to    derive sales trends and performance metrics.
   Filtering and Conditions: 
   Conditional queries to classify products (`GOOD` or `BAD`) and segment time (`Morning`,    `Afternoon`, `Evening`).
Insights:
   Identified the most popular products, cities with the highest VAT, and customer types with the    most purchases.

Example Queries
 Topselling product lines:
  ```sql
  SELECT product_line, COUNT(product_line) AS most_sell_product
  FROM sales
  GROUP BY product_line
  ORDER BY most_sell_product DESC
  LIMIT 1;
  ```
 Total revenue by month:
  ```sql
  SELECT month_name, SUM(total) AS total_revenue
  FROM sales
  GROUP BY month_name
  ORDER BY total_revenue DESC;
  ```
 Average rating by `time_of_day`:
  ```sql
  SELECT time_of_day, AVG(rating) AS average_rating
  FROM sales
  GROUP BY time_of_day
  ORDER BY average_rating DESC
  LIMIT 1;
  ```

Installation and Setup
	1. Install a MySQL database server.
	2. Load the dataset (`Walmart Sales Data.csv`) into the database using the provided schema            and `LOAD DATA` statement.
	3. Execute the SQL scripts in sequence to create tables, load data, and run queries.

Dataset Description
 Source: Walmart sales data, imported via CSV.
 Fields: Includes attributes such as `invoice_id`, `branch`, `city`, `customer_type`, `gender`,          `product_line`, `quantity`, `unit_price`, `vat`, `rating`, and more.

Tools and Technologies
 SQL: For data manipulation and querying.
 MySQL: Relational database for storing and managing data.
 CSV: Source data format for sales records.

Outcomes
 The analysis provides insights such as:
 Bestperforming branches and product lines.
 Sales patterns by time, day, and month.
 Customer preferences and behaviors.
 Revenue and VAT contributions by city and product.

Future Enhancements
 Integrate the analysis with a BI tool like Tableau or Power BI for visualizations.
 Automate data loading and processing using Python scripts.
 Expand analysis to include predictive models for future sales.


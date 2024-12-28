--------------------------WALMART QUERY ANALYSE -------------------
/* 2024-10-03 19:30:30 [48 ms] */ 
CREATE TABLE sales2(
invoice_id VARCHAR(30) ,
branch VARCHAR(5) ,
city VARCHAR(30) ,
customer_type VARCHAR(30) ,
gender VARCHAR(10),
product_line VARCHAR(100) ,
unit_price DECIMAL(10,2) ,
quantity INT(20) ,
vat FLOAT(6,4) ,
total DECIMAL(12, 4) ,
date DATETIME ,
time TIME ,
payment VARCHAR(15) ,
cogs DECIMAL(10,2) ,
gross_margin_pct FLOAT(11,9),
gross_income DECIMAL(12, 4),
rating FLOAT(2, 1)
);
/* 2024-10-03 19:32:24 [3 ms] */ 
SELECT count(*) FROM sales2 LIMIT 100;
/* 2024-10-03 19:33:08 [3 ms] */ 
SELECT * FROM sales2 LIMIT 10;
/* 2024-10-03 19:34:43 [30 ms] */ 
CREATE TABLE sales3(
invoice_id VARCHAR(30) ,
branch VARCHAR(5) ,
city VARCHAR(30) ,
customer_type VARCHAR(30) ,
gender VARCHAR(10),
product_line VARCHAR(100) ,
unit_price DECIMAL(10,2) ,
quantity INT(20) ,
vat FLOAT(6,4) ,
total DECIMAL(12, 4) ,
date DATETIME ,
time TIME ,
payment VARCHAR(15) ,
cogs DECIMAL(10,2) ,
gross_margin_pct FLOAT(11,9),
gross_income DECIMAL(12, 4),
rating FLOAT(2, 1)
);
/* 2024-10-03 19:55:41 [26 ms] */ 
TRUNCATE sales;
/* 2024-10-03 19:56:03 [5 ms] */ 
SELECT * FROM sales LIMIT 100;
/* 2024-10-03 19:56:27 [3 ms] */ 
SELECT invoice_id FROM sales LIMIT 100;
/* 2024-10-03 19:56:43 [4 ms] */ 
SELECT count(invoice_id) FROM sales LIMIT 100;
/* 2024-10-03 19:57:24 [23 ms] */ 
SELECT sum(quantity) as total_qty FROM sales LIMIT 100;
/* 2024-10-03 19:57:55 [24 ms] */ 
SELECT ROUND(sum(quantity),2) as total_qty FROM sales LIMIT 100;
/* 2024-10-03 19:58:15 [4 ms] */ 
SELECT count(unit_price) FROM sales LIMIT 100;
/* 2024-10-03 19:59:14 [3 ms] */ 
SELECT * FROM sales LIMIT 100;
/* 2024-10-03 20:00:55 [25 ms] */ 
TRUNCATE sales;
/* 2024-10-03 20:01:08 [4 ms] */ 
SELECT * FROM sales LIMIT 100;
/* 2024-10-03 20:03:05 [7 ms] */ 
SHOW GLOBAL VARIABLES LIKE 'local_infile';
/* 2024-10-03 20:03:05 [1 ms] */ 
SET GLOBAL local_infile = 1;
/* 2024-10-03 20:03:33 [51 ms] */ 
LOAD DATA LOCAL INFILE 
'E:\Walmart Sales Data.csv.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
/* 2024-10-03 20:03:53 [3 ms] */ 
SELECT * from sales LIMIT 100;
/* 2024-10-03 20:07:59 [9 ms] */ 
SELECT time,
(CASE 
	WHEN 'time' BETWEEN "00:00:00" and "12:00:00"    THEN "Morning"    
	WHEN 'time' BETWEEN "12:01:00" AND " 16:00:00" THEN "Afternone"
 ELSE "Evening"   
END) as time_of_day
FROM sales LIMIT 100;
/* 2024-10-03 20:09:28 [39 ms] */ 
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);
/* 2024-10-03 20:10:46 [6 ms] */ 
SELECT * from sales LIMIT 100;
/* 2024-10-03 20:13:28 [99 ms] */ 
UPDATE sales set time_of_day =(CASE 
	WHEN 'time'  BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"    
	WHEN 'time' BETWEEN "12:01::00" AND "16:00:00" THEN "Afternoon"
    ELSE "Evening"    
 END);
/* 2024-10-03 20:14:16 [6 ms] */ 
SELECT DATE, DAYNAME(date) as day_name FROM sales LIMIT 10;
/* 2024-10-03 20:15:03 [36 ms] */ 
alter TABLE sales add COLUMN day_name VARCHAR(20);
/* 2024-10-03 20:15:37 [71 ms] */ 
update sales set day_name =DAYNAME(date);
/* 2024-10-03 20:16:15 [3 ms] */ 
SELECT date ,MONTHNAME(date) as month_name FROM sales LIMIT 100;
/* 2024-10-03 20:16:19 [2 ms] */ 
SELECT date ,MONTHNAME(date) as month_name FROM sales LIMIT 10;
/* 2024-10-03 20:16:54 [18 ms] */ 
ALTER TABLE sales add COLUMN month_name varchar(20);
/* 2024-10-03 20:17:45 [56 ms] */ 
UPDATE sales set month_name =MONTHNAME(date);
/* 2024-10-03 20:18:19 [5 ms] */ 
SELECT DISTINCT city from sales LIMIT 100;
/* 2024-10-03 20:19:23 [5 ms] */ 
SELECT DISTINCT branch ,city FROM sales LIMIT 10;
/* 2024-10-03 20:20:06 [8 ms] */ 
SELECT count(DISTINCT product_line) FROM sales LIMIT 100;
/* 2024-10-03 20:21:52 [7 ms] */ 
SELECT payment ,COUNT(payment) as common_pay_method from sales GROUP BY payment ORDER BY common_pay_method desc LIMIT 1;
/* 2024-10-03 20:23:31 [6 ms] */ 
SELECT product_line ,count(product_line) as most_sell_product FROM sales GROUP BY product_line ORDER BY most_sell_product DESC limit 1;
/* 2024-10-03 20:25:43 [6 ms] */ 
SELECT month_name,sum(total) as total_revenue from sales GROUP BY month_name ORDER BY total_revenue DESC LIMIT 100;
/* 2024-10-03 20:26:26 [8 ms] */ 
SELECT month_name,sum(total) as total_revenue from sales GROUP BY month_name ORDER BY total_revenue ASC LIMIT 100;
/* 2024-10-03 20:30:06 [7 ms] */ 
SELECT product_line ,SUM(vat) as VAT from sales GROUP BY product_line ORDER BY VAT desc LIMIT 100;
/* 2024-10-03 20:31:22 [22 ms] */ 
ALTER table sales add COLUMN product_category varchar(20);
/* 2024-10-03 20:50:21 [177 ms] */ 
update sales set product_category =( CASE 
	WHEN total >= (SELECT avg(total) FROM(SELECT total from sales) as avg_total )    THEN  "GOOD"  
	ELSE    "BAD"
END);
/* 2024-10-03 20:50:49 [3 ms] */ 
SELECT product_category from sales LIMIT 10;
/* 2024-10-03 20:53:37 [29 ms] */ 
SELECT branch ,sum(quantity) as Quantity from sales group BY branch having Sum(quantity) > avg(quantity)  order by Quantity DESC LIMIT 1;
/* 2024-10-03 20:56:09 [10 ms] */ 
SELECT gender ,product_line ,count(gender)  as total_count from  sales GROUP BY gender,product_line  ORDER BY total_count DESC LIMIT 100;
/* 2024-10-03 20:57:46 [8 ms] */ 
SELECT product_line ,ROUND(avg(rating),2) as average_rating from sales GROUP BY product_line ORDER BY average_rating DESC LIMIT 100;
/* 2024-10-03 21:00:15 [9 ms] */ 
SELECT day_name,time_of_day ,count(invoice_id) as total_sales from sales GROUP BY day_name,time_of_day having day_name NOT in ('sunday','saturday') LIMIT 100;
/* 2024-10-03 21:00:45 [9 ms] */ 
SELECT day_name,time_of_day ,count(invoice_id) as total_sales from sales GROUP BY day_name,time_of_day having day_name NOT in ('sunday','saturday') ORDER BY total_sales LIMIT 100;
/* 2024-10-03 21:02:28 [6 ms] */ 
SELECT * from sales limit 100;
/* 2024-10-03 21:16:47 [9 ms] */ 
SELECT day_name ,time_of_day ,count(*) as total_sales from sales where day_name NOT IN ('saturday','sunday') GROUP BY day_name,time_of_day LIMIT 100;
/* 2024-10-03 21:18:09 [9 ms] */ 
select customer_type ,SUM(total) as total_sales from sales GROUP BY customer_type ORDER BY total_sales DESC limit 1;
/* 2024-10-03 21:19:35 [7 ms] */ 
SELECT city ,SUM(vat)as total_VAT from sales GROUP BY city ORDER BY total_VAT DESC limit 1;
/* 2024-10-03 21:22:02 [7 ms] */ 
SELECT city ,SUM(vat ) as total_vat   from sales GROUP BY city ORDER BY total_vat  DESC LIMIT 1;
/* 2024-10-03 21:23:19 [5 ms] */ 
SELECT count(DISTINCT customer_type) from sales LIMIT 100;
/* 2024-10-03 21:23:45 [6 ms] */ 
SELECT count(DISTINCT payment) FROM sales LIMIT 100;
/* 2024-10-03 21:25:05 [8 ms] */ 
SELECT customer_type,count(customer_type) as common_cust FROM sales GROUP BY customer_type ORDER BY common_cust desc LIMIT 1;
/* 2024-10-03 21:26:05 [8 ms] */ 
SELECT customer_type ,sum(total) as total_sales from sales GROUP BY customer_type ORDER BY total_sales LIMIT 100;
/* 2024-10-03 21:26:10 [7 ms] */ 
SELECT customer_type ,sum(total) as total_sales from sales GROUP BY customer_type ORDER BY total_sales limit 1;
/* 2024-10-03 21:27:34 [7 ms] */ 
SELECT customer_type ,count(*) as most_buyer from sales GROUP BY customer_type ORDER BY most_buyer DESC limit 1;
/* 2024-10-03 21:29:28 [8 ms] */ 
SELECT gender ,branch ,COUNT(gender) as gender_dis from sales GROUP BY gender,branch ORDER BY gender_dis LIMIT 100;
/* 2024-10-03 21:29:59 [8 ms] */ 
SELECT time_of_day, AVG(rating) AS average_rating
FROM sales GROUP BY time_of_day ORDER BY average_rating DESC LIMIT 1;
/* 2024-10-03 21:30:13 [9 ms] */ 
SELECT branch, time_of_day, AVG(rating) AS average_rating
FROM sales GROUP BY branch, time_of_day ORDER BY average_rating DESC LIMIT 100;
/* 2024-10-03 21:37:22 [8 ms] */ 
SELECT day_name, AVG(rating) AS average_rating
FROM sales GROUP BY day_name ORDER BY average_rating DESC LIMIT 1;
/* 2024-10-03 21:39:18 [9 ms] */ 
SELECT branch,day_name ,avg(rating) as avg_rate from sales GROUP BY branch,day_name ORDER BY avg_rate desc LIMIT 1;

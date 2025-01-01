 Call Center Data Cleaning Project

---This project involves cleaning and analyzing call center data stored in a MySQL database. The data is loaded from a CSV file and various data cleaning operations are performed to ensure the data is in a usable format for analysis.----

 Project Structure

  --- `call_center_dataclean_proj.sql`: SQL script containing the data cleaning and analysis queries.
       `createtabletemplate.sql`: SQL script for creating the `call_c2` table and loading data from         the CSV file.---
  --- `Call Center.csv`: The CSV file containing the raw call center data.---

  --- Prerequisites

 	MySQL Server installed and running.
 	MySQL Workbench or any other MySQL client for executing SQL scripts.
 	The CSV file should be placed in a directory accessible by the MySQL server (as specified by 	the `secure_file_priv` variable).---

 Steps to Run the Project

	1. Create the Database and Table:
  		 Execute the `createtabletemplate.sql` script to create the `call_c2` table and load 		data from the CSV file.

   			```sql
    			Create the table
   			CREATE TABLE call_c2 (
       			id VARCHAR(255) NOT NULL PRIMARY KEY COMMENT 'Primary Key',
       			customer_name VARCHAR(255) NOT NULL COMMENT 'Name of the customer',
       			sentiment VARCHAR(255),
       			csat_score INT,
       			call_timestamp VARCHAR(255),
		       reason VARCHAR(255),
 			city VARCHAR(255),
       			state VARCHAR(255),
       			channel VARCHAR(255),
       			response_time VARCHAR(50),
       			call_duration_in_minutes INT(5),
       			call_center VARCHAR(100)
   			) COMMENT 'call_center_data_cleaning and analysis';

   			Grant file privileges
   			GRANT FILE ON *.* TO 'root'@'localhost';
   			FLUSH PRIVILEGES;

    			Load data from CSV file
   			LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Call 			Center.csv'
   			INTO TABLE call_c2
   			FIELDS TERMINATED BY ','
   			ENCLOSED BY '"'
   			LINES TERMINATED BY '\n'
   			IGNORE 1 ROWS
   			(id, customer_name, sentiment, csat_score, call_timestamp, reason, city, 			state, channel, response_time, call_duration_in_minutes, call_center);
	Data Cleaning Operations
		Change Date Format: Convert the call_timestamp column from MM/DD/YYYY format to MySQL 		DATE format.
		Update Empty Values: Replace empty values in the csat_score column with NULL.
	Analysis Queries
		Count Rows and Columns: Get the number of rows and columns in the call_c2 table.
		Distinct Values: Get distinct values for the sentiment, city, and call_center 		columns.

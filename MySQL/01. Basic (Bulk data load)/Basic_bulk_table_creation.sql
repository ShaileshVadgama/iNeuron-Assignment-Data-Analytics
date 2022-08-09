create database my_sales # creating databases
use my_sales # using database
 
#use this command in anaconda prompt for bulk table creation 
#step 1) D: 
#step 2) D:\> pip install csvkit
#step 3) (base) D:\> csvsql --dialect mysql --snifflimit 100000 sales_data_final.csv > output_salesprofit.sql

# creating table 
create table profit(
order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
    );

select * from profit

SET SESSION sql_mode = '' # for ignore errors 

#Bulk data load

load data infile
'D:/sales_data_final.csv'
into table profit
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows










use salesfinal
select * from sales10

# creating user define functions
DELIMITER $$
create function add_to_col(a int)
returns int 
deterministic 
begin
	declare b int ;
    set b = a + 10 ; 
    return b ;
end $$    

# 2nd one 
DELIMITER $$
create function final_profits(profit int, discount int)
returns int
deterministic
begin
	declare final_profit int;
    set final_profit = profit - discount;
    return final_profit;
end $$    

select profit,discount , final_profits(profit,discount) from sales10

# 3rd one 
DELIMITER $$
create function final_profits_real(profit decimal(20,6), discount decimal(20,6), sales decimal(20,6))
returns int
deterministic
begin
	declare final_profit int;
    set final_profit = profit - sales * discount;
    return final_profit;
end $$   

select profit,discount, sales , final_profits_real(profit,discount,sales) from sales10

# making function which is converting int to varchar
DELIMITER $$
create function int_to_str(a int)
returns varchar(30)
deterministic
begin
declare b varchar(30);
set b = a;
return b ;
end $$

select int_to_str(45) #check field types

select * from sales10

select quantity , int_to_str(quantity) from sales10 ;

select max(sales) , min(sales) from sales10

1-100 - super affordable
100 -300 affordable
300 - 600 moderate price
600 +  - expensive

DELIMITER &&
create function mark_sales(sales int)
returns varchar(30)
deterministic
begin
declare flag_sales varchar(30);
if sales <= 100 then 
	set flag_sales = "super affordable" ;
elseif sales > 100 and sales < 300 then 
	set flag_sales = "affordable" ;
elseif sales > 300 and sales < 600 then 
	set flag_sales = "moderate price" ; 
else 
	set flag_sales = "expensive" ;
end if ;
return flag_sales;  
end &&

select mark_sales(20)

select sales, mark_sales(sales) from sales10

# 4th creating loop

create table loop_table(val int) # table created to store daata of loop 

delimiter  $$
create procedure insert_data()
begin
set @var = 10 ;
generate_data : loop
insert into loop_table values(@var);           # inserting data
set @var = @var + 1 ;
if @var = 100 then 
	leave generate_data;
end if;
end loop generate_data;    
end $$

call insert_data()

select  * from loop_table 

delimiter  $$
create procedure div_three_data()
begin
set @var = 10 ;
generate_data : loop
if @var %3 = 0 then
set @var = @var + 1 ;
insert into loop_table values(@var);           # inserting data
if @var = 100 then 
	leave generate_data;
end if;     
end if;
end loop generate_data;    
end $$

call div_three_data()

select  * from loop_table 


select add_to_col(15)

select quantity, add_to_col(quantity) from sales10

# Creating log function
DELIMITER $$
create function add_to_col2(a INT )
RETURNS int
deterministic
begin
declare b int;
set b = log10(a);
return b;
end$$


select add_to_col2(10);




















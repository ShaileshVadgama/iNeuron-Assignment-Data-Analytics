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

















select add_to_col(15)

select quantity, add_to_col(quantity) from sales10























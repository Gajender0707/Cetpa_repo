use prep_database;
CREATE TABLE input_table_1 (
    Market VARCHAR(50),
    Sales INT
);

INSERT INTO input_table_1 (Market, Sales) VALUES
('India', 100),
('Maharashtra', 20),
('Telangana', 18),
('Karnataka', 22),
('Gujarat', 25),
('Delhi', 12),
('Nagpur', 8),
('Mumbai', 10),
('Agra', 5),
('Hyderabad', 9),
('Bengaluru', 12),
('Hubli', 12),
('Bhopal', 5);

CREATE TABLE input_table_2 (
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50)
);
-- delete from input_table_2;
INSERT INTO input_table_2 (Country, State, City) VALUES
('India', 'Maharashtra', 'Nagpur'),
('India', 'Maharashtra', 'Mumbai'),
('India', 'Maharashtra', 'Akola'),
('India', 'Telangana', 'Hyderabad'),
('India', 'Karnataka', 'Bengaluru'),
('India', 'Karnataka', 'Hubli'),
('India', 'Gujarat', 'Ahmedabad'),
('India', 'Gujarat', 'Vadodara'),
('India', 'UP', 'Agra'),
('India', 'UP', 'Mirzapur'),
('India', 'Delhi', NULL), 
('India', 'Orissa', NULL); 



select * from input_table_1;
select * from input_table_2;

with city_wise_sales as (
select 
it2.country,it2.state,sum(it1.sales) city_wise_sales
from input_table_2 it2
left join input_table_1 it1 
on it2.city=it1.market
group by 1,2),
state_wise_sales as (
select 
distinct 
it2.country,it2.state,it2.city,it1.sales state_wise_sales
from input_table_2 it2
left join input_table_1 it1 
on it2.state=it1.market),
remaining_state_sales as (
select distinct 
ss.country,ss.state,
ss.state_wise_sales,cs.city_wise_sales,
ifnull(ss.state_wise_sales,0)-ifnull(cs.city_wise_sales,0) remaining_state_sales
from state_wise_sales ss
left join city_wise_sales cs
on ss.state=cs.state
where ifnull(ss.state_wise_sales,0)!=ifnull(cs.city_wise_sales,0))
select distinct 
ss.country,ss.state,
ss.state_wise_sales,cs.city_wise_sales,
ifnull(ss.state_wise_sales,0)-ifnull(cs.city_wise_sales,0) remaining_state_sales
from state_wise_sales ss
left join city_wise_sales cs
on ss.state=cs.state
where ifnull(ss.state_wise_sales,0)!=ifnull(cs.city_wise_sales,0);





/* question 2 */


CREATE TABLE customer (
    customer_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    visited_on DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);
INSERT INTO customer (customer_id, name, visited_on, amount) VALUES
(1, 'Jhon',    '2019-01-01', 100),
(2, 'Daniel',  '2019-01-02', 110),
(3, 'Jade',    '2019-01-03', 120),
(4, 'Khaled',  '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis',   '2019-01-06', 140),
(7, 'Anna',    '2019-01-07', 150),
(8, 'Maria',   '2019-01-08', 80),
(9, 'Jaze',    '2019-01-09', 110),
(1, 'Jhon',    '2019-01-10', 130),
(3, 'Jade',    '2019-01-10', 150);

select * from customer;

with cte as (select visited_on,
sum(amount) amount
 from customer
 group by 1)
 select 
 visited_on,sum(amount) over(order by visited_on rows between 6 preceding and current row) amount,
 round(avg(amount) over(order by visited_on rows between 6 preceding and current row),2) average_amount
 from cte
 limit 10 offset 6;


-- 
CREATE TABLE emp_details (
    emp_name VARCHAR(10),
    city VARCHAR(15)
);

-- Insert sample data
INSERT INTO emp_details (emp_name, city) VALUES
('Sam', 'New York'),
('David', 'New York'),
('Peter', 'New York'),
('Chris', 'New York'),
('John', 'New York'),
('Steve', 'San Francisco'),
('Rachel', 'San Francisco'),
('Robert', 'Los Angeles');


select * from emp_details;

with cte as (select * ,
ceiling(row_number() over(partition by city)/3.0) team_group
from emp_details)
select 
city,group_concat(emp_name order by emp_name) emp_names,
concat('Team',row_number() over(order by city)) team_name
from cte
group by 1,team_group
order by city;


select * from polls;
select * from poll_answers;





















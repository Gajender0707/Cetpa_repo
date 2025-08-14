use prep_database;

create table numbers (
num int );

insert into numbers ( num)
values (1),(2),(3),(4),(5);

select * from numbers;

with recursive cte  as (
select 1 as n 
union all
select n+1 
from cte 
where n<5)
select * from cte; 


WITH RECURSIVE numbers AS (
    -- 1️⃣ Anchor member: start at 1
    SELECT 1 AS n

    UNION ALL

    -- 2️⃣ Recursive member: add 1 until 5
    SELECT n + 1
    FROM numbers
    WHERE n < 5
)
SELECT * FROM numbers;




create table polls
(
user_id varchar(4),
poll_id varchar(3),
poll_option_id varchar(3),
amount int,
created_date date
);
-- Insert sample data into the investments table
INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date) VALUES
('id1', 'p1', 'A', 200, '2021-12-01'),
('id2', 'p1', 'C', 250, '2021-12-01'),
('id3', 'p1', 'A', 200, '2021-12-01'),
('id4', 'p1', 'B', 500, '2021-12-01'),
('id5', 'p1', 'C', 50, '2021-12-01'),
('id6', 'p1', 'D', 500, '2021-12-01'),
('id7', 'p1', 'C', 200, '2021-12-01'),
('id8', 'p1', 'A', 100, '2021-12-01'),
('id9', 'p2', 'A', 300, '2023-01-10'),
('id10', 'p2', 'C', 400, '2023-01-11'),
('id11', 'p2', 'B', 250, '2023-01-12'),
('id12', 'p2', 'D', 600, '2023-01-13'),
('id13', 'p2', 'C', 150, '2023-01-14'),
('id14', 'p2', 'A', 100, '2023-01-15'),
('id15', 'p2', 'C', 200, '2023-01-16');

create table poll_answers
(
poll_id varchar(3),
correct_option_id varchar(3)
);

-- Insert sample data into the poll_answers table
INSERT INTO poll_answers (poll_id, correct_option_id) VALUES
('p1', 'C'),('p2', 'A');

select * from polls;
select * from poll_answers;

select user_id,
amount,
sum(case when poll_id='p1' and poll_option_id!= 'C' then amount end  ) fail_poll,
sum(case when poll_id='p1' and poll_option_id= 'C' then amount end  ) pass_poll
from polls
group by 1,2;


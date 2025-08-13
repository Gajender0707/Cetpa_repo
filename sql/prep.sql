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



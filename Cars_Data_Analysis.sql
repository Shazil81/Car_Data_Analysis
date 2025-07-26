/* Data Exploration */

-- To view the structure of tables
select * from cars;

-- Check data types and nulls
describe cars;

-- Identifying Missing Data
select 
	count(*) as Total_Rows,
    count(case when Price is null then 1 end) as Null_Price,
    count(case when Car_ID is null then 1 end) as Null_Car_ID,
    count(case when Model is null then 1 end) as Null_Model,
    count(case when Brand is null then 1 end) as Null_Brand
from cars;

-- Identifying Anomalous Data
select * from cars where Price < 0 or Service_Cost < 0 ;

select * from cars where Mileage < 0 or Engine_CC < 0 ;

/* Analysis */


-- 1. Total No. Of Cars
select count(*) as Total_Cars from cars;

-- 2. Total No. Of Brands
select count(distinct Brand) as Total_Brands from cars;

-- 3. Avg Price of Cars
select avg(Price) as Avg_Price from cars;

-- 4. Avg Mileage 
select avg(Mileage) as Avg_Mileage from cars;

-- 5. Count of Cars by Fuel Type
select Fuel_Type, count(*) as Fuel_Type_Count from cars
group by Fuel_Type;

-- 6. Brand with Highest Avg Price
select Brand, avg(price) as Avg_Price
from cars group by Brand
order by Avg_Price desc limit 1;

-- 7. Best Fuel Type by Avg Mileage
select Fuel_Type, avg(Mileage) as Avg_Mileage
from cars group by Fuel_Type
order by Avg_Mileage desc; 


-- 8. Average Price per Brand for Diesel Cars
select Brand, avg(Price) as Avg_Price
from cars 
where Fuel_Type = 'Diesel'
group by Brand
order by Avg_Price;

-- 9.  Total No of Automatic and Manual Cars by Brand
select Brand,
	sum(case when Transmission = 'Automatic' then 1 else 0 end) as Total_Auto_Cars,
    sum(case when Transmission = 'Manual' then 1 else 0 end) as Total_Manual_Cars
from cars group by Brand;

-- 10. Avg Price Difference Between Automatic & Manual Cars
select
	avg(case when Transmission = 'Automatic' then Price end) -
    avg(case when Transmission = 'Manual' then Price end) as Price_Difference
from cars;

-- 11. Top Brands by Price per CC
select Brand, avg(Price/Engine_CC) as PricePerCC
from cars group by Brand
order by PricePerCC desc limit 5;

-- 12. Top 3 Most Expensive Cars Per Brand
with RankedCars as ( 
	select Brand, Model, Year, Price,
    row_number() over(partition by Brand order by Price desc) as rnk
    from cars
    )
select * from RankedCars where rnk <= 3;


-- 13. Top 3 Least Expensive Cars Per Brand
with RankedCars as ( 
	select Brand, Model, Year, Price,
    row_number() over(partition by Brand order by Price asc) as rnk
    from cars
    )
select * from RankedCars where rnk <= 3;

-- 14. Brand Performance Percentile by Service Cost
select Brand, avg(Service_Cost) as Avg_Service,
	ntile(4) over (order by avg(Service_Cost)) as Quartile
from cars group by Brand;

-- 15. Brands with Above-Average Mileage Compared to All Brands
select Brand, 
  avg(Mileage) as Brand_Avg_Mileage
from cars
group by Brand
having 
  Brand_Avg_Mileage > (select avg(Mileage) from cars);
  
  
  -- 16. Outlier Cars within the Brand
  with Stats as (
  select Brand, avg(Price) as Avg_P, stddev(Price) as Std_P
  from cars group by Brand
  )
select c.*
from cars c
join Stats s on c.Brand = s.Brand
where c.Price > s.Avg_P + 3*s.Std_P;


-- 17. Car Models That are Top 1 in Price in Each Year
select * from (
select Year, Model, Price,
	rank() over (partition by Year order by Price desc) as rnk
    from cars
    )
ranked where rnk = 1;


-- 18. Year-over-Year Average Price Change Per Brand
with YearlyAvg as (
select Brand, Year, avg(Price) as Avg_Price
from cars
group by Brand, Year
),
Diff as (
select * ,
		Avg_Price - lag(Avg_Price) over (partition by Brand order by Year) as YOY_Change
        from YearlyAvg
        )
select * from Diff;


-- 19. Brands Where Average Price Increased Consistently
with Yearly as (
select Brand, Year, avg(Price) as Avg_Price
from cars
group by Brand, Year
),
Diff as (
select *, lag(Avg_Price) over (partition by Brand order by Year) as Prev_Price
from Yearly
)
select Brand, Year, Avg_Price, Prev_Price from Diff where Avg_Price > Prev_Price;
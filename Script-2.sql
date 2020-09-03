select name,geom from locations_geographicarea where geo_id='3903541664' and "year"=2012;

select name,geom as geom from locations_geographicarea where geo_id='1600190345' and year='2018';

select * from locations_geographicarea where year=2018;

select name, year, geo_id, geom from locations_geographicarea where area_type='COUSUB' and "year"=2016;

--delete from locations_geographicarea;
--update locations_geographicarea set year=year+1;

select name,year,raw_score,score from locations_geographicarea where "name" like 'Cuyahoga%' and area_type='COUNTY' order by year DESC;

select geo_id, year, total_population from locations_geographicarea where geo_id='23021';

select name,geom from locations_geographicarea where geo_id='3903541664' and "year"=2018

select name,geom as geom from locations_geographicarea where geo_id='1600190345' and year='2017';

select geo_id, name, score, geom as geometry from locations_geographicarea WHERE ST_Intersects(
(select geom from locations_geographicarea where geo_id='55' and "year"=2018), locations_geographicarea.geom)and area_type='COUSUB' and year='2018';


select name, geo_id, geom from locations_geographicarea  where area_type='STATE' order by name;

select name, score, geom as geometry from locations_geographicarea WHERE ST_Intersects((select geom from locations_geographicarea where geo_id='48113' and "year"=2018), locations_geographicarea.geom) and area_type='BG' and year='2018';

select total_housing_units,housing_unit_fifty_or_more from locations_geographicarea where area_type='STATE' and year = '2018';

with  
	t1 as (
	select "name", year, median_home_value, rent_to_price_ratio, score, total_population
	from locations_geographicarea where
	area_type='COUSUB' and year='2018' and total_population>=50000 and score in ('A','B','C')
), t2 as (
	select name, year, median_home_value
	from locations_geographicarea where
	area_type='COUSUB' and year='2010' and total_population>=50000 and score in ('A','B','C')
)
select t1.name, 
	   t1.score,
	   t1.total_population,
	   round(cast(t1.rent_to_price_ratio as numeric),2) as rent_to_price_ratio,
	   t2.median_home_value-t1.median_home_value as median_appreciation ,
	   round(((CAST(t2.median_home_value as numeric)-cast(t1.median_home_value as numeric))/cast(t1.median_home_value as numeric))*100,2) as appreciation_percent 
from t1 as t1, t2 as t2 where t1.name=t2.name
order by rent_to_price_ratio DESC;

select "name", 
		score, 
		total_population,
		round(cast(rent_to_price_ratio as numeric),2) as rent_to_price_ratio,
		round(cast(rent_to_income_ratio as numeric),2) as rent_to_income_ratio,
		round((cast(housing_unit_twenty_to_fourty_nine as numeric)/cast(total_housing_units as numeric))*100,2) as percent_units_20_to_49,
		geom as geometry
from locations_geographicarea where
area_type='COUSUB' and year='2018' and total_population>=50000 and score in ('A','B','C') and rent_to_income_ratio<=0.19 and rent_to_price_ratio>=0.56
order by percent_units_20_to_49 desc;


select name,total_population,total_housing_units,median_home_value, total_housing_units-housing_unit_boat_rv_van_etc-housing_unit_mobile_home, housing_unit_one_attached,
housing_unit_fifty_or_more+housing_unit_twenty_to_fourty_nine+housing_unit_ten_to_nineteen+housing_unit_five_to_nine,total_occupied_housing_units
from locations_geographicarea where geo_id='01' and year=2018;

select AVG(rent_to_income_ratio),AVG(rent_to_price_ratio),AVG(round((cast(housing_unit_twenty_to_fourty_nine as numeric)/cast(total_housing_units as numeric))*100,2))
from locations_geographicarea where geo_id='01' and year=2018 group by area_type;

select 

select housing_unit_twenty_to_fourty_nine from locations_geographicarea where geo_id='01'

select name, geo_id from locations_geographicarea where name like 'Cinci%' and area_type='COUSUB' and "year"=2018;

with  
	t1 as (
	select geom, "name", geo_id, year, median_gross_rent, rent_to_income_ratio, score
	from locations_geographicarea where
	area_type='BG' and year='2018' and ST_CONTAINS((select geom from locations_geographicarea where geo_id='3906115000' and "year"=2018), locations_geographicarea.geom)
), t2 as (
	select "name", year, median_gross_rent, rent_to_income_ratio, score
	from locations_geographicarea where
	area_type='BG' and year='2015' and ST_CONTAINS((select geom from locations_geographicarea where geo_id='3906115000' and "year"=2015), locations_geographicarea.geom)
)
select t1.geo_id, 
	   t1.geom,
	   t1.score,
	   t1.median_gross_rent,
	   t2.median_gross_rent,
	   t1.median_gross_rent-t2.median_gross_rent as gross_rent_increase,
	   round((cast((t1.median_gross_rent-t2.median_gross_rent) as numeric)/cast(t2.median_gross_rent as numeric)*100),2) as rent_percent_increase
from t1 as t1, t2 as t2 where t1.name=t2.name and t1.median_gross_rent>0 and t2.median_gross_rent>0
order by rent_percent_increase DESC;

select "name", year, median_gross_rent, rent_to_income_ratio, score
	from locations_geographicarea where
	area_type='BG' and year='2013' and ST_CONTAINS((select geom from locations_geographicarea where geo_id='3906115000' 
	and "year"=2018), locations_geographicarea.geom)

select median_gross_rent from locations_geographicarea where geo_id='390610265002';


select name, geo_id from locations_geographicarea where name like 'Phoenix%' and area_type='COUSUB' and year=2018;

select score, raw_score, total_housing_units, housing_unit_three_to_four, housing_unit_two, geom as geometry
	from locations_geographicarea where
	area_type='BG' and year='2018' and ST_CONTAINS((select geom from locations_geographicarea where geo_id='0401392601' 
	and "year"=2018), locations_geographicarea.geom)


select name,rent_to_price_ratio,total_population
from locations_geographicarea where 
rent_to_price_ratio>=0.5685398562578052 and 
total_population>=25000 and 
area_type='COUSUB' and 
"year"=2018
order by rent_to_price_ratio desc;
	
select score, avg(rent_to_price_ratio) from locations_geographicarea where 
total_population>=25000 and 
area_type='COUSUB' and 
"year"=2018
group by score;

--delete from locations_geographicarea where area_type='STATE' and "year"=2018;

select name, geo_id, geom as geometry from locations_geographicarea 
where area_type='STATE' and "year"=2018 and geo_id!='72';
	
select "name", score,  total_population, round(cast(rent_to_price_ratio as numeric),2) 
as rent_to_price_ratio, round(cast(rent_to_income_ratio as numeric),2) as rent_to_income_ratio, 
round((cast(housing_unit_twenty_to_fourty_nine as numeric)/cast(total_housing_units as numeric))*100,2) as
percent_units_20_to_49, geom as geometry from locations_geographicarea where area_type='COUSUB' and year='2018'
and total_population>=50000 and score in ('A','B','C') and rent_to_income_ratio<=0.19 and rent_to_price_ratio>=0.56 
order by percent_units_20_to_49 desc;

select 
from locations_geographicarea where name like 'Phoenix CCD%' and year=2018 and area_type='COUSUB';

select count(*) from locations_geographicarea;

select name, median_contract_rent, median_home_value, percent_diploma, median_household_income from locations_geographicarea where area_type = 'TRACT' and year=2018;

select percentile_disc(0.4) within group (order by locations_geographicarea.median_home_value) as val1 
from locations_geographicarea  where area_type = 'TRACT' and year=2018;

with t1 as(
	select percentile_disc(0.5) within group (order by locations_geographicarea.median_home_value) as val1
	from locations_geographicarea  where area_type = 'TRACT' and year=2013
), t2 as(
	select percentile_disc(0.5) within group (order by locations_geographicarea.median_household_income) as val2
	from locations_geographicarea  where area_type = 'TRACT' and year=2013
)
select name, median_home_value, median_household_income, percent_college_educated from locations_geographicarea where 
	median_home_value<=(select val1 from t1) and
	median_household_income<=(select val2 from t2) and
	total_population>=500 and
	area_type = 'TRACT' and 
	year=2013
order by median_household_income DESC; 

select percentile_disc(0.6) within group (order by locations_geographicarea.median_household_income) as val2
from locations_geographicarea  where area_type = 'TRACT' and year=2018

select k, percentile_disc(k) within group (order by locations_geographicarea.median_home_value)
from locations_geographicarea, generate_series(0.01, 1, 0.1) as k where area_type = 'TRACT' and year=2013
group by k;

select count(*) from locations_geographicarea where area_type = 'TRACT' and year=2018;
select count(*) from locations_geographicarea where area_type = 'TRACT' and year=2013;

select geo_id, median_home_value, median_household_income, percent_college_educated, geom as geometry from locations_geographicarea where 
	median_home_value<=166300 and
	median_household_income<=50323 and 
	total_population>=500 and
	area_type = 'TRACT' and 
	year=2013
order by median_household_income DESC; 

select geo_id, median_home_value, median_household_income, percent_college_educated, geom as geometry from locations_geographicarea where 
	median_home_value>=212100 and
	median_household_income>=61154 and 
	total_population>=500 and
	area_type = 'TRACT' and 
	year=2018
order by median_household_income DESC; 

select name, split_part(name,',',3) from locations_geographicarea where area_type='COUSUB' and "year"=2018 and ST_INTERSECTS((select geom from locations_geographicarea where geo_id='10' and "year"=2018), locations_geographicarea.geom);

with  
	t1 as (
	select geom, "name", geo_id, year, median_household_income, total_population, score
	from locations_geographicarea where
	area_type='BG' and year='2018' and ST_INTERSECTS((select geom from locations_geographicarea where geo_id='10' and "year"=2018), locations_geographicarea.geom);
), t2 as (
	select geom, "name", geo_id, year, median_household_income, total_population, score
	from locations_geographicarea where
	area_type='BG' and year='2013' and ST_INTERSECTS((select geom from locations_geographicarea where geo_id='10' and "year"=2013), locations_geographicarea.geom);
)
select t1.geo_id, 
	   t1.name, 
	   split_part(t1.name,',',3),
	   t1.geom as geometry,
	   t1.score,
	   t1.median_household_income-t2.median_household_income as income_change,
	   t1.total_population-t2.total_population as pop_change,
	   round((cast((t1.median_household_income-t2.median_household_income) as numeric)/cast(t2.median_household_income as numeric)*100),2) as income_percent_change,
	   round((cast((t1.total_population-t2.total_population) as numeric)/cast(t2.total_population as numeric)*100),2) as pop_percent_change
from t1 as t1, t2 as t2 where t1.name=t2.name and t1.median_household_income>0 and t2.total_population>0;

select name,score from locations_geographicarea where area_type='STATE' and year=2018 order by score DESC;

select score,
round(cast(percentile_disc(0.5) within group (order by locations_geographicarea.rent_to_price_ratio) as numeric),2) as median_rent_to_price_ratio,
round(cast(percentile_disc(0.5) within group (order by locations_geographicarea.median_gross_rent)*12*0.5/percentile_disc(0.5) 
within group (order by locations_geographicarea.median_home_value) as numeric),3)*100 as median_cap_rate
from locations_geographicarea where area_type='TRACT' and "year"=2018 and
score is not null group by score order by score;

select year,area_type from locations_geographicarea group by year,area_type;


select total_housing_units,total_occupied_housing_units, renter_occupied_units,vacant_total,vacant_for_rent
from locations_geographicarea where geo_id='01' and "year"=2018

select 
count(geo_id) as sample_size,
round(cast(vacant_rentals_percentage as numeric),3)*100 as vacancy_percentage,
round(cast(percentile_disc(0.5) within group (order by locations_geographicarea.median_gross_rent)*12*0.5/percentile_disc(0.5) 
within group (order by locations_geographicarea.median_home_value) as numeric),3)*100 as median_cap_rate,
round(cast(percentile_disc(0.5) within group (order by locations_geographicarea.rent_to_price_ratio) as numeric),2) 
as median_rent_to_price_ratio
from locations_geographicarea where area_type='TRACT' and "year"=2018 and vacant_rentals_percentage>0
group by vacancy_percentage order by vacancy_percentage asc;

select count(*) from locations_geographicarea where area_type='TRACT' and "year"=2018 and vacant_rentals_percentage>0;
select count(*) from locations_geographicarea where area_type='TRACT' and "year"=2018;
select count(*) from locations_geographicarea where area_type='TRACT' and "year"=2013;

select geo_id, round(cast(vacant_rentals_percentage as numeric),2)*100 as vacancy_percentage,
median_gross_rent, median_home_value
from locations_geographicarea where area_type='TRACT' and "year"=2018 and vacant_rentals_percentage>0.96;

select name, vacant_rentals_percentage from locations_geographicarea 
where "year"=2018 and area_type='STATE' order by vacant_rentals_percentage;

select avg(vacant_rentals_percentage),
percentile_disc(0.5) within group (order by locations_geographicarea.vacant_rentals_percentage)
from locations_geographicarea 
where "year"=2018 and area_type='STATE' group by area_type;

select k, percentile_disc(k) within group (order by locations_geographicarea.median_home_value)
from locations_geographicarea, generate_series(0.01, 1, 0.1) as k where area_type = 'TRACT' and year=2013
group by k;

select geo_id, name from locations_geographicarea where area_type='COUSUB' and "year"=2018 and name like 'Cleveland%';

select geom, geo_id, median_gross_rent, score
from locations_geographicarea where
area_type='TRACT' and year='2018' and ST_INTERSECTS((select geom from locations_geographicarea where geo_id='3903516014' 
and "year"=2018), locations_geographicarea.geom);

select name, total_population from locations_geographicarea where area_type='COUNTY' and "year"=2018 order by total_population desc limit 100;

select * from django_migrations where app='locations';

delete from locations_geographicarea
where id in (
	select lg.id from locations_geographicarea lg
	join locations_geographicareameta lgm on lg.meta_id = lgm.id
	where lgm.area_type = 'HOOD'
);
delete from locations_geographicareameta where area_type = 'HOOD';
--
--
--delete from locations_geographicarea;
--delete from locations_geographicareameta;	


select * from locations_geographicareameta where area_type='AREAWATER';



select geom from locations_geographicarea where
select count(geom) from locations_geographicarea where 
year=2018 and area_type='TRACT';

select geo_id, "name", total_population, geom as geometry from locations_geographicarea where 
year=2018 and area_type='TRACT';

select vacant_for_rent, vacant_for_sale, vacant_rentals_percentage, vacant_for_sale_percentage from locations_geographicarea where geo_id='01'

select * from locations_geographicareameta where area_type='HOOD'

SELECT geo_id,area_type,"name",total_population
   
select lgm.name, lg.total_population from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type = 'HOOD';

select * from locations_geographicareameta where area_type='AREAWATER';


select lgm.geo_id, lg.geom from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type = 'TRACT' and st_isvalid(lg.geom)=False;

select lgm.geo_id, lgm."name" from locations_geographicarea lg join locations_geographicareameta lgm on lg.meta_id = lgm.id where lgm.area_type = 'COUNTY' and lgm."name" like 'Suf%'

with t1 as(
select lg.geom as geom
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.geo_id='39035121900'
)
select lg.id as id, lg.geom as geom from t1, locations_geographicarea as lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='AREAWATER' and ST_INTERSECTS(lg.geom, t1.geom)

select count(*)
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='PLACE' or lgm.area_type='HOOD' and lg."year"=2018;

select 
	lgm.geo_id,
	lgm.name,
	round(cast(lg.cap_rate as numeric), 2)
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='PLACE' and lg.year=2018 order by total_population desc limit 100;

select 
	lgm.geo_id,
	lgm.name,
	lg.median_household_income,
	lg.non_poverty_percentage,
	lg.non_snaps_percentage,
	lg.percent_college_educated,
	lg.percentage_occupied_housing_units,
	total_population
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='TRACT' and lg.year=2018 and lgm.geo_id='39055311000';



with  
	t1 as (
	select lgm.geo_id,lgm."name",lg.score,lg.raw_score,
	lg.total_population,
	lg.median_household_income,
	lg.percentage_owner_occupied_units,
	lg.percentage_occupied_housing_units,
	lg.percent_college_educated,
	lg.non_snaps_percentage,
	lg.non_poverty_percentage,
	lg.income_to_rent_ratio
	from locations_geographicarea lg
	join locations_geographicareameta lgm on lg.meta_id = lgm.id
	where lgm.area_type='TRACT' and lg.year=2018
), t2 as (
	select lgm.geo_id,lgm."name",lg.score,lg.raw_score,
	lg.median_household_income,
	lg.percentage_occupied_housing_units,
	lg.percent_college_educated,
	lg.non_poverty_percentage
	from locations_geographicarea lg
	join locations_geographicareameta lgm on lg.meta_id = lgm.id
	where lgm.area_type='TRACT' and lg.year=2013
)
select 
t1.geo_id,
t1.name,
t1.score,
t1.raw_score,
t1.total_population,
t1.median_household_income,
t1.percentage_occupied_housing_units,
t1.percent_college_educated,
t1.non_snaps_percentage,
t1.non_poverty_percentage
--round((cast((t1.median_household_income-t2.median_household_income) as numeric)/cast(t2.median_household_income as numeric)*100),2) as median_household_income_5yr_change,
--round((cast((t1.percentage_occupied_housing_units-t2.percentage_occupied_housing_units) as numeric)/cast(t2.percentage_occupied_housing_units as numeric)*100),2) as percentage_occupied_housing_units_5yr_change,
--round((cast((t1.percent_college_educated-t2.percent_college_educated) as numeric)/cast(t2.percent_college_educated as numeric)*100),2) as percent_college_educated_5yr_change,
--round((cast((t1.non_poverty_percentage-t2.non_poverty_percentage) as numeric)/cast(t2.non_poverty_percentage as numeric)*100),2) as non_poverty_percentage_5yr_change
from t1 as t1, t2 as t2 where t1.name=t2.name and t1.geo_id like '39035%' order by t1.raw_score DESC;


select * from blog_post;

select geom, "name", geo_id, year
from locations_geographicarea where
area_type='BG' and year='2013' and ST_INTERSECTS((select geom from locations_geographicarea where geo_id='10' and "year"=2013), locations_geographicarea.geom);

select lgm.geo_id,lgm."name"
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='CBSA' and lg.year=2018 and lgm."name" like '%Cleveland%';


select "name",score, median_year_built, percentage_occupied_housing_units,geom as geometry
from locations_geographicarea 
WHERE ST_Contains((select geom from locations_geographicarea where geo_id='36103'), locations_geographicarea.geom) 
or ST_Contains((select geom from locations_geographicarea where geo_id='36059'), locations_geographicarea.geom)
and area_type='BG'
order by price_to_rent ASC;


select geom from locations_geographicarea where geo_id = '36103' or geo_id='36059';

select name, geo_id, geom from locations_geographicarea  where name like 'Nassau County%';


with t as (
	select name, split_part(name, ',',2) as state, score, median_gross_rent, median_home_value, rent_to_price_ratio, cap_rate, raw_score,
	median_gross_rent*0.5-(median_home_value*0.8*((0.04125/12)/(1-(1+(0.04125/12))^(-12*30)))) as cashflow
	from locations_geographicarea
	where area_type='COUNTY' and year=2018 
)
select state, avg(cashflow),avg(raw_score) from t
group by state
order by avg(cashflow) DESC;
--select * from t 
--where cashflow>0
--order by cashflow DESC;

select year,avg(median_home_value),avg(median_gross_rent),avg(cap_rate),avg(rent_to_price_ratio) from locations_geographicarea where area_type='COUSUB' and geo_id='4845390165' group by "year" order by year ASC;

select name, geo_id from locations_geographicarea where name like 'Boise %' and area_type='COUSUB' and year=2018;

select name, median_home_value from locations_geographicarea where area_type='TRACT' and median_home_value<=50000;

select name, geo_id from locations_geographicarea where area_type='STATE' order by name;

select "name",score, median_year_built, percentage_occupied_housing_units,geom as geometry;

with  
	t1 as (
	select "name", year, split_part(name, ',',2) as state, total_population, score, rent_to_price_ratio
	from locations_geographicarea
	WHERE ST_Intersects((select geom from locations_geographicarea where geo_id='24' and year=2018), locations_geographicarea.geom) and 
	area_type='COUNTY' and year='2018'
), t2 as (
	select name, year, split_part(name, ',',2) as state, total_population, score
	from locations_geographicarea
	WHERE ST_Intersects((select geom from locations_geographicarea where geo_id='24' and year=2018), locations_geographicarea.geom) and 
	area_type='COUNTY' and year='2014'
)
select t1.name, 
	   t1.score,
	   round(cast(t1.rent_to_price_ratio as numeric),2) as rent_to_price_ratio,
	   t1.total_population as pop_2018, 
	   t2.total_population as pop_2014, 
	   t1.total_population-t2.total_population as pop_change,
	   round(((CAST(t1.total_population as numeric)-cast(t2.total_population as numeric))/cast(t2.total_population as numeric))*100,2) as pop_change_percent
from t1 as t1, t2 as t2 where t1.name=t2.name
order by pop_change_percent DESC;



select * from
t1 where t1.state=' Maryland' 
union select * from t2
WHERE t2.state=' Maryland'
order by name,year desc;

select count(name)
from locations_geographicarea
WHERE ST_Intersects((select geom from locations_geographicarea where geo_id='24' and year=2018), locations_geographicarea.geom) and 
area_type='COUNTY' and year='2018'

select name,geo_id from locations_geographicarea where area_type='STATE' order by name DESC;

select  
replace(split_part(name, ',',1),'CCD',''), 
split_part(name, ',',3) as state, 
score,
total_population,
median_home_value,
median_gross_rent,
round(cast(rent_to_price_ratio as numeric),2) as price_to_rent,
geom as geometry 
from locations_geographicarea
WHERE 
ST_Intersects((select st_union(geom) as geom from locations_geographicarea where geo_id='04' or geo_id='06' or geo_id='32' and year='2018'), locations_geographicarea.geom)
and area_type='COUSUB' and year='2018' and total_population>25000 and split_part(name, ',',3) in (' Arizona',' California', ' Nevada')
order by median_home_value ASC;

select st_union(geom) as geom from locations_geographicarea where geo_id='04' or geo_id='06' or geo_id='32' and year='2018';

select name,geom as geom from locations_geographicarea where (geo_id='04' or geo_id='06' or geo_id='32') and year='2018';

select name,geom as geom from locations_geographicarea where geo_id='1600190345' and year='2018';

select * from accounts_user order by date_joined;
select * from djstripe_customer;
select * from djstripe_subscription where status in ('active', 'trialing', 'past_due');
select * from accounts_user order by last_login DESC;

select * from accounts_user where id=62;
--update accounts_user set is_active=true where id=62;

select name, geo_id, geom from locations_geographicarea  where name like 'Lakewood %' and year=2018 and area_type='COUSUB';
select name,geom from locations_geographicarea where geo_id='3903541664' and "year"=2018

select name, score, geom as geometry 
from locations_geographicarea
WHERE ST_Intersects((select geom from locations_geographicarea where geo_id='3903541664' and "year"=2018), locations_geographicarea.geom)
and area_type='BG' and year='2018';

select name,score,rent_to_price_ratio,total_population from locations_geographicarea  where year=2010 and area_type='COUSUB' and total_population>=100000 and score in ('A','B','C') order by rent_to_price_ratio DESC;

with  
	t1 as (
	select "name", year, median_home_value, rent_to_price_ratio, score, total_population
	from locations_geographicarea where
	area_type='COUSUB' and year='2018' and total_population>=50000
), t2 as (
	select name, year, median_home_value
	from locations_geographicarea where
	area_type='COUSUB' and year='2010' and total_population>=50000
)
select t1.name, 
	   t1.score,
	   t1.total_population,
	   round(cast(t1.rent_to_price_ratio as numeric),2) as rent_to_price_ratio,
	   t2.median_home_value-t1.median_home_value as median_appreciation ,
	   round(((CAST(t2.median_home_value as numeric)-cast(t1.median_home_value as numeric))/cast(t1.median_home_value as numeric))*100,2) as appreciation_percent 
from t1 as t1, t2 as t2 where t1.name=t2.name;

select name,score,raw_score,population_for_poverty from locations_geographicarea where median_gross_rent=1159 and median_home_value=230500 and area_type='BG';

select score, avg(raw_score), stddev(raw_score) from locations_geographicarea where score in ('D','C' )and area_type='BG' group by score;


select score,
round(cast(percentile_disc(0.5) within group (order by locations_geographicarea.rent_to_price_ratio) as numeric),2) as median_rent_to_price_ratio,
round(cast(percentile_disc(0.5) within group (order by locations_geographicarea.median_gross_rent)*12*0.5/percentile_disc(0.5) 
within group (order by locations_geographicarea.median_home_value) as numeric),3)*100 as median_cap_rate
from locations_geographicarea where area_type='TRACT' and "year"=2018 and
score is not null group by score order by score;

select lgm.geo_id,lgm."name",
lg.renter_occupied_units,
lg.vacant_rented_not_occupied,
lg.vacant_for_rent,
cast(lg.vacant_for_rent as numeric)/(cast(lg.vacant_rented_not_occupied as numeric)+cast(lg.vacant_for_rent as numeric)+cast(lg.renter_occupied_units as numeric))
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='REGION' and 
ST_Contains((select geom from locations_geographicarea where geo_id='36103'), locations_geographicarea.geom) 
and lg.year=2018 order by lgm."name";

select distinct area_type
from locations_geographicareameta;


select cast(lgm.geo_id as int) as GEO_ID, lgm.name, lg.total_population, lg.geom from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lg.year='2019' and lgm.area_type = 'CBSA' and lgm."name" like '%Cleveland%';

select cast(lgm.geo_id as int) as GEO_ID, lgm.name, lg.total_population, lg.geom from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='TRACT' and lg."year"='2019' and ST_INTERSECTS(
	(
		select geom from locations_geographicarea lg
		join locations_geographicareameta lgm on lg.meta_id = lgm.id 
		where geo_id='17460' and "year"=2019
	), locations_geographicarea.geom
);

select * from djstripe_plan;

with  
	t1 as (
	select cast(lgm.geo_id as int) as GEO_ID, lgm.name, lg.total_population, lg.geom, lg.median_home_value, lg.median_gross_rent from locations_geographicarea lg
	join locations_geographicareameta lgm on lg.meta_id = lgm.id
	where lg.year='2011' and lgm.area_type = 'STATE'
), t2 as (
	select cast(lgm.geo_id as int) as GEO_ID, lgm.name, lg.total_population, lg.geom, lg.median_home_value, lg.median_gross_rent from locations_geographicarea lg
	join locations_geographicareameta lgm on lg.meta_id = lgm.id
	where lg.year='2008' and lgm.area_type = 'STATE'
)
select 
	t1.GEO_id,
	t1.name, 
	t1.geom,
	t1.median_home_value as hv2010,
	t1.median_gross_rent as mr2010,
	t2.median_home_value as hv2007,
	t2.median_gross_rent as mr2007
from t1 as t1, t2 as t2 where t1.GEO_ID=t2.GEO_ID;

select lgm.name, lg.year, lg.total_population, lg.median_contract_rent, lg.median_home_value, lg.median_home_value/(lg.median_contract_rent*12) as price_to_rent_ratio
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='PLACE' and "year"=2019 order by lg.total_population desc limit 100;

select lgm.geo_id, lgm."name", lg.total_population, lg.median_contract_rent, lg.median_home_value
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='TRACT' 
and ST_Contains((select lg.geom from locations_geographicarea lg join locations_geographicareameta lgm on lg.meta_id = lgm.id where lg."year" = 2019 and lgm.geo_id='3916000'
), locations_geographicarea.geom) 
and lg.year=2019 order by lgm."name";

select lg.geom from locations_geographicarea lg join locations_geographicareameta lgm on lg.meta_id = lgm.id where lg."year" = 2019 and lgm.geo_id='3916000'

select lg.geom as geometry, lgm.geo_id, lgm."name", lg.total_population, lg.median_contract_rent, lg.median_home_value
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='HOOD'
and ST_Intersects((select lg.geom from locations_geographicarea lg join locations_geographicareameta lgm on lg.meta_id = lgm.id where lg."year" = 2019 and lgm.geo_id='3916000'
), lg.geom)
and lg.year=2018 order by lgm."name";

select AVG(lg.median_household_income)
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='STATE' and lg.year=2019

select  avg(cast(lg.median_home_value as numeric)/(cast(lg.median_contract_rent as numeric) * 12)) as price_to_rent
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='PLACE' and lg."year"=2019 and lg.total_population<100000;

select  lg.year, avg(median_contract_rent), avg(median_home_value)
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='PLACE' and lg.total_population>100000 
group by lg."year"
order by lg.year;

select  lg.year, lg.score, round(avg(median_contract_rent)/avg(median_home_value),4)*100 as "rent to price ratio"
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lgm.area_type='COUSUB'
group by lg.year, lg.score
order by lg.year, lg.score;


select distinct area_type from locations_geographicareameta;

select  lgm.geo_id, lgm.name, lg.total_population, lg.geom
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lg.year=2019 and lgm.area_type='PLACE';

select  
	lgm.geo_id, 
	lg.median_contract_rent, 
	lg.median_home_value,
	lg.percent_college_educated,
	lg.median_household_income,
	lg.median_year_built,
	lg.percent_poverty,
	lg.percentage_renter_occupied_units,
	lg.percentage_vacant_housing_units,
	lg.rent_to_income_ratio,
	lg.rent_to_price_ratio,
	lg.cap_rate,
	lg.score,
	lg.geom
from locations_geographicarea lg
join locations_geographicareameta lgm on lg.meta_id = lgm.id
where lg.year=2019 and lgm.area_type='TRACT' limit 100;

select * from accounts_user;

select name,geom from locations_geographicarea where geo_id='3903541664' and "year"=2012;

update locations_geographicarea set year=year+1;

select name,geom as geom from locations_geographicarea where geo_id='1600190345' and year='2017';

select * from locations_geographicarea where year=2018;

select name, year, geo_id, geom from locations_geographicarea where area_type='COUSUB' and "year"=2016;

delete from locations_geographicarea;

select name,year,raw_score,score from locations_geographicarea where "name" like 'Cuyahoga%' and area_type='COUNTY' order by year DESC;

select geo_id, year, total_population from locations_geographicarea where geo_id='23021';

select name,geom from locations_geographicarea where geo_id='3903541664' and "year"=2018

select name,geom as geom from locations_geographicarea where geo_id='1600190345' and year='2017';

select geo_id, name, score, geom as geometry from locations_geographicarea WHERE ST_Intersects((select geom from locations_geographicarea where geo_id='3903541664' 
and "year"=2018), locations_geographicarea.geom)and area_type='BG' and year='2018';


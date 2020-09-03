select * from "data" limit 5;
select * from series limit 5;
select * from areas;
select * from states;
select * from supersectors;
select * from data_types;

select * from census_employment where gat='TRACT';

with
  t1 as (
	  select 
			state.state_name as state,
--			dat.series_id as series_id,
			area.area_name as name,
			area.area_code as code,
			dat.year as year,
			dat."period" as "period",
			super.supersector_name as supersector,
		--	ins.industry_name,
			round(cast(sum(dat.value) as numeric),1) as val
		from "data" dat 
		join series ser on dat.series_id = ser.series_id
		join states state on ser.state_code = state.state_code
		join areas area on ser.area_code = area.area_code
		join supersectors super on ser.supersector_code = super.supersector_code
		join industries ins on ser.industry_code = ins.industry_code
		where 
		area.area_code != '00000' and
		ser.industry_code in (
			'41000000',
			'42000000',
			'43000000',
			'50000000',
			'55000000',
			'60000000',
			'65000000',
			'70000000',
			'80000000',
			'30000000',
			'90000000',
			'15000000'
		 ) and
		dat.year=2007 and
		dat."period" in ('M12') and
		ser.data_type_code = '01' and
		ser.seasonal='U'
		group by super.supersector_name, dat."period", area.area_name, dat."year", area.area_code, state.state_name
	), t2 as (
		select 
			state.state_name as state,
--			dat.series_id as series_id,
			area.area_name as name,
			area.area_code as code,
			dat.year as year,
			dat."period" as "period",
			super.supersector_name as supersector,
		--	ins.industry_name,
			round(cast(sum(dat.value) as numeric),1) as val
		from "data" dat 
		join series ser on dat.series_id = ser.series_id
		join states state on ser.state_code = state.state_code
		join areas area on ser.area_code = area.area_code
		join supersectors super on ser.supersector_code = super.supersector_code
		join industries ins on ser.industry_code = ins.industry_code
		where 
		area.area_code != '00000' and
		ser.industry_code in (
			'41000000',
			'42000000',
			'43000000',
			'50000000',
			'55000000',
			'60000000',
			'65000000',
			'70000000',
			'80000000',
			'30000000',
			'90000000',
			'15000000'
		 ) and
		dat.year=2010 and
		dat."period" in ('M01') and
		ser.data_type_code = '01' and
		ser.seasonal='U'
		group by super.supersector_name, dat."period", area.area_name, dat."year", area.area_code, state.state_name
	)
select
	t1.state,
	t1.name,
	t1.code,
	t1.supersector,
	t2.val - t1.val as delta,
 	CASE
		WHEN t1.val>0 THEN 	round((t2.val-t1.val)/t1.val,3)*100 
		ELSE 0
 	END as percent_change,
	t1.val as march,
	t2.val as april
from t1 as t1, t2 as t2 where t1.supersector=t2.supersector and t1.name = t2.name and t1.state=t2.state
order by percent_change;

select 
	state.state_name as state,
	round(cast(sum(dat.value) as numeric),1) as val,
--	area.area_name as name,
--	area.area_code as code,
	dat.year as year,
	dat."period" as "period"
--	super.supersector_code,
--	super.supersector_name as supersector,
--	ser.industry_code, 
--	ins.industry_name
from "data" dat 
join series ser on dat.series_id = ser.series_id
join states state on ser.state_code = state.state_code
join areas area on ser.area_code = area.area_code
--join supersectors super on ser.supersector_code = super.supersector_code
join industries ins on ser.industry_code = ins.industry_code
where 
	area.area_code = '00000' and
--	dat.year=2020 and
--	dat."period" in ('M02') and
	ser.industry_code in (
		'41000000',
		'42000000',
		'43000000',
		'50000000',
		'55000000',
		'60000000',
		'65000000',
		'70000000',
		'80000000',
		'30000000',
		'90000000',
		'15000000'
	 ) and
	ser.data_type_code = '01' and
	ser.seasonal='U'
group by state, dat."period", dat.year;
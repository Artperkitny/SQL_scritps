select * from portfolio_portfolios;
select * from portfolio_transactions;
select * from portfolio_securityvalues;
select * from portfolio_securities order by name desc;

select * from portfolio_portfolios;

--delete from portfolio_qboauth;

select port.name, count(*) 
from portfolio_transactions trans
join portfolio_securities sec on sec.id = trans.security_id_id
join portfolio_portfolios port on port.id = trans.portfolio_id
group by port."name";

select * 
from portfolio_transactions trans
join portfolio_securities sec on sec.id = trans.security_id_id
join portfolio_portfolios port on port.id = trans.portfolio_id
where sec."name"='LINE';

select * from portfolio_securityvalues as vals
join portfolio_securities sec on sec.id = vals.security_id_id
where sec."name"='FB' and vals.type = 'Open' order by date desc;

delete from portfolio_securityvalues where "date"='2020-05-22';

--delete from portfolio_securities where id=99;


select * from test;

create table test (
	col_1 INT,
	col_2 INT
);

select 
sec."name", 
MAX(vals."date") as max_date,
MIN(vals."date") as min_date,
MAX(vals."date") - MIN(vals."date") +1 as days_diff,
count(*)/4 as count_entries,
count(*)/4  - (MAX(vals."date") - MIN(vals."date") + 1) as missing
from portfolio_securityvalues vals
join portfolio_securities sec on sec.id = vals.security_id_id
group by sec."name"
order by max_date DESC;

SELECT pg_size_pretty( pg_database_size('finance') );

select 
sec."name",
vals."date",
count(*)
from portfolio_securityvalues vals
join portfolio_securities sec on sec.id = vals.security_id_id
where sec.name = 'ESV'
group by sec."name", vals."date"
order by vals."date" DESC;

select 
*
from portfolio_securityvalues vals
join portfolio_securities sec on sec.id = vals.security_id_id
where sec.name = 'SPY' and vals."date"='2014-04-30'
order by vals."date" DESC;

delete from portfolio_securities where "name"='CCC'

delete from portfolio_securityvalues
USING portfolio_securities
where portfolio_securityvalues.security_id_id = portfolio_securities.id 
and portfolio_securities.name = 'LINE';

delete from portfolio_transactions;

select * from portfolio_transactions;
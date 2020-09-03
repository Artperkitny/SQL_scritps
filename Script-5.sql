select * from portfolio_securityvalues order by date desc;
select * from portfolio_securities order by name asc;
select * from portfolio_timeseriesvalues;
--delete from portfolio_securityvalues;
--delete from portfolio_securities where "name"='Cash';

insert into portfolio_timeseriesvalues (date, 
				value, type, portfolio_id, security_id_id) VALUES ('1/1/2000', 1, 'No', 44, 438);
delete from portfolio_timeseriesvalues;
			
			
select * from portfolio_securities order by name desc;
select *  from portfolio_transactions;
select * from portfolio_portfolios;
select * from portfolio_qboauth;

insert into portfolio_qboauth (access_token, date, refresh_token) values (
		'eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..tHNswTaMecO060smqg_Mww.QwXiZ4e5xx5U7OVNaOpP9mypwQ_8_PTb_jk07iP7pv7wJnA7EJvduMXVPeCvxa4caMrDrv4uFzHNewGvduIoPU_2v7lJ7gzFssOpQgWovH_f6XAA90-4hejGWTfEbBw-w3xsYHAyUi_J9Ck1prcKSmHNDw3vecsVDqmZXEIL_WyDLitqsqAMoQOl_kJXAj1gL7VLa_Zo-1D8rODpL0tAxXxshPvqncPmlg_Wp-dQDMcFvIq7ASPDp07025yoa5qEprBp-eQsVKb_hG1Gf4731imaE4jIWo2EYlEUTMoyTq9-LZ3gm6N3rIebb9MOg_9TqFSlDh2U3_vu332WiK4UXpNChiUzYOvzSndpQPrp3xlp0Mk25UCXsWnLZOPigAFfPSLNjeNaQtd9XYZolVj6udwSu6mcPzW85UOLvrgKlA45V4soUzvFBY1WlwOJEvsx0NUhlgMLnXtV9qw1YkVsv_gyh5nopeIAW9Ol92nle4KhB5PTLHXlH5k77C4i0GRZjnYmlviZTT8dHTlQq6oJUGpk3XyW2NByUKbI8qWHkBma6eLW1wCZFOX4zpvFA-Mjhw3RzvOjACPk6bXBA_OBNM1Mc9LSAHuQg5RVSOsfXwYM7ussel3E_pNjrAjcCmQfRsV4oqckn7VjJnUfo2dt5OyFLd96_ve6VcQdlixXGhXcvzDzq5iXZ610DbXca2h_82ZM2mw1rot3kQ9BfxWuKbkXYLQdAOuTEI1CzQqE41E.EbL-8nT_H9_IXvxSsR-Vbw',
		'6/11/2020',
		'AB11601092945D5l2F20C4Nw2X1LvhR5z9VBfZYrdMpJjgrS2R');


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
order by sec.name ASC;

select date,value,name from portfolio_securityvalues as vals
join portfolio_securities sec on sec.id = vals.security_id_id
where sec."name" in ('EUFN','ITB','SPY','VZ','XPH') and
vals."type" = 'Close' and
vals."date">'2013-12-30'
order by date desc;

select * 
from portfolio_transactions trans
join portfolio_securities sec on sec.id = trans.security_id_id
join portfolio_portfolios port on port.id = trans.portfolio_id
where port."name"='Raymond James Art Personal';

--delete from portfolio_transactions
--USING portfolio_portfolios
--where portfolio_transactions.portfolio_id = portfolio_portfolios.id 
--and portfolio_portfolios."name"='Raymond James Joint';



select * from geo2;

--Alter table  geo alter column geom type geometry (multipolygon);

--drop table geo;

--delete from geo;

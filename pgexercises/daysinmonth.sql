-- For each month of the year in 2012, output the number of days in that month. Format the output as an integer column containing the month of the year, and a second column containing an interval data type.
select 
	date_month,
	extract(days from ( ('2012-' || date_month || '-01 00:00:00')::timestamp + interval '1 month') - 
			 ('2012-' || date_month || '-01 00:00:00')::timestamp ) || ' days'
from generate_series(1,12) as date_month

-- answer from site
select 	extract(month from cal.month) as month,
	(cal.month + interval '1 month') - cal.month as length
	from
	(
		select generate_series(timestamp '2012-01-01', timestamp '2012-12-01', interval '1 month') as month
	) cal
order by month;
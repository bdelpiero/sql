-- Based on the 3 complete months of data so far, calculate the amount of time each facility will take to repay its cost of ownership. Remember to take into account ongoing monthly maintenance. Output facility name and payback time in months, order by facility name. Don't worry about differences in month lengths, we're only looking for a rough value here!
with rev as (
    select name,
        sum(
            slots * (
                case
                    when memid = 0 then guestcost
                    else membercost
                end
            )
        ) / 3 monthlyrevenue
    from cd.facilities f
        inner join cd.bookings b on b.facid = f.facid
    group by f.name
)
select rev.name,
    initialoutlay / (rev.monthlyrevenue - monthlymaintenance) months
from rev
    inner join cd.facilities f on rev.name = f.name
order by f.name;

-- site solution with subq

select 	name, 
	initialoutlay / (monthlyrevenue - monthlymaintenance) as repaytime 
	from 
		(select facs.name as name, 
			facs.initialoutlay as initialoutlay,
			facs.monthlymaintenance as monthlymaintenance,
			sum(case
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end)/3 as monthlyrevenue
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.facid
	) as subq
order by name;
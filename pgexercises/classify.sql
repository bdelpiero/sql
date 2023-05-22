-- Classify facilities into equally sized groups of high, average, and low based on their revenue. Order by classification and facility name.
select name,
    (
        case
            when ranking = 1 then 'high'
            when ranking = 2 then 'average'
            else 'low'
        end
    ) revenue
from (
        select name,
            ntile(3) over(
                order by sum(
                        case
                            when memid = 0 then slots * guestcost
                            else slots * membercost
                        end
                    ) desc
            ) as ranking
        from cd.bookings bks
            inner join cd.facilities facs on bks.facid = facs.facid
        group by name
    ) as subq
order by ranking,
    name;
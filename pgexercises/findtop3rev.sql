-- Produce a list of the top three revenue generating facilities (including ties). Output facility name and rank, sorted by rank and facility name.
-- using limit 3, kind of hacky
select name,
    rank() over(
        order by revenue desc
    ) as ranking
from (
        select f.name,
            sum(
                slots * (
                    case
                        when b.memid = 0 then f.guestcost
                        else f.membercost
                    end
                )
            ) revenue
        from cd.facilities f
            inner join cd.bookings b on b.facid = f.facid
        group by f.name
        order by revenue desc
        limit 3
    ) as subq 
    
-- solution from site
-- can filter using where, as the ranking is returned from subquery
select name,
    rank
from (
        select facs.name as name,
            rank() over (
                order by sum(
                        case
                            when memid = 0 then slots * facs.guestcost
                            else slots * membercost
                        end
                    ) desc
            ) as rank
        from cd.bookings bks
            inner join cd.facilities facs on bks.facid = facs.facid
        group by facs.name
    ) as subq
where rank <= 3
order by rank;
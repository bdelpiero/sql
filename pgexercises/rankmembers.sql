-- Produce a list of members (including guests), along with the number of hours they've booked in facilities, rounded to the nearest ten hours. Rank them by this rounded figure, producing output of first name, surname, rounded hours, rank. Sort by rank, surname, and first name.

with booked_hours as (
    select firstname,
        surname,
        sum(slots) / 2 as hours
    from cd.members m
        inner join cd.bookings b on b.memid = m.memid
    group by firstname,
        surname
)
select firstname,
    surname,
    round(hours, -1),
    rank() over(
        order by round(hours, -1) desc
    )
from booked_hours
order by rank,
    surname,
    firstname;

-- solution from site:
select firstname, surname, hours, rank() over (order by hours desc) from
	(select firstname, surname,
		((sum(bks.slots)+10)/20)*10 as hours

		from cd.bookings bks
		inner join cd.members mems
			on bks.memid = mems.memid
		group by mems.memid
	) as subq
order by rank, surname, firstname;
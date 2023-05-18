-- Produce a list of the total number of slots booked per facility per month in the year of 2012. In this version, include output rows containing totals for all months per facility, and a total for all months for all facilities. The output table should consist of facility id, month and slots, sorted by the id and month. When calculating the aggregated values for all months and all facids, return null values in the month and facid columns.
-- awful solution (mine)
select
    facid,
    extract (
        month
        from
            starttime
    ) as "month",
    sum(slots) as slots
from
    cd.bookings
where
    extract (
        year
        from
            starttime
    ) = '2012'
group by
    facid,
    "month"
union
(
    select
        facid,
        null,
        sum(slots)
    from
        cd.bookings
    where
        extract (
            year
            from
                starttime
        ) = '2012'
    group by
        facid
)
union
(
    select
        null,
        null,
        sum(slots)
    from
        cd.bookings
    where
        extract (
            year
            from
                starttime
        ) = '2012'
)
order by
    facid,
    month;

-- improved - using CTE
with bookings as (
	select facid, extract(month from starttime) as month, slots
	from cd.bookings
	where
		starttime >= '2012-01-01'
		and starttime < '2013-01-01'
)
select facid, month, sum(slots) from bookings group by facid, month
union all
select facid, null, sum(slots) from bookings group by facid
union all
select null, null, sum(slots) from bookings
order by facid, month;

-- using rollup, which produces a hierarchy of aggregations in the order passed into it: for example, ROLLUP(facid, month) outputs aggregations on (facid, month), (facid), and ().
select facid, extract(month from starttime) as month, sum(slots) as slots
	from cd.bookings
	where
		starttime >= '2012-01-01'
		and starttime < '2013-01-01'
	group by rollup(facid, month)
order by facid, month;
{{
    config(
        materialized='ephemeral'
    )
}}

select a.coachid , count(award) rn
from hockeydb.hockey.awardscoaches a
join hockeydb.hockey.coaches c
on a.coachid = c.coachid and a.year = c.year
group by a.coachid 
order by 2 desc
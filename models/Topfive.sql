{{ config(materialized="table") }}

with
    cte as (
        select
            b.name as teamname,
            a.year,
            sum(a.g) as no_of_goals,
            row_number() over (partition by a.year order by sum(a.g) desc) as top_5
        from hockeydb.hockey.scoring a
        join hockeydb.hockey.teams b on a.tmid = b.tmid
        where a.year = 2011
        group by b.name, a.year
    )
select teamname, year, no_of_goals
from cte
where top_5 <= 5

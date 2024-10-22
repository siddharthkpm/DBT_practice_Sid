
select * from 
{{ ref('emphemeraltest') }}
where rn >= 5


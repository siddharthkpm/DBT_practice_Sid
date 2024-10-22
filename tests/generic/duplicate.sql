{% test duplicate_checking(model,columns) %}
    with AA as
    (
        select {{ columns | join(', ') }}, count(*) as counts
        from {{model}}
        group by {{ columns | join(', ') }}
        having count(*) > 1
    ) 
    select * from AA
{% endtest %}
{{
    config(
        materialized='incremental',
        unique_key=['coachid','year']
    )
}}
select * from {{source('hockey','coaches')}}

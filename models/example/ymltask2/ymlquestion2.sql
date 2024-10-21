{{
    config(
        materialized='table'
    )
}}

select * from 
{{source('hockey','HOF')}}
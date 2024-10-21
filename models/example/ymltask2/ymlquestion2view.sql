{{
    config(
        materialized='view')
}}

select * from 
{{source('hockey','HOF')}}
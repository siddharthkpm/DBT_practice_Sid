{% snapshot scd2logic %}

{{
    config(
        unique_key='empid',            
        strategy='timestamp',     
        updated_at='start_date' 
    )
}}

SELECT 
empid ,
name ,
phone ,
start_date 
 FROM Training.dbt_srajakumar.scd2

{% endsnapshot %}

{% snapshot checkcolssnapshot %}
    {{
        config(
            unique_key='empid',
            strategy='check',
            check_cols = ['phone']
        )
    }}

    select * from Training.dbt_srajakumar.scd2
 {% endsnapshot %}
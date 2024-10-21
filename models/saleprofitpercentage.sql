{{
    config(
        materialized='view'
    )
}}
SELECT
    p.product_id,
    p.product_name,
    TO_CHAR(s.sale_date, 'YYYY-MM') AS month_year,
    SUM(s.quantity * s.unit_price) AS sales,
    SUM(s.quantity) AS quantity,
    AVG(s.unit_price) AS unit_price,
    SUM((s.unit_price - p.cost_price) * s.quantity) AS profit
FROM
    training.dbt_srajakumar.salesdata s
JOIN
    training.dbt_srajakumar.products p ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    TO_CHAR(s.sale_date, 'YYYY-MM')

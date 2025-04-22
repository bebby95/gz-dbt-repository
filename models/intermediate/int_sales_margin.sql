WITH joined AS(
SELECT *,
ROUND((quantity * purchase_price), 2) AS purchase_cost
FROM {{ ref('stg_gz_raw_data__product') }} AS product
JOIN {{ ref('stg_gz_raw_data__sales') }} AS sales
USING(product_id)
)

SELECT *,
    ROUND(revenue - purchase_cost, 2) AS margin
FROM joined
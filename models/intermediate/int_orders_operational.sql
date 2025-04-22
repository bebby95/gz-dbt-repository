WITH joined AS(
SELECT *
FROM {{ ref('int_orders_margin') }}
JOIN {{ ref('stg_gz_raw_data__ship') }}
USING(orders_id)
)

SELECT
  date_date
  , orders_id
  , ROUND(margin + shipping_fee - logcost - ship_cost, 2) AS operational_margin
  , revenue
  , quantity
  , purchase_cost
  , margin
  , shipping_fee
  , logcost AS log_cost
  , ship_cost
FROM joined
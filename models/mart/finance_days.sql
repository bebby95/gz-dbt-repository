SELECT date_date
, COUNT(orders_id) AS nb_of_transactions
, ROUND(SUM(revenue), 2) AS total_revenue
, ROUND(AVG(revenue), 2) AS avg_basket
, ROUND(SUM(operational_margin), 2) AS operational_margin
, ROUND(SUM(purchase_cost), 2) AS total_purchase_cost
, ROUND(SUM(shipping_fee), 2) AS total_shipping_fee
, ROUND(SUM(log_cost), 2) AS total_log_cost
, ROUND(SUM(quantity), 2) AS total_qty_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date DESC
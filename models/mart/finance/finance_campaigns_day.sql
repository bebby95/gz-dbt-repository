WITH joined AS(
SELECT *
FROM {{ ref("int_campaigns_day") }} AS campaigns
JOIN {{ ref("finance_days") }} AS finance
USING(date_date)
)

SELECT date_date
, ROUND(operational_margin - ads_cost, 2) AS ads_margin
, avg_basket AS average_basket
, operational_margin
, ads_cost
, total_impressions AS ads_impression
, total_clicks AS ads_clicks
, CAST(total_qty_sold AS INT64) AS quantity
, total_revenue AS revenue
, total_purchase_cost AS purchase_cost
, margin
, total_shipping_fee AS shipping_fee
, total_log_cost AS log_cost
, ship_cost
FROM joined
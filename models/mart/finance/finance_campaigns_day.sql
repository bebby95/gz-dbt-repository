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
, impressions AS ads_impression
, clicks AS ads_clicks
, CAST(qty_sold AS INT64) AS quantity
, revenue AS revenue
, purchase_cost AS purchase_cost
, margin
, shipping_fee AS shipping_fee
, log_cost AS log_cost
, ship_cost
FROM joined
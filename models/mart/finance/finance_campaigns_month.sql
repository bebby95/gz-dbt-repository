WITH aggregated AS(

SELECT
     date_trunc(date_date, MONTH) AS datemonth,
     ROUND(SUM(operational_margin - ads_cost), 2) AS ads_margin,
     ROUND(SUM(avg_basket),2) AS average_basket,
     ROUND(SUM(operational_margin), 2) AS operational_margin,
     ROUND(SUM(ads_cost), 2) AS ads_cost,
     ROUND(SUM(impressions), 2) AS ads_impression,
     ROUND(SUM(clicks), 2) AS ads_clicks,
     ROUND(SUM(qty_sold), 2) AS quantity,
     ROUND(SUM(revenue), 2) AS revenue,
     ROUND(SUM(purchase_cost), 2) AS purchase_cost,
     ROUND(SUM(margin), 2) AS margin,
     ROUND(SUM(shipping_fee), 2) AS shipping_fee,
     ROUND(SUM(log_cost), 2) AS logcost,
     ROUND(SUM(ship_cost), 2) AS ship_cost,
 FROM {{ ref('int_campaigns_day') }}
 FULL OUTER JOIN {{ ref('finance_days') }}
     USING (date_date)
 GROUP BY datemonth
 ORDER BY datemonth desc)

 SELECT *,
  ROUND( {{ margin_percent_calc(purchase_cost,revenue) }} ,2) AS margin_percent
FROM aggregated
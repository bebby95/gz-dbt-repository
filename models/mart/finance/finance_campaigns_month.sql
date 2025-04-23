SELECT
     date_trunc(date_date, MONTH) AS datemonth,
     ROUND(SUM(operational_margin - ads_cost), 2) AS ads_margin,
     ROUND(SUM(avg_basket),2) AS average_basket,
     ROUND(SUM(operational_margin), 2) AS operational_margin,
     ROUND(SUM(ads_cost), 2) AS ads_cost,
     ROUND(SUM(total_impressions), 2) AS ads_impression,
     ROUND(SUM(total_clicks), 2) AS ads_clicks,
     ROUND(SUM(total_qty_sold), 2) AS quantity,
     ROUND(SUM(total_revenue), 2) AS revenue,
     ROUND(SUM(total_purchase_cost), 2) AS purchase_cost,
     ROUND(SUM(margin), 2) AS margin,
     ROUND(SUM(total_shipping_fee), 2) AS shipping_fee,
     ROUND(SUM(total_log_cost), 2) AS logcost,
     ROUND(SUM(ship_cost), 2) AS ship_cost,
 FROM {{ ref('int_campaigns_day') }}
 FULL OUTER JOIN {{ ref('finance_days') }}
     USING (date_date)
 GROUP BY datemonth
 ORDER BY datemonth desc
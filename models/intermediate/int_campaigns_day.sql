 {{ config(materialized = 'table') }}

SELECT  date_date
, SUM(ads_cost) AS ads_cost
, CAST(SUM(impression) AS INT64) AS total_impressions
, CAST(SUM(click) AS INT64) AS total_clicks
FROM {{ ref("int_campaigns") }} AS campaigns
GROUP BY date_date

 {{ config(materialized = 'table') }}

SELECT  date_date
, SUM(ads_cost) AS ads_cost
, CAST(SUM(impression) AS INT64) AS impressions
, CAST(SUM(click) AS INT64) AS clicks
FROM {{ ref("int_campaigns") }} AS campaigns
GROUP BY date_date

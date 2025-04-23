{{ dbt_utils.union_relations( 
    relations=[
        ref("stg_gz_raw_data__adwords"), 
        ref("stg_gz_raw_data__bing"),
        ref("stg_gz_raw_data__criteo"),
        ref("stg_gz_raw_data__facebook")
    ]) }}

-- OLD CLUNKY CODE
-- SELECT *
-- FROM {{ ref("stg_gz_raw_data__adwords")}}
-- UNION ALL
-- SELECT *
-- FROM {{ ref("stg_gz_raw_data__bing")}}
-- UNION ALL
-- SELECT *
-- FROM {{ ref("stg_gz_raw_data__criteo")}}
-- UNION ALL
-- SELECT *
-- FROM {{ ref("stg_gz_raw_data__facebook")}}
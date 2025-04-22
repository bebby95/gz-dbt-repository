with 

source as (

    select * from {{ source('gz_raw_data', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        CAST(pdt_id AS INT64) AS product_id,
        revenue,
        quantity,
        CONCAT(pdt_id, '_', orders_id) AS primary_key

    from source

)

select * from renamed

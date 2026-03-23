{{
  config(    materialized = 'incremental'    )
}}

SELECT * from {{ source('staging', 'hosts') }}
{% if is_incremental() %}

    where CREATED_AT > (select coalesce(max(created_at), '1900-01-01') from  {{ this }})
  
{% endif %}

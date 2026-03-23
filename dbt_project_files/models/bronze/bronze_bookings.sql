{{
  config(    materialized = 'incremental'    )
}}

SELECT * from {{ source('staging', 'bookings') }}
{% if is_incremental() %}

    where CREATED_AT > (select coalesce(max(created_at), '1900-01-01') from  {{ this }})
  
{% endif %}
















{# 

{% set incremental_flag = 1 %}
{% set incremental_col = 'created_at' %}


SELECT * from {{ source('staging', 'bookings') }}

{% if incremental_flag == 1 %}

    where {{ incremental_col }} > (SELECT coalesce( max({{ incremental_col }}), '1990-01-01') from {{ this }}  )
  
{% endif %}

 #}
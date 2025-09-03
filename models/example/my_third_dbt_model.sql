{{ config(materialized='incremental',
unique_key='empid',
incremental_strategy='delete+insert',
full_refresh=true) }}

SELECT 
       empid,
       empname,
       salary,
       updated_at,
       is_deleted,
       '{{ invocation_id}}' AS run_id
FROM {{ source('my_database','employeedata') }}
{% if is_incremental() %}
WHERE updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
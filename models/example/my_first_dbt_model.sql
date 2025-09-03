{{ config(materialized='view') }}

with source_data as (

    SELECT empid,empname,salary FROM {{ source('my_database','employeedata')  }}

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null

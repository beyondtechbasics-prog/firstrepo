{{ config(materialized='ephemeral')}}

SELECT * FROM  {{ ref('my_third_dbt_model')}}
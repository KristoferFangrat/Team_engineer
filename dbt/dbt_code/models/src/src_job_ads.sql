{{ 
    config(
        materialized='ephemeral',
    )
}}

WITH stg_job_ads as (select * from {{ source('engineer_ads', 'stg_data_ads') }})

select
    id,
    number_of_vacancies AS vacancies,
    relevance,
    application_deadline AS deadline,
    publication_date AS published

from stg_job_ads
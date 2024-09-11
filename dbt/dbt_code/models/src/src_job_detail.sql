{{ 
    config(
        materialized='ephemeral',
    )
}}

WITH stg_job_ads as (select * from {{ source('engineer_ads', 'stg_data_ads') }})

select
id,
headline,
description__text as description_text,
employment_type__label as employment_type,
duration__label as duration,
salary_type__label as salary_type,
scope_of_work__min as scope_of_work_min,
scope_of_work__max as scope_of_work_max,
_DLT_LOAD_ID as engineer_type_id,
Occupation_group__label as occupation_field

from stg_job_ads
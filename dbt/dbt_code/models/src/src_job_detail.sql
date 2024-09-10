WITH stg_job_ads as (select * from {{ source('engineer_ads', 'stg_data_ads') }})

select
id,
headline,
description__text as description,
description__text_formatted as description_html_formatted,
employment_type__label as employment_type,
duration__label as duration,
salary_type__label as salary_type,
scope_of_work__min as minimum_working_hours,
scope_of_work__max as maximum_working_hours,
occupation_group__label as engineer_type,
Occuapation_field__label as occupation

from stg_job_ads


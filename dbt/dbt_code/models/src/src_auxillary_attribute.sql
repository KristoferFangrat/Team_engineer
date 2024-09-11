{{ 
    config(
        materialized='ephemeral',
    )
}}

WITH stg_job_ads AS (SELECT * from {{source ('engineer_ads', 'stg_data_ads')}})

SELECT
id,
driving_license_required AS required_driving_license,
experience_required AS experience_required,
access_to_own_car AS access_to_own_car

FROM stg_job_ads
with stg_job_ads as (select * from {{source ('engineer_ads', 'stg_data_ads')}})

select
id,
driving_license_required as required_driving_license,
experience_required as experience_required,
access_to_own_car as access_to_own_car

from stg_job_ads

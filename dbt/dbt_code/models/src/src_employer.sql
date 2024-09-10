with stg_job_ads as (select * from {{source ('engineer_ads', 'stg_data_ads')}})

select
id,
employer__name as employer_name,
employer__organization_number as employer_oraganization_number,
workplace_address__street_address as workplace_street_address,
workplace_address__region as workplace_region,
workplace_address__postcode as workplace_postcode,
workplace_address__city as workplace_city,
workplace_address__country as workplace_country,
workplace_address__municipality as workplace_municipality

from stg_job_ads
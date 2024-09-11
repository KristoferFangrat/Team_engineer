{{ 
    config(
        materialized='ephemeral',
    )
}}

WITH stg_job_ads AS (select * from {{source ('engineer_ads', 'stg_data_ads')}})

SELECT
id,
employer__name AS employer_name,
employer__organization_number AS employer_organization_number,
workplace_address__street_address AS workplace_street_address,
workplace_address__region AS workplace_region,
workplace_address__postcode AS workplace_postcode,
workplace_address__city AS workplace_city,
workplace_address__country AS workplace_country,
workplace_address__municipality AS workplace_municipality

FROM stg_job_ads
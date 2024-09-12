WITH ja AS (SELECT * FROM {{ ref('src_job_ads')}}),
    jd AS (SELECT * FROM {{ ref('src_job_detail')}}),
    e AS (SELECT * FROM {{ ref('src_employer')}}),
    aa AS (SELECT * FROM {{ ref('src_auxillary_attribute')}})

SELECT 
    ja.id AS job_ad_id,
    ja.vacancies,
    ja.relevance,
    ja.deadline,
    ja.published,
    {{ dbt_utils.generate_surrogate_key(['ja.id', 'jd.headline'])}} AS job_detail_key,
    {{ dbt_utils.generate_surrogate_key(['e.id', 'e.employer_name'])}} AS employer_key,
    {{ dbt_utils.generate_surrogate_key(['aa.id', 'aa.required_driving_license', 'aa.experience_required', 'aa.access_to_own_car'])}} 
    AS auxillary_attribute_key
FROM 
    ja
LEFT JOIN 
    jd ON jd.id = ja.id
LEFT JOIN
    e ON e.id = ja.id
LEFT JOIN
    aa ON aa.id = ja.id

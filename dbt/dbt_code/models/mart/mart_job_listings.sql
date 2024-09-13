WITH fct_job_ad AS (
    SELECT * FROM {{ ref('fct_job_ad') }}
),

job_details AS (SELECT * FROM {{ ref('dim_job_detail') }}),

employer AS (SELECT * FROM {{ ref('dim_employer') }})

SELECT
    jd.headline,
    f.vacancies,
    jd.salary_type,
    f.relevance,
    e.employer_name,
    e.workplace_city,
    jd.description_text,
    jd.duration,
    jd.scope_of_work_min,
    jd.scope_of_work_max,
    f.deadline,
    jd.engineer_type
FROM fct_job_ad AS f
LEFT JOIN job_details AS jd
    ON f.job_detail_key = jd.job_detail_id
LEFT JOIN employer AS e
    ON f.employer_key = e.employer_id
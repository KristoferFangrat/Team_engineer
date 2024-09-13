WITH fct_job_ad AS (
    SELECT * FROM {{ ref('fct_job_ad') }}
),

employers AS ( SELECT * FROM {{ ref('dim_employer') }}
)
SELECT
    e.employer_id AS employer_id,
    e.employer_name,
    f.job_ad_id AS job_ad_id,
    f.vacancies,
    f.deadline,
    f.relevance,
    f.published

    
FROM fct_job_ad AS f
LEFT JOIN employers AS e
    ON f.employer_key = e.employer_id
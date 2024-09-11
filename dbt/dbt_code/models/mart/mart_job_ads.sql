WITH fct_job_ad AS (
    SELECT * FROM {{ ref('fct_job_ad') }}
),

job_details AS (
    SELECT * FROM {{ ref('dim_job_detail') }}
),

employer AS (
    SELECT * FROM {{ ref('dim_employer') }}
),

SELECT
    e.employer_name,
    jd.headline,
    f.vacancies,
    f.relevance,
    f.deadline,
    f.published

FROM 
    fct_job_ad AS f
LEFT JOIN 
    job_details AS jd
ON
    f.job_detail_key = jd.job_detail_id
LEFT JOIN
    employer AS e
ON
    f.employer_key = e.employer_id

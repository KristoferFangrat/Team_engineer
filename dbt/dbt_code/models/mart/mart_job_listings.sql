WITH fct_job_ad AS (
    SELECT * FROM {{ ref('fct_job_ad') }}
),

job_details AS (SELECT * FROM {{ ref('dim_job_detail') }}),

employer AS (SELECT * FROM {{ ref('dim_employer') }})

SELECT
    jd.headline AS headline,
    f.vacancies AS vacancies,
    jd.salary_type AS salary_type,
    f.relevance AS relevance,
    e.employer_name AS employer_name,
    e.workplace_city AS workplace_city,
    jd.description_text AS description,
    jd.duration AS duration,
    jd.scope_of_work_min AS scope_of_work_min,
    jd.scope_of_work_max AS scope_of_work_max,
    CAST(f.deadline AS timestamp_ntz) AS deadline,
    jd.engineer_type AS engineer_type,
    CAST(f.published AS timestamp_ntz) AS published

FROM fct_job_ad AS f
LEFT JOIN job_details AS jd
    ON f.job_detail_key = jd.job_detail_id
LEFT JOIN employer AS e
    ON f.employer_key = e.employer_id
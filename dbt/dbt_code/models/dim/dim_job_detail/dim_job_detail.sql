{{
    config(
        description='Denna vy innehåller detaljerad information om jobbannonser.',
        columns={
            'job_detail_id': 'Unikt ID för varje jobbdetalj',
            'headline': 'Rubrik för jobbannonsen',
            'description_text': 'Beskrivningstext för jobbannonsen',
            'employment_type': 'Anställningstyp',
            'duration': 'Anställningens längd',
            'salary_type': 'Lönetyp',
            'scope_of_work_min': 'Minsta omfattning av arbetstid',
            'scope_of_work_max': 'Högsta omfattning av arbetstid',
            'occupation_field': 'Yrkesområde',
            'engineer_type': 'Ingenjörstyp'
        }
    )
}}

WITH src_job_detail AS (SELECT * FROM {{ ref('src_job_detail') }})

SELECT
{{dbt_utils.generate_surrogate_key(['id','headline'])}} AS job_detail_id,
{{ capitalize_first_letter_each_word('headline') }} AS headline,
description_text,
employment_type,
coalesce(duration, 'Not Available') AS duration,
salary_type,
coalesce(cast(scope_of_work_min as string), 'Not Available') AS scope_of_work_min,
coalesce(cast(scope_of_work_max as string), 'Not Available') AS scope_of_work_max,
occupation_field,
CASE 
    WHEN engineer_type_id = 1725637462.57518 THEN 'Rymdingenjör'
    WHEN engineer_type_id = 1725637471.831309 THEN 'Driftingenjör'
    WHEN engineer_type_id = 1725637484.744361 THEN 'Automationsingenjör'
    WHEN engineer_type_id = 1725637494.549522 THEN 'Högskoleingenjör'
    WHEN engineer_type_id = 1725637501.94134 THEN 'Civilingenjör'
    WHEN engineer_type_id = 1725637518.8779361 THEN 'Maskiningenjör'
    WHEN engineer_type_id = 1725637528.460333 THEN  'Miljöingenjör'

    ELSE 'Not Available'
END AS engineer_type
FROM src_job_detail

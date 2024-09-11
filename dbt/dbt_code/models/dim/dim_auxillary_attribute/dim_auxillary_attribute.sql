WITH src_auxillary_attribute AS (SELECT * FROM {{ ref('src_auxillary_attribute') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'required_driving_license', 'experience_required', 'access_to_own_car']) }} AS auxillary_attribute_id,
    required_driving_license,
    experience_required,
    access_to_own_car
FROM src_auxillary_attribute
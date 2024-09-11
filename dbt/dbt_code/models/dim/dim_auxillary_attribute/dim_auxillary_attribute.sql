{{ 
    config(
        description='Denna vy innehåller detaljerad information på krav som behövs för en specifik tjänst.',
        columns={
            'auxillary_attribute_id': 'Unikt ID för varje krav',
            'required_driving_license': 'Krävs körkort',
            'experience_required': 'Krävs erfarenhet',
            'access_to_own_car': 'Tillgång till egen bil'
        }
    )
}}

WITH src_auxillary_attribute AS (SELECT * FROM {{ ref('src_auxillary_attribute') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'required_driving_license', 'experience_required', 'access_to_own_car']) }} AS auxillary_attribute_id,
    required_driving_license,
    experience_required,
    access_to_own_car
FROM src_auxillary_attribute
with src_employer as (select * from {{ ref('src_employer') }})

select {{dbt_utils.generate_surrogate_key(['id','employer_name'])}} as employer_id,
{{ capitalize_first_letter_each_word("coalesce(employer_name, 'Not Available')") }} AS employer_name,
coalesce(employer_organization_number, 'Not Available') AS employer_organization_number,
{{ capitalize_first_letter_each_word("coalesce(workplace_street_address, 'Not Available')") }} as workplace_street_address,
{{ capitalize_first_letter_each_word("coalesce(workplace_region, 'Not Available')") }} as workplace_region,
{{ capitalize_first_letter_each_word("coalesce(workplace_postcode, 'Not Available')") }} as workplace_postcode,
{{ capitalize_first_letter_each_word("coalesce(workplace_city, 'Not Available')") }} AS workplace_city,
workplace_country,
{{ capitalize_first_letter_each_word("coalesce(workplace_municipality, 'Not Available')") }}workplace_municipality

from src_employer

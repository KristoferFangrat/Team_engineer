{{
  config(
    description = 'Denna vy innehåller detaljerad information om arbetsgivare.',
    columns={
        'employer_id': 'Unikt ID för varje arbetsgivare',
        'employer_name': 'Arbetsgivarens namn',
        'employer_organization_number': 'Arbetsgivarens organisationsnummer',
        'workplace_street_address': 'Arbetsplatsens gatuadress',
        'workplace_region': 'Vilken region arbetsplatsen tillhör',
        'workplace_postcode': 'Arbetsplatsens postnummer',
        'workplace_city': 'Vilken stad arbetsplatsen tillhör',
        'workplace_country': 'Vilket land arbetsplatsen tillhör',
        'workplace_municipality': 'Vilken kommun arbetsplatsen tillhör'
    }
    )
}}

with src_employer as (select * from {{ ref('src_employer') }})

select {{dbt_utils.generate_surrogate_key(['id','employer_name'])}} as employer_id,
{{ capitalize_first_letter_each_word("coalesce(employer_name, 'not available')") }} AS employer__name,
coalesce(employer_organization_number, 'not available') AS employer_organization_number,
{{ capitalize_first_letter_each_word("coalesce(workplace_street_address, 'not available')") }} as workplace_street_address,
{{ capitalize_first_letter_each_word("coalesce(workplace_region, 'not available')") }} as workplace_region,
{{ capitalize_first_letter_each_word("coalesce(workplace_postcode, 'not available')") }} as workplace_postcode,
{{ capitalize_first_letter_each_word("coalesce(workplace_city, 'not available')") }} AS workplace_city,
workplace_country,
{{ capitalize_first_letter_each_word("coalesce(workplace_municipality, 'not available')") }}workplace_municipality

from src_employer

{% macro capitalize_first_letter_each_word(column) %}
case
    when {{ column }} is null then null
    else initcap({{ column }})
end
{% endmacro %}
{% macro capitalize_first_letter_each_word(column) %}
-- Detta makro gör att den första bokstaven i varje ord i en angiven kolumn blir versal.
-- Det använder funktionen `initcap` för att formatera strängen och hanterar null-vörden korrekt.
-- Argument:
--   column: kolumnen som ska formateras
-- Returnerar:
-- (string): En sträng där den första bokstaven i varje ord är en versal.
case
    when {{ column }} is null then null
    else initcap({{ column }})
end
{% endmacro %}
-- Detta makro genererar schemanamn för tabeller och vyer i databasen. Om ett anpassat schemanamn inte anges, 
-- används standardvärdet från target.schema.
-- Argument:
--   custom_schema_name: det anpassade schemanamnet
--   node: noden som schemat ska genereras för
-- Returnerar:
-- (string): Schemanamnet för noden
{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}

    {%- if custom_schema_name is none -%}
        {{ default_schema }}
    {%-  else -%}
        {{ custom_schema_name | trim}}
    
    {%- endif -%}
{%- endmacro -%}
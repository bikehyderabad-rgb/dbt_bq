{{ config(materialized='table') }}

{% set result = run_query("CALL `airbnb-clouddbt.Retail_PROD.GlobalOverview`()") %}

{% if result is none %}
    {% do exceptions.raise_compiler_error(" SP Failed") %}
{% endif %}    

SELECT "SP Executed Successfully" AS STATUS
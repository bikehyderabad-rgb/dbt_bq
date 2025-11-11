{{ config(materialized='ephemeral') }}

{% set result = run_query("CALL `airbnb-clouddbt.Retail_DEV.Retail_Transactions_Dev`()") %}

{% if result is none %}
    {% do exceptions.raise_compiler_error(" SP Failed") %}
{% endif %}    

SELECT "SP Executed Successfully" AS STATUS
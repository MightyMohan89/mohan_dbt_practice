{% macro format_amount(col) %}
round({{ col }},2)
{% endmacro %}
{% macro margin_percent_calc(purchase_cost, revenue) %}

    SAFE_DIVIDE(purchase_cost,revenue)

{% endmacro %}
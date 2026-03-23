{% macro tag(column_name) %}
    case 
        when {{column_name}} < 100 then 'Low'
        when {{column_name}} < 200 then 'Medium'
        else 'High'
    end
{% endmacro %}
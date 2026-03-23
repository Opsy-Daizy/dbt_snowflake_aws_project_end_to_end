{#
	Macro: multiply
	Description: returns an SQL expression that multiplies two values or expressions.
	Usage examples:
		- {{ multiply(2, 3) }}            -> 6
		- {{ multiply('col_a', 'col_b') }} -> (col_a * col_b)
#}

{% macro multiply(x, y, precision ) %}
	round({{ x }} * {{ y }}, {{ precision }})
{% endmacro %}


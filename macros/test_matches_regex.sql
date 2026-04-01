{% test matches_regex(model, column_name, regex) %}

select *
from {{ model }}
where not regexp_like(
    cast({{ column_name }} as varchar),
    {{ "'" ~ regex ~ "'" }}
)

{% endtest %}
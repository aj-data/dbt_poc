with spine as (
    {{
        dbt_utils.date_spine(
            datepart = "day",
            start_date = "cast('1992-01-01' as date)",
            end_date   = "cast('1999-01-01' as date)"
        )
    }}
)

select * from spine
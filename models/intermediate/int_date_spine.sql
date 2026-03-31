with date_spine as (
    {{
        dbt_utils.date_spine(
            datepart = "day",
            start_date = "cast('1992-01-01' as date)",
            end_date   = "cast('1999-01-01' as date)"
        )
    }}
),

final as (
    select
        cast(to_char(date_day, 'YYYYMMDD') as integer) as date_key,
        date_day                                        as full_date,
        year(date_day)                                  as year,
        quarter(date_day)                               as quarter,
        month(date_day)                                 as month,
        day(date_day)                                   as day_of_month,
        dayofweek(date_day)                             as day_of_week,
        dayname(date_day)                               as day_name,
        monthname(date_day)                             as month_name,
        case when dayofweek(date_day) in (0, 6)
             then true else false end                   as is_weekend,
        'Q' || quarter(date_day) || '-' || year(date_day) as fiscal_period
    from date_spine
)

select * from final
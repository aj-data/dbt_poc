
with spine as (
    select * from {{ ref('int_date_spine') }}
),

final as (
    select
        -- Surrogate key en formato YYYYMMDD (integer, fácil de joinear)
        cast(to_char(date_day, 'YYYYMMDD') as integer)  as date_key,
        date_day                                         as full_date,

        -- Año / trimestre / mes
        year(date_day)                                   as year,
        quarter(date_day)                                as quarter_number,
        'Q' || quarter(date_day)                         as quarter_name,
        month(date_day)                                  as month_number,
        monthname(date_day)                              as month_name,
        year(date_day) || '-' || monthname(date_day)     as year_month,

        -- Semana
        weekofyear(date_day)                             as week_of_year,
        yearofweekiso(date_day)                          as iso_year,

        -- Día
        day(date_day)                                    as day_of_month,
        dayofyear(date_day)                              as day_of_year,
        dayofweek(date_day)                              as day_of_week_number,
        dayname(date_day)                                as day_name,

        -- Flags útiles
        case when dayofweek(date_day) in (0, 6)
             then true else false end                    as is_weekend,
        case when dayofweek(date_day) not in (0, 6)
             then true else false end                    as is_weekday,

        -- Período fiscal (asumiendo año fiscal = año calendario)
        'FY' || year(date_day)                           as fiscal_year,
        'FQ' || quarter(date_day) || '-' || year(date_day) as fiscal_quarter

    from spine
)

select * from final
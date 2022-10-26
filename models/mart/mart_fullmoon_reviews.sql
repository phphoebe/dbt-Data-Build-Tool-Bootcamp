{{
    config (
        materialized = 'table'
    )
}}

with 
    fct_reviews as (
        select *
        from {{ ref('fct_reviews') }}
    )

    , full_moon_dates as (
        select *
        from {{ ref('seed_full_moon_dates') }}
    )

select 
    fct_reviews.*
    , case 
        when full_moon_dates.full_moon_date is null 
        then 'not full moon'
        else 'full moon'
      end as is_full_moon
from fct_reviews
left join full_moon_dates on (to_date(fct_reviews.review_date) = dateadd(day, 1, full_moon_dates.full_moon_date))
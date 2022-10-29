select 
    *
from {{ ref('dim_listings_cleansed') }} as l 
inner join {{ ref('fct_reviews') }} as r using (listing_id)
where l.created_at >= r.review_date 
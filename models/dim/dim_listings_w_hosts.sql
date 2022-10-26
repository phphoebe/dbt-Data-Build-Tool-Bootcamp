with 
    listings as (
        select *
        from {{ ref('dim_listings_cleansed') }}
    )
    
    , hosts as (
        select * 
        from {{ ref('dim_hosts_cleansed') }}
    )

select
    listings.listing_id
    , listings.listing_name
    , listings.room_type
    , listings.minimum_nights
    , listings.price
    , listings.host_id
    , hosts.host_name
    , hosts.is_superhost  as host_is_superhost
    , listings.created_at
    , greatest(listings.updated_at, hosts.updated_at) as updated_at
from listings 
left join hosts on listings.host_id = hosts.host_id
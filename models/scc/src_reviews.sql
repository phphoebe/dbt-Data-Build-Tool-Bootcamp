WITH raw_views AS (
    
    SELECT 
        * 
    FROM AIRBNB.RAW.RAW_REVIEWS
    
)

SELECT 
    listing_id      AS listing_id,
    date            AS review_date,
    reviewer_name   AS reviewer_name,
    comments        AS review_text,
    sentiment       AS review_sentiment

FROM 
    raw_views
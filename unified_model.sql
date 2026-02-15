CREATE TABLE ads_data.unified_ads AS

SELECT
    'Facebook' AS platform,
    DATE(date) AS date,
    campaign_name,
    impressions,
    clicks,
    spend,
    conversions,
    SAFE_DIVIDE(clicks, impressions) AS ctr,
    SAFE_DIVIDE(spend, conversions) AS cpa,
    SAFE_DIVIDE(spend, clicks) AS cpc
FROM ads_data.facebook_ads

UNION ALL

SELECT
    'Google' AS platform,
    DATE(date) AS date,
    campaign_name,
    impressions,
    clicks,
    cost AS spend,
    conversions,
    SAFE_DIVIDE(clicks, impressions) AS ctr,
    SAFE_DIVIDE(cost, conversions) AS cpa,
    SAFE_DIVIDE(cost, clicks) AS cpc
FROM ads_data.google_ads

UNION ALL

SELECT
    'TikTok' AS platform,
    DATE(date) AS date,
    campaign_name,
    impressions,
    clicks,
    cost AS spend,
    conversions,
    SAFE_DIVIDE(clicks, impressions) AS ctr,
    SAFE_DIVIDE(cost, conversions) AS cpa,
    SAFE_DIVIDE(cost, clicks) AS cpc
FROM ads_data.tiktok_ads;

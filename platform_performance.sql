CREATE OR REPLACE VIEW ads_data.platform_performance AS

SELECT
    platform,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(spend) AS total_spend,
    SUM(conversions) AS total_conversions,
    
    SAFE_DIVIDE(SUM(clicks), SUM(impressions)) AS ctr,
    SAFE_DIVIDE(SUM(spend), SUM(conversions)) AS cpa,
    SAFE_DIVIDE(SUM(spend), SUM(clicks)) AS cpc

FROM ads_data.unified_ads
GROUP BY platform;

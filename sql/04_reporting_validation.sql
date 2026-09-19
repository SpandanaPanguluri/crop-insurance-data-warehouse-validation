-- Rebuild expected active reporting from warehouse
SELECT
    state_code,
    crop_code,
    COUNT(*) AS expected_active_policy_count,
    SUM(premium_amount) AS expected_premium,
    SUM(acreage_total) AS expected_acres
FROM warehouse_policy_fact
WHERE status_desc = 'Active'
GROUP BY state_code, crop_code
ORDER BY state_code, crop_code;

-- Compare report totals with warehouse-derived values
WITH expected AS (
    SELECT state_code, crop_code,
           COUNT(*) AS active_policy_count,
           SUM(premium_amount) AS premium,
           SUM(acreage_total) AS acres
    FROM warehouse_policy_fact
    WHERE status_desc = 'Active'
    GROUP BY state_code, crop_code
)
SELECT
    r.state_code,
    r.crop_code,
    r.active_policy_count AS reported_count,
    e.active_policy_count AS expected_count,
    r.reported_premium,
    e.premium AS expected_premium,
    r.reported_acres,
    e.acres AS expected_acres
FROM reporting_summary r
LEFT JOIN expected e
  ON r.state_code = e.state_code
 AND r.crop_code = e.crop_code;

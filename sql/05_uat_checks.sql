-- UAT scenario 1: cancelled policies should not be active in warehouse
SELECT p.policy_id, p.policy_status, w.status_desc
FROM policy_source p
JOIN warehouse_policy_fact w ON p.policy_id = w.policy_id
WHERE p.policy_status = 'CANCELLED'
  AND w.status_desc = 'Active';

-- UAT scenario 2: premium should reconcile at policy grain
SELECT p.policy_id, p.reported_premium, w.premium_amount
FROM policy_source p
JOIN warehouse_policy_fact w ON p.policy_id = w.policy_id
WHERE p.reported_premium <> w.premium_amount;

-- UAT scenario 3: acreage total should reconcile
WITH a AS (
    SELECT policy_id, SUM(reported_acres) AS acreage
    FROM acreage_source
    GROUP BY policy_id
)
SELECT w.policy_id, a.acreage AS source_acreage, w.acreage_total
FROM warehouse_policy_fact w
LEFT JOIN a ON w.policy_id = a.policy_id
WHERE COALESCE(a.acreage,0) <> w.acreage_total;

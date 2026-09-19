WITH acreage AS (
    SELECT policy_id, SUM(reported_acres) AS source_acres
    FROM acreage_source
    GROUP BY policy_id
)
SELECT
    p.policy_id,
    p.policy_status AS source_status,
    w.status_desc AS warehouse_status,
    p.reported_premium AS source_premium,
    w.premium_amount AS warehouse_premium,
    COALESCE(a.source_acres,0) AS source_acres,
    w.acreage_total AS warehouse_acres,
    CASE WHEN
        (CASE p.policy_status WHEN 'ACTIVE' THEN 'Active' WHEN 'CANCELLED' THEN 'Cancelled' END) = w.status_desc
        THEN 'MATCH' ELSE 'MISMATCH' END AS status_check,
    CASE WHEN p.reported_premium = w.premium_amount THEN 'MATCH' ELSE 'MISMATCH' END AS premium_check,
    CASE WHEN COALESCE(a.source_acres,0) = w.acreage_total THEN 'MATCH' ELSE 'MISMATCH' END AS acreage_check
FROM policy_source p
LEFT JOIN warehouse_policy_fact w ON p.policy_id = w.policy_id
LEFT JOIN acreage a ON p.policy_id = a.policy_id
ORDER BY p.policy_id;

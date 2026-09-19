-- Profile policy source
SELECT COUNT(*) AS rows,
       COUNT(DISTINCT policy_id) AS distinct_policies,
       SUM(CASE WHEN policy_id IS NULL THEN 1 ELSE 0 END) AS null_policy_ids
FROM policy_source;

SELECT state_code, crop_code, plan_code, policy_status,
       COUNT(*) AS policy_count,
       SUM(reported_premium) AS premium
FROM policy_source
GROUP BY state_code, crop_code, plan_code, policy_status;

-- Duplicate policy check
SELECT policy_id, COUNT(*) AS cnt
FROM policy_source
GROUP BY policy_id
HAVING COUNT(*) > 1;

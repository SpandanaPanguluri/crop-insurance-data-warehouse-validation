-- Orphan acreage
SELECT a.acreage_id, a.policy_id
FROM acreage_source a
LEFT JOIN policy_source p ON a.policy_id = p.policy_id
WHERE p.policy_id IS NULL;

-- Invalid crop/plan combinations
SELECT DISTINCT p.policy_id, p.crop_code, p.plan_code
FROM policy_source p
LEFT JOIN reference_crop_plan r
  ON p.crop_code = r.crop_code
 AND p.plan_code = r.plan_code
WHERE r.crop_code IS NULL;

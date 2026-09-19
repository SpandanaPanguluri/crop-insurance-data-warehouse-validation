# Source-to-Target Mapping

| Source | Target | Rule |
|---|---|---|
| policy_source.policy_id | warehouse_policy_fact.policy_id | Direct map |
| policy_source.state_code | warehouse_policy_fact.state_code | Direct map |
| policy_source.crop_code | warehouse_policy_fact.crop_code | Direct map |
| policy_source.plan_code | warehouse_policy_fact.plan_code | Direct map |
| policy_source.coverage_level | warehouse_policy_fact.coverage_level | Direct map |
| policy_source.policy_status | warehouse_policy_fact.status_desc | ACTIVE → Active; CANCELLED → Cancelled |
| policy_source.reported_premium | warehouse_policy_fact.premium_amount | Direct map unless an approved transformation applies |
| acreage_source.reported_acres | warehouse_policy_fact.acreage_total | Aggregate by policy_id |
| reference_crop_plan | warehouse validation | Crop/plan combination must exist in reference data |

## Map-and-Gap Questions

1. Does every source attribute have a valid target?
2. Are any target attributes derived rather than directly mapped?
3. Are status and code-value transformations documented?
4. Does every crop/plan combination exist in reference data?
5. Is target grain the same as source grain?
6. Are acreage rows aggregated correctly before loading policy-level facts?

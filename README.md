# Crop Insurance Data Warehouse Validation

Synthetic crop-insurance data warehouse and reporting validation project aligned to Senior Data Analyst work involving profiling, source-to-target mapping, metadata analysis, reconciliation, ETL validation, business rules, UAT support, and downstream reporting.

> All data is synthetic. No client, or proprietary insurance data is included.

## Business Problem

A crop-insurance reporting program is enhancing its enterprise data warehouse. Policy and acreage data from operational sources must be profiled, mapped, transformed, and reconciled into warehouse and reporting structures.

The analyst must:
- profile source data and identify quality issues;
- reverse-engineer source structures and business meaning;
- document source-to-target mappings and transformation rules;
- perform map-and-gap analysis;
- validate warehouse loads using SQL;
- reconcile policy, premium, acreage, and status values;
- document metadata and business rules;
- support UAT and downstream reporting validation.

## Data Model

```text
Producer
   |
Policy
   |
Acreage / Farm / Tract / Field
   |
Warehouse Policy Fact
   |
Reporting Summary
```

## Grain

- `policy_source.csv`: one row per policy term
- `acreage_source.csv`: one row per acreage/field record
- `warehouse_policy_fact.csv`: one row per policy in the analytical warehouse
- `reporting_summary.csv`: aggregated state/crop reporting grain
- `reference_crop_plan.csv`: crop/plan reference combinations

## Deliberate Data Quality Issues

- orphan acreage record with no matching policy;
- cancelled policy represented as active in the warehouse;
- premium mismatch for one policy;
- reporting layer impacted by warehouse defects;
- source-to-target business rules requiring status and acreage reconciliation.

## Repository Structure

```text
crop_insurance_data_warehouse_validation/
├── README.md
├── data/
│   ├── policy_source.csv
│   ├── acreage_source.csv
│   ├── warehouse_policy_fact.csv
│   ├── reference_crop_plan.csv
│   └── reporting_summary.csv
├── sql/
│   ├── 01_source_profiling.sql
│   ├── 02_map_gap_validation.sql
│   ├── 03_policy_reconciliation.sql
│   ├── 04_reporting_validation.sql
│   └── 05_uat_checks.sql
├── docs/
│   ├── source_to_target_mapping.md
│   ├── business_rules.md
│   ├── data_dictionary.md
│   └── interview_story.md
└── results/
    └── expected_findings.md
```

## Interview Story

“I built a synthetic crop-insurance warehouse validation project that mirrors the type of work I’ve done around profiling, mapping, reconciliation, metadata, and downstream reporting. I profiled policy and acreage data, documented source-to-target rules, validated warehouse-level policy records, reconciled premium and acreage values, identified orphan and status issues, and then checked how those defects affected aggregated reporting. I also documented UAT-oriented validation scenarios and business rules.”

## Tools / Concepts

SQL, source-to-target mapping, data profiling, map-and-gap analysis, ETL validation, data warehousing, metadata, reconciliation, UAT, downstream reporting.

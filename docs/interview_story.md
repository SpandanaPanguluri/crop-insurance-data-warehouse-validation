# Interview Practice

## 1. How would you start with an unfamiliar crop-insurance source?
Profile row counts, keys, nulls, distinct crop/plan/status values, date ranges, duplicate policies, acreage distribution, and reference-code validity before defining mappings.

## 2. Why is grain important?
A policy can have multiple acreage records. Joining policy and acreage directly to another child table can multiply rows. Aggregate acreage to policy grain before reconciling to the warehouse fact.

## 3. What is map-and-gap analysis?
Compare source attributes and business concepts with the target model to identify direct mappings, transformations, missing target coverage, unmapped target fields, and business-rule gaps.

## 4. A cancelled source policy appears active in reporting. What do you do?
Trace source status, transformation rules, warehouse value, reporting filters, and any later business event. Explain the downstream effect on active-policy counts and premium.

## 5. Premium differs between source and warehouse.
Confirm same policy/version and premium definition first. Then trace transformation logic and any approved business adjustments before calling it a defect.

## 6. Business report totals do not match the warehouse.
Confirm filter criteria, reporting grain, active/cancelled logic, reference joins, and aggregation logic. Reconcile from report → warehouse → source with concrete examples.

## 7. How do you support UAT?
Translate requirements into testable scenarios, define expected results, prepare representative records, validate outputs, document defects, and re-test after fixes.

## 8. How do you work with SMEs?
Ask what the field means in the business process, how it is used, valid values, edge cases, and downstream impacts; then translate that into mappings and validation rules.

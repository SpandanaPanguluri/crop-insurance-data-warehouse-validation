# Expected Findings

| Check | Expected finding | Business impact |
|---|---|---|
| Referential integrity | `A2010` references missing policy `CP1999` | Acreage cannot be tied to a valid policy |
| Status reconciliation | `CP1004` is CANCELLED in source but Active in warehouse | Active-policy and premium reporting can be overstated |
| Premium reconciliation | `CP1008` source premium = 14,500, warehouse = 14,950 | Warehouse/reporting premium overstated |
| Acreage reconciliation | Valid policies reconcile after aggregation | Confirms correct grain handling |
| Reporting validation | IA/CORN and TX/COTTON totals reflect warehouse defects | Demonstrates downstream impact of source/warehouse issues |

## Key Analyst Point

A warehouse load can complete successfully and still be wrong from a business perspective. Validation must check business meaning, reference data, status, premium, grain, and aggregated reporting outcomes—not only job completion or row counts.

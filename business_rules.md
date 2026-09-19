# Business Rules

1. Every acreage record must belong to a valid policy.
2. Policy status must be translated consistently between source and warehouse.
3. Warehouse premium must reconcile to the approved source premium definition.
4. Acreage must be aggregated to policy grain before comparison with the warehouse policy fact.
5. Crop/plan combinations must exist in approved reference data.
6. Cancelled policies must not be counted as active in downstream reports unless a later valid business event changes the status.
7. Reporting totals must reconcile to the warehouse after applying the same business filters.
8. Validation should distinguish technical load success from business correctness.

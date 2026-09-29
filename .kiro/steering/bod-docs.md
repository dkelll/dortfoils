---
inclusion: always
---

# BOD Project Reference Docs (always loaded)

These markdown docs describe the Board of Directors (BOD) Guest & Giving Travel
Portal — its requirements, architecture/data model, and admin setup. Treat them
as authoritative background for any BOD work (allocations, carryover, issuance
windows, expiration, portal/site, sharing).

## Requirements
#[[file:/Users/e191319/Projects/comm-org/requirements.md]]

## Design / Architecture
#[[file:/Users/e191319/Projects/comm-org/design.md]]

## BOD README
#[[file:/Users/e191319/Projects/comm-org/BOD_README.md]]

## Experience Cloud Site Setup
#[[file:/Users/e191319/Projects/comm-org/unpackaged/main/default/ADMIN_BOD_Site_Setup.md]]

## Sharing Setup
#[[file:/Users/e191319/Projects/comm-org/unpackaged/main/default/ADMIN_BOD_Sharing_Setup.md]]

---

## Quick facts confirmed from code (keep in mind)

- **Allocation creation** happens in only two places: `BOD_AllocationRefreshBatch`
  (annual, Jan 1 — grants new-year buckets with a Jan 1 + two-year issuance window)
  and `BOD_Release1Migration` (one-time initial data load). There is **no**
  Contact-creation trigger, record-page button, daily job, or flow that provisions
  allocations for a newly created Board member — a mid-year onboarded director gets
  nothing until the next annual refresh. (Identified tech + business gap.)
- **Scheduled jobs**: three daily (`BOD_RetirementLifecycleBatch`,
  `BOD_ExpirationBatch`, `BOD_StatusSyncQueueable`) + one annual
  (`BOD_AllocationRefreshBatch`, Jan 1). Only the annual one creates allocations;
  the daily Expiration job only marks buckets `Expired` and posts a negative
  Expiration ledger row.
- **Balance queries** must filter `Status__c = 'Active'`; `Superseded`/`Expired`
  rows are audit history and must not be summed. Use `Available_Quantity__c` (or the
  snapshot / `BOD_BalanceService.getRetiredBreakdown`) for remaining, not
  `Original_Quantity__c`.
- **Retired detection**: `Contact.BOD_Board_Status__c = 'Retired'` (values Active /
  Retired / Ineligible); status is derived/flipped by `BOD_ContactTriggerHandler` /
  `BOD_RetirementLifecycleBatch` off retirement dates.

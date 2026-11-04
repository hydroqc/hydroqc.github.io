---
title: Winter Credit Sensors
linkTitle: Winter Credit Sensors
weight: 47
description: |
  Winter Credits specific sensor description.
date: 2023-11-08T16:50:05.099Z
lastmod: 2025-01-08T16:51:07.251Z
---

## Sensor description

The following entities are created for the DCPC (Winter Credits) rate. Peak event entities read their data from the dedicated calendar configured in the integration. For details about each period, see the [optimization logic](../optimization-logics/) page.

{{% alert color="warning" title="Warning" %}}

Entities that represent the current state (Winter Credit Status, Critical Peak Active, Preheat Active) depend on the calendar events and the coordinator update. For automations that must run at a precise time, prefer the timestamp entities (Next Anchor Start, Next Peak Start, Next Preheat Start, etc.).

{{% /alert %}}

### Sensors

| Entity | Values | Description |
|-|-|-|
| Winter Credit Status | anchor / normal / peak / critical_anchor / critical_peak / off_season | Current period state (Diagnostic). `off_season` outside the winter season (December 1 to March 31) |
| Total Winter Credit | CA$123.45 | Winter credit accumulated so far |
| Projected Winter Credit | CA$234.56 | Projected winter credit at the end of the winter period |
| Next Anchor Start | timestamp | Start of the next anchor period (Diagnostic). Attribute `critical`: the anchor is linked to a critical peak |
| Next Anchor End | timestamp | End of the next anchor period (Diagnostic). Attribute `critical`: the anchor is linked to a critical peak |
| Next Peak Start | timestamp | Start of the next peak period (Diagnostic). Attribute `critical`: the peak is critical |
| Next Peak End | timestamp | End of the next peak period (Diagnostic). Attribute `critical`: the peak is critical |
| Next Critical Peak Start | timestamp | Start of the next **critical** peak. Unavailable when the next peak is not critical |
| Next Critical Peak End | timestamp | End of the next **critical** peak. Unavailable when the next peak is not critical |
| Next Preheat Start | timestamp | Start of the preheat period before the next peak (Diagnostic). Attribute `critical`: the preheat is for a critical peak |

### Yesterday's results

These 8 sensors report the outcome of yesterday's critical peaks. They are unavailable when there was no critical peak the day before.

| Entity | Unit | Description |
|-|-|-|
| Yest. Morning Credit | CAD | Winter credit earned during yesterday morning's peak |
| Yest. Morning Consumption | kWh | Actual consumption during yesterday morning's peak |
| Yest. Morning Ref. Cons. | kWh | Reference consumption for yesterday morning's peak |
| Yest. Morning Saved Cons. | kWh | Consumption saved compared to the reference for yesterday morning's peak |
| Yest. Evening Credit | CAD | Winter credit earned during yesterday evening's peak |
| Yest. Evening Consumption | kWh | Actual consumption during yesterday evening's peak |
| Yest. Evening Ref. Cons. | kWh | Reference consumption for yesterday evening's peak |
| Yest. Evening Saved Cons. | kWh | Consumption saved compared to the reference for yesterday evening's peak |

### Binary sensors

| Entity | Values | Description |
|-|-|-|
| Critical Period | on / off | The next peak is critical (Diagnostic). Kept for compatibility with Next Peak Critical |
| Critical Peak Active | on / off | A critical peak is currently in progress (Diagnostic) |
| Preheat Active | on / off | The preheat period before a peak is in progress (Diagnostic, disabled by default) |
| Next Anchor Critical | on / off | The next anchor period is linked to a critical peak (Diagnostic) |
| Next Peak Critical | on / off | The next peak period is critical (Diagnostic) |
| Upcoming Critical Peak | on / off | A critical peak is announced and still upcoming (Diagnostic) |
| Morning Peak Today | on / off | A critical peak is planned this morning (6h-10h) (Diagnostic, disabled by default) |
| Evening Peak Today | on / off | A critical peak is planned this evening (16h-20h) (Diagnostic, disabled by default) |
| Morning Peak Tomorrow | on / off | A critical peak is planned tomorrow morning (6h-10h) (Diagnostic, disabled by default) |
| Evening Peak Tomorrow | on / off | A critical peak is planned tomorrow evening (16h-20h) (Diagnostic, disabled by default) |

## Related pages

- [Winter Credits optimization logic](../optimization-logics/)
- [Winter Credits blueprint](../blueprint-wc/)
- [Flex D sensors](../../flex-d/flexd-sensors/)

---
title: Flex D Sensors
linkTitle: Flex D Sensors
weight: 47
description: |
  Description of Flex D sensors
date: 2023-01-17T02:12:08.942Z
lastmod: 2025-01-08T16:51:07.251Z
---

## Sensor description

The following entities are created for the DPC (Flex D) rate. Peak event entities read their data from the dedicated calendar configured in the integration; see the [Flex D blueprint](../blueprint-flex-d/) for automations.

{{% alert color="warning" title="Warning" %}}

Entities that represent the current state (DPC Status, Critical Peak Active, Preheat Active) depend on the calendar events and the coordinator update. For automations that must run at a precise time, prefer the timestamp entities (Next Peak Start, Next Peak End, Next Preheat Start).

{{% /alert %}}

### Sensors

| Entity | Values | Description |
|-|-|-|
| DPC Status | normal / peak / critical_peak / off_season | Current period state. `off_season` outside the winter season (December 1 to March 31) |
| Next Peak Start | timestamp | Start of the next peak period |
| Next Peak End | timestamp | End of the next peak period |
| Next Preheat Start | timestamp | Start of the preheat period before the next peak (Diagnostic, disabled by default) |
| Critical Hours Count | number | Critical hours called so far this winter (Diagnostic). Attribute `max`: maximum number of critical hours |
| Winter Days Count | number | Days elapsed since the start of the winter period (Diagnostic). Attribute `max`: total number of winter days |

The dual-energy consumption entities **High Price Consumption**, **Low Price Consumption** and **Flex D vs Rate D Difference** are also available with this rate; see the [Sensors](../../../reference/sensors/) reference.

### Binary sensors

| Entity | Values | Description |
|-|-|-|
| Critical Peak Active | on / off | A critical peak is currently in progress |
| Preheat Active | on / off | The preheat period before a critical peak is in progress (Diagnostic, disabled by default) |
| Morning Peak Today | on / off | A critical peak is planned this morning (6h-10h) (Diagnostic, disabled by default) |
| Evening Peak Today | on / off | A critical peak is planned this evening (16h-20h) (Diagnostic, disabled by default) |
| Morning Peak Tomorrow | on / off | A critical peak is planned tomorrow morning (6h-10h) (Diagnostic, disabled by default) |
| Evening Peak Tomorrow | on / off | A critical peak is planned tomorrow evening (16h-20h) (Diagnostic, disabled by default) |

## Related pages

- [Flex D terms](../terms/)
- [Flex D blueprint](../blueprint-flex-d/)
- [Winter Credits sensors](../../winter-credits/wc-sensors/)

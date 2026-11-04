---
title: Sensors
linkTitle: Sensors
weight: 32
description: |
  HydroQC sensor description.
date: 2022-12-21T20:27:36.262Z
lastmod: 2025-01-08T16:51:07.251Z
---

## Overview

The integration defines **41 sensors** and **18 binary sensors**. Only the entities that apply to the configured rate are created for a contract. Entity names are translated by Home Assistant (English, French and Spanish); the names below are the English ones.

Entities marked **Diagnostic** are shown in the Diagnostic section of the device and are excluded from default dashboards. Some diagnostic entities are also **disabled by default**; enable them in the entity settings if needed.

## Account

| Entity | Example | Description |
|-|-|-|
| Balance | CA$123.43 | Current account balance |

## Current billing period

| Entity | Example | Description |
|-|-|-|
| Billing Period Day | 19 | Day number in the current billing period (Diagnostic) |
| Billing Period Duration | 61 | Total number of days in the current billing period (Diagnostic) |
| Bill Total to Date | CA$108.10 | Cost of your consumption for the period so far |
| Projected Bill | CA$318.15 | Projected cost of consumption at the end of the billing period |
| Daily Bill Average | CA$5.69 | Average cost per day for the period (Diagnostic) |
| Daily Consumption Average | 60.5 kWh | Average consumption per day for the period |
| Total Consumption | 1149 kWh | Consumption so far in the current period |
| Projected Total Consumption | 3,432 kWh | Projected consumption at the end of the billing period |
| Average Temperature | 15 °C | Average temperature for the current period, as calculated by Hydro-Québec |
| Average kWh Cost | CA$0.09/kWh | Average cost per kWh for the period |
| Current Rate | DPC | Current rate code (D, DT, DPC, M, M-GDP) |
| Rate Option | — | Current rate option |

## Dual-energy rates (DT and DPC)

| Entity | Example | Description |
|-|-|-|
| High Price Consumption | 0 kWh | Consumption in the higher price bracket for the current period |
| Low Price Consumption | 1149 kWh | Consumption in the lower price bracket for the current period |
| Flex D vs Rate D Difference | CA$50.52 | Amount saved (positive) or lost (negative) compared to rate D |

## Outage

| Entity | Example | Description |
|-|-|-|
| Outage Status | 2026-01-15 08:00 | Start of the next planned outage or of the current unplanned outage (Diagnostic) |

The **Outage Status** sensor exposes the following attributes: `end_date`, `cause`, `planned_duration`, `code`, `state`, `emergency_level` and `is_planned`. It is unavailable when there is no upcoming or current outage.

## Rate-specific entities

Peak event and winter credit entities depend on the configured rate:

- [Flex D sensors](../../dynamic-pricing/flex-d/flexd-sensors/)
- [Winter Credits sensors](../../dynamic-pricing/winter-credits/wc-sensors/)

## Binary sensors

| Entity | Values | Description |
|-|-|-|
| EPP Active | on / off | Equal Payment Plan is active for the current period (Diagnostic, disabled by default) |
| Portal Status | on / off | Hydro-Québec portal availability (Diagnostic, disabled by default) |

Peak and preheat binary sensors are documented on the [Flex D](../../dynamic-pricing/flex-d/flexd-sensors/) and [Winter Credits](../../dynamic-pricing/winter-credits/wc-sensors/) pages.

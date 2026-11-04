---
title: Entities
linkTitle: Entities
weight: 24
description: |
  Entities created by the Hydro-Québec integration
date: 2026-11-04T00:00:00.000Z
lastmod: 2026-11-04T00:00:00.000Z
---

The integration creates the following entities for each contract:

- **Account and billing**: Balance, Bill Total to Date, Projected Bill, Daily Bill Average, Daily Consumption Average, Total Consumption, Projected Total Consumption, Average Temperature, Average kWh Cost, Billing Period Day, Billing Period Duration, Current Rate, Rate Option
- **Dual-energy**: High Price Consumption, Low Price Consumption, Flex D vs Rate D Difference (DT and DPC)
- **Peak events**: DPC Status and next peak timestamps (DPC), Winter Credit Status, winter credit totals and next peak timestamps (DCPC)
- **Winter credit results**: yesterday morning and evening credit, consumption, reference consumption and saved consumption (DCPC)
- **Outage**: Outage Status, with cause, duration and status as attributes
- **Binary sensors**: EPP Active, Portal Status, and peak/preheat indicators for DPC and DCPC
- **Button**: Refresh Peak Data (DPC and DCPC only)

Some diagnostic entities are disabled by default (Portal Status, EPP Active, DPC Next Preheat Start and Winter Credits Preheat Active). Enable them in the entity settings if you need them.

See the [Sensors](../../reference/sensors/) reference for the full list and the [Flex D](../../dynamic-pricing/flex-d/flexd-sensors/) and [Winter Credits](../../dynamic-pricing/winter-credits/wc-sensors/) pages for the rate-specific entities.

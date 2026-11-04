---
title: Services
linkTitle: Services
weight: 22
description: |
  Services exposed by the Hydro-Québec integration
date: 2026-11-04T00:00:00.000Z
lastmod: 2026-11-04T00:00:00.000Z
---

| Service | Description | Fields |
|-|-|-|
| `hydroqc.refresh_data` | Manually refresh data from the Hydro-Québec API | Target: a Hydro-Québec entity |
| `hydroqc.sync_consumption_history` | Import historical hourly consumption (runs in the background) | `days_back` (1-2000, default: 731) |
| `hydroqc.create_peak_event` | Create a manual critical peak event in the configured calendar | `device_id`, `date` (YYYY-MM-DD), `time_slot` (`AM` = 6h-10h, `PM` = 16h-20h) |

`hydroqc.sync_consumption_history` requires Portal Mode and consumption synchronization enabled. A manually created peak event is automatically matched if Hydro-Québec later announces the same event.

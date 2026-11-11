---
title: Integration options
linkTitle: Integration options
weight: 21
description: |
  Options available for the Hydro-Québec integration
date: 2026-11-04T00:00:00.000Z
lastmod: 2026-11-11T00:00:00.000Z
---

Open **Settings** > **Devices & Services** > **Hydro-Québec** > **Configure** to change:

- **Pre-heat Duration**: how long before a peak event the preheat period starts (0-240 minutes, default: 120)
- **Enable consumption synchronization**: import hourly consumption for the Energy Dashboard. Requires an integration reload to take effect
- **Calendar Entity**: the calendar used for peak events. Required for DPC/DCPC rates and validated when saving

The options form also has a collapsed **Advanced** section:

- **Login client**: how the integration signs in to Hydro-Québec.
  - **Mobile app** (default): uses the official Hydro-Québec mobile app authentication endpoints. The session is renewed automatically and lasts about 90 days, so the email verification code is only requested once and when the session expires.
  - **Web portal**: keeps the session for about 24 hours and requires a new email verification code every day.

Changing the login client reloads the integration and asks for a new email verification code. If the mobile client stops working, select the web portal.

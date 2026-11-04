---
title: Overview
linkTitle: Overview
weight: 1
description: |
  Overview of the project
date: 2022-09-22T12:40:13.967Z
lastmod: 2026-11-03T00:00:00.000Z
---

{{% alert color="warning" title="Important" %}}**This project is not endorsed or affiliated with Hydro-Québec.**{{% /alert %}}

## Origin of the project

This project was created to provide a way to access Hydro-Québec account and winter credit data for integration in home automation platforms such as Home-Assistant.

## What information can be retrieved from my account?

- General account data (billing period projection, current balance, current billing period consumption, and more)
- Hourly consumption sent to Home-Assistant for use with the Energy Dashboard
- Winter credit signals retrieved and used to trigger automations

## What are the different components?

### [HydroQC python library](https://github.com/hydroqc/hydroqc)

The HydroQC Python library is the base of the project and handles all calls to the Hydro-Québec customer portal.

### [hydroqc-ha - Home Assistant Custom Integration](https://github.com/hydroqc/hydroqc-ha)

**Recommended**

The **hydroqc-ha** custom integration is the recommended way to integrate Hydro-Québec with Home Assistant. It provides a native Home Assistant integration with all features built directly into Home Assistant.

**Key features:**

- Native Home Assistant integration
- Automatic sensor discovery
- Energy dashboard integration
- Support for winter credits and dynamic pricing
- Multiple contract support

**For new Home Assistant installations, use hydroqc-ha.**

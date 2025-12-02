---
title: Overview
linkTitle: Overview
weight: 1
description: |
  Overview of the project
date: 2022-09-22T12:40:13.967Z
lastmod: 2025-12-02T18:00:00.000Z
---
{{< alert color="warning" title="Important" >}}**This project is not endorsed or affiliated with Hydro-Québec.**{{< /alert >}}

## Origin of the project

This project was created to provide a way to access Hydro-Québec account and winter credit data in Home-Assistant.

## What information can be retrieved from my account?

- General account data (billing period projection, current balance, current billing period consumption, and many more )

- Hourly Consumption can be sent to Home-Assitant to be used with the Energy Dashboard

- Winter credit signals are retrieved and can be used to trigger automations


## What are the various components?

### [HydroQC python library](https://gitlab.com/hydroqc/hydroqc)

The hydroqc python library is at the base of the project and handles all calls to Hydro-Quebec customer portal.

### [hydroqc-ha - Home Assistant Custom Integration](https://github.com/hydroqc/hydroqc-ha) ⭐ **Recommended**

The **hydroqc-ha** custom integration is the recommended way to integrate Hydro-Québec with Home Assistant. It provides a native Home Assistant integration with all features built directly into Home Assistant without requiring external daemons or MQTT brokers.

**Key features:**
- Native Home Assistant integration
- No MQTT broker required
- Automatic sensor discovery
- Energy dashboard integration
- Support for winter credits and dynamic pricing
- Multiple contract support

**For new installations with Home Assistant, use hydroqc-ha.**

### [hydroqc2mqtt](https://gitlab.com/hydroqc/hydroqc2mqtt)

This module uses the hydroqc library to fetch all pertinent account information and winter credit signals to be sent to MQTT. It also provides Home-Assistant discovery topics to create all the relevant sensors in Home-Assistant.

{{< alert color="warning" title="Deprecation Notice" >}}
The Home Assistant consumption sync functionality in hydroqc2mqtt is being deprecated in favor of the new **hydroqc-ha** custom integration. hydroqc2mqtt will continue to be maintained for users of platforms other than Home Assistant.
{{< /alert >}}

**Use hydroqc2mqtt if:**
- You use a home automation platform other than Home Assistant
- You want to integrate with custom MQTT-based systems

### [Home-Assistant addon](https://gitlab.com/hydroqc/hydroqc-hass-addons) ⚠️ **Legacy**

{{< alert color="warning" title="Deprecation Notice" >}}
The Home Assistant addon is being deprecated in favor of the new **hydroqc-ha** custom integration. The addon will no longer receive new features and will eventually be retired. Existing users should plan to migrate to the hydroqc-ha integration.
{{< /alert >}}

The Home-Assistant addon wraps the hydroqc2mqtt daemon in a package for Home-Assistant. **New users should use the hydroqc-ha custom integration instead.**


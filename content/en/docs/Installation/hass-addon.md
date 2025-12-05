---
title: Home-Assistant Addon (Legacy)
linkTitle: Home-Assistant Addon
weight: 14
description: |
  Install with the Home-Assistant Addon (Legacy - Not Recommended for New Users)
date: 2022-09-21T19:50:59.393Z
lastmod: 2025-12-02T00:00:00.000Z
---

{{% alert color="warning" title="Deprecation Notice" %}}
**This addon is being deprecated.** For new installations, we strongly recommend using the [**hydroqc-ha custom integration**](../hass-integration) instead. The addon will no longer receive new features and will eventually be retired.

The new custom integration provides:
- Native Home Assistant integration without MQTT
- Better performance and reliability
- Easier configuration
- Full feature parity

[Click here for the new installation guide](../hass-integration)
{{% /alert %}}

## Legacy Installation Instructions

**Prerequisites**

You must have an MQTT broker installed on your system, for example Mosquitto.

[![Open your Home Assistant instance and show the dashboard of an add-on.](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_mosquitto)

**Option 1**

Click this button:
[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgitlab.com%2Fhydroqc%2Fhydroqc-hass-addons)

**Option 2**

Go in the supervisor page -> Add-on Store -> click on the vertical "..." on the top right of the page, add this repository: https://gitlab.com/hydroqc/hydroqc-hass-addons.git

Once completed, go into the hydroqc addon and click install.

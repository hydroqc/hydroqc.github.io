---
title: Home Assistant Custom Integration
linkTitle: Home Assistant Integration
weight: 12
description: |
  Install the hydroqc-ha custom integration for Home Assistant (Recommended)
aliases:
  - /docs/configuration/
  - /docs/configuration/addon-advanced/
  - /docs/configuration/config-file/
  - /docs/configuration/environment/
  - /docs/installation/hass-addon/
date: 2025-12-02T00:00:00.000Z
lastmod: 2026-11-03T00:00:00.000Z
---

{{% alert color="success" title="Recommended for Home Assistant Users" %}}

The **hydroqc-ha** custom integration is the recommended way to integrate Hydro-Québec with Home Assistant. It provides a native integration built directly into Home Assistant.

{{% /alert %}}

## Why choose hydroqc-ha?

- **Native integration**: Runs as a Home Assistant custom component
- **Easy configuration**: Setup entirely through the Home Assistant interface
- **Full feature support**: Consumption, billing, winter credits and dynamic pricing
- **Multiple contracts**: One device per Hydro-Québec contract
- **Diagnostic entities**: Optional entities for troubleshooting and advanced automations

## Installation

### Via HACS (Recommended)

#### Prerequisites

Make sure [HACS](https://hacs.xyz/) is installed on your Home Assistant instance. If not:

1. Follow the [HACS installation guide](https://hacs.xyz/docs/setup/download)
2. Restart Home Assistant after installing HACS

#### Install the integration

**Option A: One-click installation**

[![Open your Home Assistant instance and open the repository in HACS.](https://my.home-assistant.io/badges/hacs_repository.svg)](https://my.home-assistant.io/redirect/hacs_repository/?owner=hydroqc&repository=hydroqc-ha&category=integration)

Click the badge above to add the repository to HACS, then:

1. Click **"Download"** (or **"Install"**)
2. **Restart Home Assistant**

**Option B: Manual installation via HACS**

1. Open **HACS** in Home Assistant
2. Click on **Integrations**
3. Click the **three-dot** menu in the top right corner
4. Select **"Custom repositories"**
5. Add the repository URL: `https://github.com/hydroqc/hydroqc-ha`
6. Select category: **Integration**
7. Click **"Add"**
8. Search **"Hydro-Québec"** in the HACS integrations list
9. Click on the **Hydro-Québec** integration
10. Click **"Download"** (or **"Install"**)
11. **Restart Home Assistant**

**Note**: after restarting, you still need to configure the integration (see the Configuration section below).

### Manual installation

1. Download the latest release from [GitHub Releases](https://github.com/hydroqc/hydroqc-ha/releases)
2. Extract the `hydroqc` folder into your `custom_components` directory
3. Restart Home Assistant

## Configuration

The first step asks which connection mode to use: **Portal Mode (requires login)** for a Hydro-Québec account, or **OpenData Mode (no login required)** for public peak data without credentials.

{{% alert color="info" title="Local Calendar Required" %}}

For DPC (Flex-D) and DCPC (Winter Credits) rates, you must create a dedicated local calendar in Home Assistant before configuring the integration. All peak sensors (status, next peak times and preheat) read their data from calendar events. Do not use a shared calendar.

{{% /alert %}}

### Option 1: Portal Mode (Hydro-Québec account)

1. Go to **Settings** > **Devices & Services**
2. Click **+ Add Integration**
3. Search **Hydro-Québec**
4. Select **Portal Mode (requires login)**
5. Enter your credentials:
   - **Username**: Hydro-Québec email
   - **Password**: Hydro-Québec password
   - **Contract name**: a friendly name (e.g., "Home", "Cottage")
6. Select the contract to monitor
7. Choose how many days of consumption history to import (0-800). Set `0` to sync only the last 30 days
8. Enable or disable consumption synchronization
9. For DPC (Flex D) and DCPC (Winter Credits), select a dedicated calendar
10. Done! Entities appear shortly

**Features with an account:**

- Current and historical consumption data
- Balance and billing information
- Current rate and rate option
- Winter credits and peak events
- Outage information
- Energy Dashboard statistics

{{% alert color="info" title="Consumption Sync" %}}

Consumption sync imports hourly consumption as long-term statistics for the Home Assistant Energy Dashboard. You can disable it if you don't need historical consumption tracking or want to reduce API calls. This can be changed later in the integration options.

{{% /alert %}}

### Option 2: OpenData Mode (no account required)

For users who only want peak period information without logging in:

1. Go to **Settings** > **Devices & Services**
2. Click **+ Add Integration**
3. Search **Hydro-Québec**
4. Select **OpenData Mode (no login required)**
5. Choose your customer sector (residential or commercial)
6. Select your rate plan (the available plans are fetched from Hydro-Québec's public API)
7. Enter a contract name and a preheat duration (0-240 minutes)
8. For DPC (Flex D) and DCPC (Winter Credits), select a dedicated calendar
9. Done! Entities appear shortly

**Features without an account:**

- Peak event information
- Dynamic pricing information
- No consumption tracking
- No billing information

{{% alert color="info" title="Preheat Duration" %}}

The preheat duration can be configured during setup and changed later in the integration options. It determines how far in advance the preheat period starts before a peak event (default: 120 minutes, range: 0-240 minutes).

{{% /alert %}}

### Multi-contract setup

To monitor multiple contracts (e.g., home and cottage):

1. Add the integration multiple times
2. Use a different contract name for each one
3. Select a different contract during each setup

### Changing contract or password

Hydro-Québec assigns a new contract number whenever the person responsible for a consumption site changes, even if the site is already linked to the account. You don't need to remove the integration to update it:

1. Go to **Settings** > **Devices & Services** > **Hydro-Québec**
2. Open the **three-dot** menu of the entry and select **Reconfigure**
3. Confirm your email. Leave the password empty to keep the current one, or enter a new one
4. Select the contract

Entities keep their `entity_id` and the consumption history is preserved.

## Next steps

- [Integration options](../../home-assistant/integration-options/)
- [Services](../../home-assistant/services/)
- [Entities](../../home-assistant/entities/)

## Troubleshooting

See [Troubleshooting](../../troubleshooting/) for connection problems, missing data and debug logging.

## Support

- **Issues**: [GitHub Issues](https://github.com/hydroqc/hydroqc-ha/issues)
- **Documentation**: [hydroqc.ca](https://hydroqc.ca)
- **Source code**: [GitHub Repository](https://github.com/hydroqc/hydroqc-ha)
- **Discord**: [Join our Discord](https://discord.gg/JaRfRJEByz)

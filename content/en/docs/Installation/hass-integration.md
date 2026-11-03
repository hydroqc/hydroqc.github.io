---
title: Home Assistant Custom Integration
linkTitle: Home Assistant Integration
weight: 12
description: |
  Install the hydroqc-ha custom integration for Home Assistant (Recommended)
date: 2025-12-02T00:00:00.000Z
lastmod: 2026-11-03T00:00:00.000Z
---

{{% alert color="success" title="Recommended for Home Assistant Users" %}}

The **hydroqc-ha** custom integration is the recommended way to integrate Hydro-Québec with Home Assistant. It provides a native integration without requiring MQTT or external daemons.

{{% /alert %}}

## Why choose hydroqc-ha?

- **Native integration**: Built directly into Home Assistant as a custom component
- **No MQTT required**: Direct integration without the need for an MQTT broker
- **Easy configuration**: Simple setup through the Home Assistant user interface
- **Full feature support**: All features, including consumption tracking, winter credits and dynamic pricing
- **Multiple contracts**: Support for multiple Hydro-Québec contracts

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
3. Click the **3 dots** in the top right corner
4. Select **"Custom repositories"**
5. Add the repository URL: `https://github.com/hydroqc/hydroqc-ha`
6. Select the category: **Integration**
7. Click **"Add"**
8. Search for **"Hydro-Québec"** in the HACS integrations list
9. Click on the **Hydro-Québec** integration
10. Click **"Download"** (or **"Install"**)
11. **Restart Home Assistant**

**Note**: After restarting, you still need to configure the integration (see the Configuration section below).

### Manual installation

1. Download the latest release from [GitHub Releases](https://github.com/hydroqc/hydroqc-ha/releases)
2. Extract the `hydroqc` folder into your `custom_components` directory
3. Restart Home Assistant

## Configuration

### Option 1: Hydro-Québec account (full access)

1. Go to **Settings** → **Devices & Services**
2. Click **+ Add Integration**
3. Search for **Hydro-Québec**
4. Select **"Connect a Hydro-Québec account"**
5. Enter your credentials:
   - **Username**: your Hydro-Québec email
   - **Password**: your Hydro-Québec password
   - **Contract name**: a friendly name (e.g., "Home", "Cottage")
6. Select the contract to monitor from the list
7. Select the number of days of consumption history (0-800 days)
8. Enable or disable consumption sync (enabled by default)
9. Done! Sensors will appear in about 60 seconds

**Features with an account:**

- Current and historical consumption data
- Balance and billing information
- Winter credits and peak events
- Outage notifications
- Energy dashboard integration

{{% alert color="info" title="Consumption Sync" %}}

Consumption sync imports hourly consumption data to the Home Assistant Energy dashboard. You can disable it if you don't need historical consumption tracking or want to reduce API calls. This can be changed later in the integration options.

{{% /alert %}}

### Option 2: Peak data only (no account required)

For users who only want peak period information without logging in:

1. Go to **Settings** → **Devices & Services**
2. Click **+ Add Integration**
3. Search for **Hydro-Québec**
4. Select **"Peak data only (no account)"**
5. Choose your rate sector and plan
6. Done! Sensors will appear shortly

**Features without an account:**

- Peak event notifications
- Dynamic pricing information
- No consumption tracking
- No billing information

{{% alert color="info" title="Preheat Duration" %}}

The preheat duration can be configured in the integration options after setup. This determines how far in advance you will be notified before a peak event starts (default: 120 minutes).

{{% /alert %}}

### Multi-contract setup

To monitor multiple contracts (e.g., home and cottage):

1. Add the integration multiple times
2. Use different contract names for each one
3. Select a different contract during each setup

### Changing contract or password

Hydro-Québec assigns a new contract number whenever the person responsible for a consumption site changes, even if the site is already linked to the account. You don't need to remove the integration to update it:

1. Go to **Settings** → **Devices & Services** → **Hydro-Québec**
2. Open the **⋮** menu of the entry and select **Reconfigure**
3. Confirm your email. Leave the password empty to keep the current one, or enter the new one
4. Select the contract

Entities keep their `entity_id` and the consumption history is preserved.

## Available sensors

The integration creates sensors for:

- **Consumption**: Current period, yesterday, today
- **Billing**: Balance, projected amount
- **Peak events**: Current status, next event
- **Winter credits**: Events and projections
- **Calendar**: Automatic synchronization of critical peak events to a local calendar (DPC and DCPC rates only - you must create your own local calendar in Home Assistant)
- **Outages**: Current outages in your area

See the [Home Assistant](../../home-assistant/) section for detailed sensor information.

{{% alert color="info" title="Local Calendar Required" %}}

For DPC (Flex-D) and DCPC (Winter Credits) rates, you must create a local calendar in Home Assistant before configuring the integration. The integration will sync critical peak events to this calendar. See the blueprint documentation for detailed instructions.

{{% /alert %}}

## Troubleshooting

### Connection failed

- Verify your credentials on the [Hydro-Québec website](https://session.hydroquebec.com/)
- Check for special characters in your password
- Make sure the account has active contracts

### No data appearing

- Wait 60 seconds for the first update
- Check the Home Assistant logs: Settings → System → Logs
- Verify that the Hydro-Québec portal is online

### Sensors unavailable

- Some sensors are only active during specific seasons (winter credits)
- Verify that your rate plan supports the sensor
- Check that the coordinator is updating (check the logs)

### Debug logging

To enable debug logging for the Hydro-Québec integration, add the following 3 `custom_components.hydroqc` entries to your `configuration.yaml` and restart Home Assistant:

```yaml
logger:
  default: info
  logs:
    custom_components.hydroqc: debug
    custom_components.hydroqc.config_flow.base: debug
    custom_components.hydroqc.coordinator.base: debug
```

## Support

- **Issues**: [GitHub Issues](https://github.com/hydroqc/hydroqc-ha/issues)
- **Documentation**: [hydroqc.ca](https://hydroqc.ca)
- **Source code**: [GitHub Repository](https://github.com/hydroqc/hydroqc-ha)
- **Discord**: [Join our Discord](https://discord.gg/JaRfRJEByz)

---
title: Home Assistant Custom Integration
linkTitle: Home Assistant Integration
weight: 12
description: |
  Install the hydroqc-ha custom integration for Home Assistant (Recommended)
date: 2025-12-02T00:00:00.000Z
lastmod: 2025-12-02T00:00:00.000Z
---

{{< alert color="success" title="Recommended for Home Assistant Users" >}}
The **hydroqc-ha** custom integration is the recommended way to integrate Hydro-Québec with Home Assistant. It provides a native integration without requiring MQTT or external daemons.
{{< /alert >}}

## Why Choose hydroqc-ha?

- **Native Integration**: Built directly into Home Assistant as a custom component
- **No MQTT Required**: Direct integration without the need for an MQTT broker
- **Easy Configuration**: Simple setup through the Home Assistant UI
- **Full Feature Support**: All features including consumption tracking, winter credits, and dynamic pricing
- **Better Performance**: More efficient and reliable than the legacy addon
- **Multiple Contracts**: Support for multiple Hydro-Québec contracts

## Installation

### Via HACS (Recommended)

#### Prerequisites

Make sure [HACS](https://hacs.xyz/) is installed on your Home Assistant instance. If not:

1. Follow the [HACS installation guide](https://hacs.xyz/docs/setup/download)
2. Restart Home Assistant after installing HACS

#### Install the Integration

**Option A: One-Click Installation**

[![Open your Home Assistant instance and open the repository in HACS.](https://my.home-assistant.io/badges/hacs_repository.svg)](https://my.home-assistant.io/redirect/hacs_repository/?owner=hydroqc&repository=hydroqc-ha&category=integration)

Click the badge above to automatically add this repository to HACS, then:

1. Click **"Download"** (or **"Install"**)
2. **Restart Home Assistant**

**Option B: Manual Installation via HACS**

1. Open **HACS** in Home Assistant
2. Click on **Integrations**
3. Click the **3 dots** in the top right corner
4. Select **"Custom repositories"**
5. Add the repository URL: `https://github.com/hydroqc/hydroqc-ha`
6. Select category: **Integration**
7. Click **"Add"**
8. Search for **"Hydro-Québec"** in the HACS integrations list
9. Click on the **Hydro-Québec** integration
10. Click **"Download"** (or **"Install"**)
11. **Restart Home Assistant**

> **Note**: After restarting, you still need to configure the integration (see Configuration section below).

### Manual Installation

1. Download the latest release from [GitHub Releases](https://github.com/hydroqc/hydroqc-ha/releases)
2. Extract the `hydroqc` folder into your `custom_components` directory
3. Restart Home Assistant

## Configuration

### Option 1: With Hydro-Québec Account (Full Access)

1. Go to **Settings** → **Devices & Services**
2. Click **+ Add Integration**
3. Search for **Hydro-Québec**
4. Select **"Connect with Hydro-Québec account"**
5. Enter your credentials:
   - **Username**: Your Hydro-Québec email
   - **Password**: Your Hydro-Québec password
   - **Contract Name**: Friendly name (e.g., "Home", "Cottage")
6. Select the contract to monitor from the list
7. Done! Sensors will appear in ~60 seconds

**Features with account:**
- Current and historical consumption data
- Balance and billing information
- Winter credits and peak events
- Outage notifications
- Energy dashboard integration

### Option 2: Peak Data Only (No Account Required)

For users who only want peak period information without logging in:

1. Go to **Settings** → **Devices & Services**
2. Click **+ Add Integration**
3. Search for **Hydro-Québec**
4. Select **"Peak data only (no account)"**
5. Choose your rate sector and plan
6. Configure peak event preheat duration

**Features without account:**
- Peak event notifications
- Dynamic pricing information
- No consumption tracking
- No billing information

### Multi-Contract Setup

To monitor multiple contracts (e.g., home and cottage):

1. Add the integration multiple times
2. Use different contract names for each
3. Select a different contract during each setup

## Available Sensors

The integration creates sensors for:

- **Consumption**: Current period, yesterday, today
- **Billing**: Balance, projected amount
- **Peak Events**: Current status, next event
- **Winter Credits**: Events and projections
- **Outages**: Current outages in your area

See the [Home Assistant Sensors](../../home-assistant/) section for detailed sensor information.

## Troubleshooting

### Connection Failed
- Verify your credentials on the [Hydro-Québec website](https://session.hydroquebec.com/)
- Check for special characters in your password
- Ensure your account has active contracts

### No Data Appearing
- Wait 60 seconds for the first update
- Check Home Assistant logs: Settings → System → Logs
- Verify the Hydro-Québec portal is online

### Sensors Unavailable
- Some sensors are only active during specific seasons (winter credits)
- Verify your rate plan supports the sensor
- Check that the coordinator is updating (check logs)

## Migration from Legacy Addon

If you're currently using the legacy addon:

1. Install hydroqc-ha alongside the addon (both can run simultaneously)
2. Test the new integration thoroughly
3. Update your automations and dashboards to use the new sensors
4. Once satisfied, disable the legacy addon
5. Optionally uninstall the addon and MQTT broker if no longer needed

## Related Projects

- **hydroqc2mqtt**: For non-Home Assistant platforms (MQTT daemon)
- **Hydro-Quebec-API-Wrapper**: The underlying Python library

## Support

- **Issues**: [GitHub Issues](https://github.com/hydroqc/hydroqc-ha/issues)
- **Documentation**: [hydroqc.ca](https://hydroqc.ca)
- **Source Code**: [GitHub Repository](https://github.com/hydroqc/hydroqc-ha)
- **Discord**: [Join our Discord](https://discord.gg/BTPDntfaXH)

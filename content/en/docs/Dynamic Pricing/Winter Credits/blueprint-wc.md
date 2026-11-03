---
title: Blueprint for Winter Credits
linkTitle: Blueprint for Winter Credits
weight: 45
description: |
  Home-Assistant Blueprint for Winter Credits
date: 2023-01-17T02:12:08.942Z
lastmod: 2025-12-18T00:00:00.000Z
---

## Home-Assistant Blueprint

A Home-Assistant Blueprint with the options to carry out the automations described in this section is available [here](https://raw.githubusercontent.com/hydroqc/hydroqc-ha/main/blueprints/winter-credits-calendar.yaml) and can be installed directly with this button:

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Fhydroqc%2Fhydroqc-ha%2Fmain%2Fblueprints%2Fwinter-credits-calendar.yaml)

## Blueprint Architecture

The Winter Credits blueprint uses a hybrid approach combining time-based triggers and calendar triggers:

### Time-Based Triggers

**Daily winter schedule** (December 1 - March 31):
- **01:00** : Morning anchor start
- **04:00** : Morning anchor end
- **06:00** : Morning peak start
- **10:00** : Morning peak end
- **12:00** : Evening anchor start
- **14:00** : Evening anchor end
- **16:00** : Evening peak start
- **20:00** : Evening peak end

These time-based triggers ensure your automations fire at each anchor and peak period, whether critical or regular.

### Calendar Triggers

The blueprint requires a **local calendar entity** created in Home Assistant. The HydroQC integration automatically syncs critical peak events announced by Hydro-Québec to this calendar.

**Important**: You must create your own local calendar in Home Assistant (Settings → Devices & Services → Local Calendars → Add Calendar). The integration does not create a calendar automatically; it adds events to an existing calendar that you specify in the configuration.

**Recommendation**: Use a dedicated calendar only for peak events to avoid conflicts with other events.

The blueprint also uses calendar triggers with offsets for pre-heating before critical peaks.

### Automatic Criticality Detection

At **every execution**, the blueprint calls the `calendar.get_events` service to fetch today's events and automatically determine if peaks are critical or regular:

```yaml
- action: calendar.get_events
  data:
    start_date_time: "{{ now().replace(hour=0, minute=0, second=0).isoformat() }}"
    end_date_time: "{{ now().replace(hour=23, minute=59, second=59).isoformat() }}"
  response_variable: calendar_events
```

This approach ensures the blueprint:
- Reliably detects critical vs regular peaks
- Works with both time-based AND calendar triggers
- Doesn't require additional input_boolean helpers
- Fetches calendar data at execution time

## Prerequisites

### 1. Create a Local Calendar

{{% alert color="warning" title="Important" %}}
You must create a local calendar in Home Assistant **before** configuring the HydroQC integration.
{{% /alert %}}

**Steps to create a local calendar**:

1. Go to **Settings** → **Devices & Services** → **Integrations**
2. Click **Add Integration**
3. Search for **"Local Calendar"**
4. Create a new calendar with a name like "HydroQC Peaks" or "Winter Credits"
5. Note the calendar's `entity_id` (e.g., `calendar.hydroqc_peaks`)

**Recommendation**: Use a dedicated calendar only for HydroQC peak events to avoid conflicts with other personal events.

### 2. Configure the HydroQC Integration

When configuring the HydroQC integration (v0.4.0-beta.1+), you will need to specify the calendar entity you just created. The integration will automatically sync critical peak events to this calendar.

## Configurable Actions

The blueprint provides separate actions for:

### Critical Peaks
- **Pre-heat** (enabled by default)
- **Anchor start** (disabled by default)
- **Anchor end** (disabled by default)
- **Peak start** (enabled by default)
- **Peak end** (enabled by default)

### Regular (Non-Critical) Peaks
- **Anchor start** (disabled by default)
- **Anchor end** (disabled by default)
- **Peak start** (disabled by default)
- **Peak end** (disabled by default)

All actions include **persistent notifications disabled by default** that you can enable as needed.

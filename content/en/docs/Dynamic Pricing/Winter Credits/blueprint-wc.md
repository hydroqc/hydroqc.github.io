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

A Home-Assistant blueprint that handles the Winter Credits (DCPC) schedule: fixed-time anchors and peaks, calendar-driven pre-heating for critical peaks, and a separate set of actions for regular peaks. It can be installed directly with this button:

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Fhydroqc%2Fhydroqc-ha%2Fmain%2Fblueprints%2Fwinter-credits-calendar.yaml)

The blueprint source is available [here](https://raw.githubusercontent.com/hydroqc/hydroqc-ha/main/blueprints/winter-credits-calendar.yaml). To import it manually, go to **Settings** > **Automations & scenes** > **Blueprints** > **Import blueprint** and paste that URL.

## How it works

The blueprint is a single automation in `parallel` mode (with `max_exceeded: silent`) that combines two kinds of triggers:

| Trigger | Fires |
|---|---|
| Pre-heat (morning) | `preheat_offset_morning` before a calendar event starts |
| Pre-heat (evening) | `preheat_offset_evening` before a calendar event starts |
| Morning anchor start | 01:00 |
| Morning anchor end | 04:00 |
| Morning peak start | 06:00 |
| Morning peak end | 10:00 |
| Evening anchor start | 12:00 |
| Evening anchor end | 14:00 |
| Evening peak start | 16:00 |
| Evening peak end | 20:00 |

Two global conditions apply to every trigger:

- the current month must be December, or January through March, so the automation never runs outside the Winter Credits season
- calendar triggers must have an event whose summary contains `pointe` and whose description contains `Tarif: DCPC`

### Critical or regular?

At every execution the blueprint reads the calendar for the current day with `calendar.get_events` and decides whether a critical peak exists:

```yaml
- action: calendar.get_events
  target:
    entity_id: !input hydroqc_calendar
  data:
    start_date_time: "{{ now().replace(hour=0, minute=0, second=0, microsecond=0).isoformat() }}"
    end_date_time: "{{ now().replace(hour=23, minute=59, second=59, microsecond=0).isoformat() }}"
  response_variable: calendar_events
```

A morning peak counts as critical when an event of the day has a `pointe` summary, `Tarif: DCPC` in its description and a start time at 06:00. The evening peak is detected the same way at 16:00. This is why the automation works with time triggers alone: at 01:00, 04:00, 06:00, 10:00, 12:00, 14:00, 16:00 and 20:00 it re-reads the calendar instead of relying on a helper.

Each anchor and peak branch then picks the critical actions when a critical peak exists that day, and the regular actions otherwise. Pre-heating is driven by the calendar triggers only, so it never runs for a regular peak.

### Pre-heat offsets

The two calendar triggers share the same event and are told apart by the event start hour: before 12:00 the morning pre-heat action runs, at 12:00 or later the evening one. Both offsets default to `-01:45:00`.

The anchor end actions fire at 04:00 and 14:00. If you set a pre-heat offset of `-02:00:00` or more (for example `-02:30:00`), the pre-heat starts before or at the same time as the anchor end action, so plan both actions accordingly.

## Prerequisites

### 1. Create a local calendar

{{% alert color="warning" title="Important" %}}

You must create a local calendar in Home Assistant **before** configuring the HydroQC integration.

{{% /alert %}}

1. Go to **Settings** > **Devices & Services** > **Integrations**
2. Click **Add Integration**
3. Search for **"Local Calendar"**
4. Create a new calendar with a name like "HydroQC Peaks" or "Winter Credits"
5. Note the calendar's `entity_id` (e.g., `calendar.hydroqc_peaks`)

Use a dedicated calendar only for HydroQC peak events to avoid conflicts with personal events.

### 2. Configure the HydroQC integration

When configuring the Hydro-Québec integration, select the calendar entity you created. The integration automatically syncs critical peak events to this calendar. For DPC (Flex D) and DCPC (Winter Credits) rates, the calendar is required.

{{% alert color="info" title="Blueprint language" %}}

The blueprint interface, its notifications and the calendar events written by the integration are in French only. The input names below are given as they appear in the UI.

{{% /alert %}}

## Inputs

| Input | Default | Description |
|---|---|---|
| Calendrier Hydro-Québec | – | Calendar entity to watch. Select the same calendar as in the integration options |
| Délai de pré-chauffage (matin) | `-01:45:00` | How long before a morning critical peak the pre-heat starts. `-HH:MM:SS` |
| Délai de pré-chauffage (soir) | `-01:45:00` | Same, for evening critical peaks |
| [Critique] Action pré-chauffage (matin) | Persistent notification | Actions to run before a morning critical peak |
| [Critique] Action pré-chauffage (soir) | Persistent notification | Actions to run before an evening critical peak |
| [Critique] Action début pointe | Persistent notification | Actions to run at 06:00 and 16:00 on a critical peak day |
| [Critique] Action fin pointe | Random delay, then persistent notification | Actions to run at 10:00 and 20:00 on a critical peak day |

The critical actions are enabled by default, including their notifications. Two optional collapsed sections hold the rest:

| Section | Inputs | Default |
|---|---|---|
| Actions pointes régulières | [Régulière] Début pointe, [Régulière] Fin pointe | Disabled (`enabled: false`) |
| Actions d'ancrage (optionnel) | Critical and regular anchor start/end for morning and evening | Disabled (`enabled: false`) |

To use a disabled action, remove the `enabled: false` line from its sequence or replace the sequence entirely.

## Peak events written by the integration

For every upcoming critical peak, the integration creates one event in the configured calendar:

- **Summary**: an icon followed by `Pointe critique`
- **Location**: `Hydro-Québec DCPC`
- **Description**:

```
Réduisez votre consommation d'électricité pendant cette période.

Début: 06:00
Fin: 10:00

--- Métadonnées ---
Ajouté le: 2026-01-15 08:12:34 EST
Tarif: DCPC
Critique: Oui
ID: hydroqc_123456789_2026-01-16T06:00:00-05:00
```

The `Tarif` metadata line is what the blueprint filters on, and the start time (06:00 or 16:00) is what marks the day as a critical peak day. Regular peaks are not added to the calendar, and events created manually with the `hydroqc.create_peak_event` service use the same format.

## Testing calendar automations

{{% alert color="info" title="Calendar events take up to 15 minutes to be seen" %}}

Home Assistant can take up to 15 minutes to see an event added to the calendar. A test event created to start 5 minutes later is usually missed.

Always create test events that start at least 15 minutes in the future, and add the offset of the action you want to test: the trigger fires at the event start plus the offset, so a `-01:45:00` pre-heat offset means the event must be created at least 2 hours ahead.

{{% /alert %}}

## Recommendations

- Wrap your actions in `parallel:` rather than a plain sequence. A failing action then does not prevent the following ones from running.
- Keep the random 30 seconds to 5 minutes delay in the end action, and spread similar delays between your own restart actions. Without it, thousands of devices restart at the same second and create a new demand peak.
- Enable the anchor actions only if you want to act on the reference consumption periods. They are optional and disabled by default.
- For complex logic, use the blueprint only as a trigger (a `time` trigger or a separate automation) instead of adding many conditions to it. It stays easier to maintain and debug.

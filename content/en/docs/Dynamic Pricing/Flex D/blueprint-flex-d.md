---
title: Blueprint Flex D
linkTitle: Blueprint Flex D
weight: 47
description: |
  Home-Assistant Blueprint for Flex D
date: 2023-01-17T02:12:08.942Z
lastmod: 2025-01-08T16:51:07.251Z
---

## Home-Assistant Blueprint

A Home-Assistant blueprint that connects the critical peak events of your Flex D (DPC) calendar to your own pre-heat and consumption-reduction actions. It can be installed directly with the following button:

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Fhydroqc%2Fhydroqc-ha%2Fmain%2Fblueprints%2Fflex-d-calendar.yaml)

The blueprint source is available [here](https://raw.githubusercontent.com/hydroqc/hydroqc-ha/main/blueprints/flex-d-calendar.yaml). To import it manually, go to **Settings** > **Automations & scenes** > **Blueprints** > **Import blueprint** and paste that URL.

## How it works

The blueprint is a single automation with four calendar triggers on the calendar selected in the integration options:

| Trigger | Fires |
|---|---|
| Pre-heat (morning) | `preheat_offset_morning` before an event starting before 12:00 |
| Pre-heat (evening) | `preheat_offset_evening` before an event starting at 12:00 or later |
| Peak start | `critical_peak_offset` before the event start |
| Peak end | At the event end |

All four triggers only run when the event summary contains `pointe` and the description contains `Tarif: DPC`, so events from other calendars or other rates are ignored. Each action also requires the event to be a critical peak (`Critique: Oui` in the description). The integration only writes critical peaks to the calendar, so this always matches for synced events.

The automation runs in `parallel` mode, which allows a new peak to be handled while the actions of the previous one are still running.

## Prerequisites

- Hydro-Québec integration configured with the **DPC (Flex D)** rate
- A dedicated local calendar selected in the integration options, so the integration can write the peak events to it (see [Setup](../../../installation/hass-integration/#configuration))
- The blueprint imported

{{% alert color="info" title="Blueprint language" %}}

The blueprint interface, its default notifications and the calendar events written by the integration are in French only. The input names below are given as they appear in the UI.

{{% /alert %}}

## Inputs

| Input | Default | Description |
|---|---|---|
| Calendrier Hydro-Québec | – | Calendar entity to watch. Select the same calendar as in the integration options |
| Délai de pré-chauffage (matin) | `-02:00:00` | How long before a morning peak the pre-heat action starts. `-HH:MM:SS`, so `-01:30:00` for 90 minutes |
| Délai de pré-chauffage (soir) | `-02:00:00` | Same, for evening peaks |
| Délai avant début pointe critique | `-00:01:00` | How long before the official start the peak-start action runs. Keeps devices settled before the peak |
| Action de pré-chauffage (matin) | Persistent notification | Actions to run before a morning peak |
| Action de pré-chauffage (soir) | Persistent notification | Actions to run before an evening peak |
| Action début pointe critique | Persistent notification | Actions to run when the critical peak starts |
| Action fin pointe critique | Random delay, then persistent notification | Actions to run when the critical peak ends |

The offsets are computed from the calendar event itself, so a change announced by Hydro-Québec automatically moves the actions. Offsets must be negative values in the `-HH:MM:SS` format.

## Peak events written by the integration

For every upcoming critical peak, the integration creates one event in the configured calendar:

- **Summary**: an icon followed by `Pointe critique`
- **Location**: `Hydro-Québec DPC`
- **Description**:

```
Réduisez votre consommation d'électricité pendant cette période.

Début: 06:00
Fin: 10:00

--- Métadonnées ---
Ajouté le: 2026-01-15 08:12:34 EST
Tarif: DPC
Critique: Oui
ID: hydroqc_123456789_2026-01-16T06:00:00-05:00
```

The `Tarif` and `Critique` metadata lines are what the blueprint filters on. Regular peaks are not added to the calendar, and events added manually with the `hydroqc.create_peak_event` service use the same format.

## Testing calendar automations

{{% alert color="info" title="Calendar events take up to 15 minutes to be seen" %}}

Home Assistant can take up to 15 minutes to see an event added to the calendar. A test event created to start 5 minutes later is usually missed.

Always create test events that start at least 15 minutes in the future, and add the offset of the action you want to test: the trigger fires at the event start plus the offset, so a `-01:45:00` pre-heat offset means the event must be created at least 2 hours ahead.

{{% /alert %}}

## Recommendations

- Wrap your actions in `parallel:` rather than a plain sequence. A failing action then does not prevent the following ones from running:

    ```yaml
    parallel:
      - action: climate.set_temperature
        target:
          entity_id: climate.thermostat
        data:
          temperature: 21
      - action: light.turn_on
        target:
          entity_id: light.office
    ```

- Keep the random 30 seconds to 5 minutes delay in the end action, and spread similar delays between your own restart actions. Without it, thousands of devices restart at the same second and create a new demand peak.
- For complex logic, use the blueprint only as a trigger (`calendar` trigger or a separate automation) instead of adding many conditions to it. It stays easier to maintain and debug.
- The default end action only sends a notification. Add your real actions there before relying on it.

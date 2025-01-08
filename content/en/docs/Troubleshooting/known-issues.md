---
title: Known Issues
linkTitle: Known Issues
weight: 52
description: |
  Issues we are aware of and their workarounds.
date: 2022-09-21T18:41:22.563Z
lastmod: 2025-01-08T16:51:07.251Z
---

## Consumption does not sync

### Occasional Issue

During the start or end of the billing period, consumption is not available in the portal, so Hydroqc is unable to retrieve it. Wait two or three days after the start of your billing period and consumption should start syncing again on its own.

### Long-term history does not sync

When hydroqc2mqtt has been running for a while, the consumption history import functionality becomes non-functional. If you plan to import your long-term historical data, restart Hydroqc beforehand.

## Hydroqc2mqtt (or the addon) restarts frequently

Hydro-Québec often performs maintenance on their systems which results in errors in Hydroqc clients. If your installation is generally functional but the container/addon restarts from time to time, there's no need to worry.

For the Home-Assistant addon, you can use the following automation to restart the add-on:

```yaml
alias: AUTO restart HydroQC
description: Automatically restart the addon at 4:00 AM if it&#x27;s crashed/stopped
trigger:
    - platform: time
    at: &quot;05:31:00&quot;
condition:
    - condition: state
    entity_id: binary_sensor.hydroqc_add_on_running
    state: &quot;off&quot;
action:
    - service: hassio.addon_restart
    data:
      addon: 57e6a4ee_hydroqc
mode: single
```
Duplicate entities in Home-Assistant or contract change

Sometimes, if problems are encountered during the initial configuration of Hydroqc2MQTT (or the addon), it may run with invalid values and create empty entities.

When changing contracts (Flex D to Winter Credits or vice-versa), obsolete entities are not automatically removed. You can follow this procedure to remove them.

You can resolve this by doing the following:

    Stop Hydroqc2MQTT or the addon

    Leave MQTT running

    Go to the MQTT integration in Home-Assistant and open the Hydroqc entity

    In the "Device Info" box, click the three dots and click "Remove"
    This will delete all Hydroqc Home-Assistant entities and in MQTT.

    You can then start Hydroqc2MQTT or the addon and all entities will be recreated without duplicates.

binascii.Error: Incorrect padding error

We have had a report of this issue. The problem comes from the Hydro-Québec client portal returning malformed JSON when the person's name contains special characters (for example Benoît). The solution is to modify the name in the client portal.

    Log in to your hydro-quebec client portal

    Move your cursor over your name in the top right

    Click on "Login Information" (Identification Data)

    Change your full name to remove all accented characters

Try the module again.

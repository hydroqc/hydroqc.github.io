---
title: Configuration for Home-assistant
linkTitle: Configuration for Home-assistant
weight: 28
description: |
  Home-Assistant Configuration
lastmod: 2022-09-21T19:49:28.323Z
---

## Hourly Consumption in Energy Dashboard

{{< alert color="warning">}}**Hourly consumption from Hydro-Quebec is not live.** The hourly consumption will sync automatically when it is available from Hydro-Quebec. On the website you can only see the hourly consumption from the previous day. With hydroqc2mqtt you will sometime be able to see consumption of the current day. There is always a delay of a few hours before HQ publishes the information.{{< /alert >}}

When you enable sync of the hourly consumption a sensor is created in Home-Assistant named "Hourly Consumption" (sensor.hydroqc_maison_hourly_consumption).

{{< alert color="warning">}}**The "Houly Consumption" sensor will always have a state of "unknown".** We do not have a state for it, we need to create it in order to push the statistics to it and for it to be available to add to the Energy Dashboard, but there will never be a value for it.{{< /alert >}}

In the Energy Dashboard you will have to use this sensor in the "Grid Consumption" section.

You can also add the "Current billing period total to date" sensor under the option "Use an entity tracking the total costs". Be aware that we are not 100% sure of the behaviour of this sensor with accounts with EPP (MVE).

## Historical energy consumption

Enabling the above option will sync the consumption of the last two days and all the future consumption data available. We also provide a way to import the hourly consumption data from the last two years.

A switch named "Sync hourly consumption history" is available. To sync the last two years of history you turn it on. 

{{< alert color="warning">}}The history sync can take an hour or more to complete and often result in errors and retry in the logs. This is normal.{{< /alert >}}

When it is done syncing the switch will turn itself off again. **You should only turn it on once, there is no benefit in doing a resync of the history if it is already imported.**

This switch can also be used if for some reason you are missing data older than 48 hours because of a problem with your hydroqc2mqtt container, addon or Home-Assistant in general.

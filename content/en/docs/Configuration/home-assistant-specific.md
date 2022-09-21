---
title: Configuration for Home-assistant
linkTitle: Configuration for Home-assistant
weight: 28
description: |
  Home-Assistant Configuration
lastmod: 2022-09-21T18:58:37.638Z
---

## Hourly Consumption in Energy Dashboard

{{< alert color="warning">}}Hourly consumption from Hydro-Quebec is not live. What is made available to us is often several hours late. Rest assured that it will eventually be synced.{{< /alert >}}

When you enable sync of the hourly consumption a sensor is created in Home-Assistant named "Hourly Consumption" (sensor.hydroqc_maison_hourly_consumption).

{{< alert color="warning">}}**The "Hourly Consumption" sensor always have a value of "unknown"**. It is created for the sole purpose of having a sensor to push the hourly statistics to.{{< /alert >}}

In the Energy Dashboard you will have to use this sensor in the "Grid Consumption" section.

You can also add the "Current billing period total to date" sensor under the option "Use an entity tracking the total costs". Be aware that we are not 100% sure of the behaviour of this sensor with accounts with EPP (MVE).

## Historical energy consumption

Enabling the above option will sync the consumption of the last two days and all the future consumption data available. We also provide a way to import the hourly consumption data from the last two years.

A switch named "Sync hourly consumption history" is available. To sync the last two years of history you turn it on. When it is done syncing it will turn itself off again. **You should only turn it on once, there is no benefit in doing a resync of the history if it is already imported.**

This switch can also be used if for some reason you are missing data older than 48 hours because of a problem with your hydroqc2mqtt container, addon or Home-Assistant in general.

---
title: Configuration for Home-assistant
linkTitle: Configuration for Home-assistant
weight: 28
description: |
  Home-Assistant Configuration
lastmod: 2022-09-21T00:45:35.741Z
---

## Hourly Consumption in Energy Dashboard

When you enable sync of the hourly consumption a sensor is created in Home-Assistant named "Hourly Consumption" (sensor.hydroqc_maison_hourly_consumption).

{{< alert color="warning" title="Important" >}}**The "Hourly Consumption" sensor always have a value of "unknown"**. It is created for the sole purpose of having a sensor to push the hourly statistics to.{{< /alert >}}

In the Energy Dashboard you will have to use this sensor in the "Grid Consumption" section. You can also add the 

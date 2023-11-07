---
title: Energy Dashboard
linkTitle: Energy Dashboard
weight: 25
description: |
  Configurations of the Home-Assistant Energy Dashboard
lastmod: 2022-12-21T20:31:51.482Z
---

## Hourly Consumption in Energy Dashboard

{{< alert color="warning">}}**Hourly consumption from Hydro-Quebec is not live.** The hourly consumption will sync automatically when it is available from Hydro-Quebec. On the website you can only see the hourly consumption from the previous day. With hydroqc2mqtt you will sometime be able to see consumption of the current day. There is always a delay of a few hours before HQ publishes the information.{{< /alert >}}

When you enable sync of the hourly consumption one or more sensors are created in Home-Assistant named "* Hourly Consumption" depending on your rate.

### Rate D and D with CPC option (winter credits)

In the Energy Dashboard you will have to use the "Total Hourly Consumption" sensor in the "Grid Consumption" section.

### Flex-D and DT (dual energy)

For FlexD and Bi-Energy rates you can put the sensors "High price hourly consumption" and "Reg price hourly consumption". This will allow you to distinguish the two types of consumption in the dashboard.

![img](/images/configuration/home-assistant-3.png)

{{< alert color="warning">}}**The "Houly Consumption" sensor will always have a state of "unknown".** We do not have a state for it, we need to create it in order to push the statistics to it and for it to be available to add to the Energy Dashboard, but there will never be a value for it.
![img](/images/configuration/home-assistant-1.png)
{{< /alert >}}

## Historical energy consumption

Enabling the above option will sync the consumption of the last two days and all the future consumption data available. We also provide a way to import the historical hourly consumption data from up to the last two years.

![img](/images/configuration/home-assistant-2.png)

The clear button will delete all the hourly consumption history. It can be useful if you have some issue with the imported history.

The Days to sync option let you scope how far back you want to import the history. Our testing shows that import fails when going further that about 2 years in the past. You can also use this option to resync history if for some reason you miss a few days in your recent history.

The switch named "Sync hourly consumption history" is to be turned on when you want to start the sync.

{{< alert color="warning">}}The history sync can take an hour or more to complete and often result in errors and retry in the logs. This is normal. Do not retrigger history sync several time in a row without first restarting hydroqc2mqtt{{< /alert >}}

When it is done syncing the switch will turn itself off again. **You should only turn it on once, there is no benefit in doing a resync of the history if it is already imported.**

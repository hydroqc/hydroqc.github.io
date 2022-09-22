---
title: Overview
linkTitle: Overview
weight: 1
description: |
  Overview of the project
lastmod: 2022-09-22T12:40:13.967Z
---
{{< alert color="warning" title="Important" >}}**This project is not endorsed or affiliated with Hydro-Québec.**{{< /alert >}}

## Origin of the project

This project was created to provide a way to access Hydro-Québec account and winter credit data in Home-Assistant.

## What information can be retrieved from my account?

- General account data (billing period projection, current balance, current billing period consumption, and many more )

- Hourly Consumption can be sent to Home-Assitant to be used with the Energy Dashboard

- Winter credit signals are retrieved and can be used to trigger automations


## What are the various components?

### [HydroQC python library](https://gitlab.com/hydroqc/hydroqc)

The hydroqc python library is at the base of the project and handle all calls to Hydro-Quebec customer portal.

### [hydroqc2mqtt](https://gitlab.com/hydroqc/hydroqc2mqtt)

This module use the hydroqc library to fetch all pertinent account information and winter credit signals to be sent to MQTT. It also provide Home-Assistant discovery topics to create all the relevant sensors in Home-Assistant.

It also includes a separate logic that sends the hourly consumption statistics to Home-Assitant via websocket

### [Home-Assistant addon](https://gitlab.com/hydroqc/hydroqc-hass-addons)

The Home-Assistant addon wraps the hydroqc2mqtt daemon in a nice package to be used in Home-Assistant
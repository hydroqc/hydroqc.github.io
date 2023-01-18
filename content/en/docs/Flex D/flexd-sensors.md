---
title: Flex D Sensors
linkTitle: Flex D Sensors
weight: 47
description: |
  Description of Flex D sensors
lastmod: 2023-01-17T02:12:08.942Z
---

## Sensors description

Here is the description of some of the sensors linked to the Flex D rate.

{{< alert color="warning" title="Avertissement" >}}The sensor which represents a current state (Current dpc period detail) are at risk of not being updated in an timely manner. We recommend that you use the "timestamp" type sensor to trigger your automation.{{< /alert >}}

| Sensor name | Values | Description |
|-|-|-|
|Current dpc period detail | normal / peak | Name of the current period |
| next peak start / end | timestamp | The time when the next peak period begins and ends. Can be used as triggers in home-assistant automation. |
| next_pre-heat start | timestamp | Start time of the pre-heating period |
| net saving/loss vs rate d | -CA$50.52 | Gain or loss with flex D compared to the D rate. If the figure is positive it is a loss (it costs you more) |
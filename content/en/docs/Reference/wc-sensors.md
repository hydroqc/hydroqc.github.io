---
title: Winter Credit Sensors
linkTitle: Winter Credit Sensors
weight: 35
description: |
  Winter Credits specific sensor description.
lastmod: 2022-09-21T20:32:18.125Z
---

## Sensor Description

Here is the description of some of the sensors we provide that we feel needed more details. You need to be careful when using the current state values since they get updated only when we refresh the data every 10 minutes. This is a behavior we want to improve [(issue #5)](https://gitlab.com/hydroqc/hydroqc2mqtt/-/issues/5). In the mean time you can use the start/end timestamp values for more precise automations. If you want more details about the logics of each period you can get more details here: [https://hydroqc.ca/docs/winter-credits/](https://hydroqc.ca/docs/winter-credits/)

|Default HA name and MQTT Topic | Values | Description |
|-|-|-|
|Current period state for winter credit / current wc period detail | anchor / normal / peak / anchor_critical / peak_critical | Current period name and state **Be aware this is updated every 10mins.**|
| wc next anchor start / end | timestamp | The timestamp for the next anchor period start and end. Can be used as triggers in home-assistant automations. Will always have a value |
| wc next peak start / end | timestamp | The timestamp for the next peak period start and end. Can be used as triggers in home-assistant automations. Will always have a value |
| wc next critical peak start / end | timestamp | The timestamp for the next critical peak period start and end. Can be used as triggers in home-assistant automations. Will be "Unavailable" when the next peak event is not critical |
| wc upcoming_critical_peak | true/false | Is there any critical peak in the future. Will be true as soon as we detect an announcement from Hydro and will return to false once there is no critical peak in the future.|
| wc critical peak in progress | true/false | Are we in a critical peak right now. **Be aware this is updated every 10mins.**|
| wc next anchor critical | true/false | Is the next anchor period linked to a critical peak. Will be true from the end of the last peak to the end of the next peak if the next peak is critical.|
| wc next peak critical | true/false | Is the next peak period critical. Will be true from the end of the last peak to the end of the next peak if the next peak is critical.|
| wc upcoming critical peak today/tomorrow morning/evening | true/false | Is there a critical peak planed in the specified period. Will remain true/false until the end of the day |
| wc yesterday morning/evening * | various | The values (credit, reference energy, erased energy, actual consumption) for the critical peaks that happened yesterday. Will be unavailable if there was no critical peak the day before. |
| wc critical | true/false | Will be true from the end of the last peak to the end of the next peak if the next peak is critical. Since it is a duplicate of "next peak critical" it may be removed in the future|



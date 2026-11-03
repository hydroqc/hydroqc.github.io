---
title: Energy Dashboard
linkTitle: Energy Dashboard
weight: 25
description: |
  Configurations of the Home-Assistant Energy Dashboard
lastmod: 2026-11-03T00:00:00.000Z
date: 2023-11-08T00:33:30.524Z
---

## Hourly Consumption in Energy Dashboard

{{% alert color="info" title="Disable Consumption Sync" %}}
If you don't need consumption tracking or use another integration for this, you can disable consumption sync during initial setup or in the integration options. This will prevent consumption sensors from being created and disable the history sync service.
{{% /alert %}}

{{% alert color="warning"%}}**Hourly consumption from Hydro-Québec is not live.** The hourly consumption will sync automatically when it is available from Hydro-Québec. On the website you can only see the hourly consumption from the previous day. There is always a delay of a few hours before HQ publishes the information.{{% /alert %}}

When you enable sync of the hourly consumption, one or more sensors are created in Home-Assistant named "* Hourly Consumption" depending on your rate.

### Rate D and D with CPC option (winter credits)

In the Energy Dashboard you will have to use the "Total Hourly Consumption" sensor in the "Grid Consumption" section.

### Flex-D and DT (dual energy)

For FlexD and Bi-Energy rates you can put the sensors "High price hourly consumption" and "Reg price hourly consumption". This will allow you to distinguish the two types of consumption in the dashboard.

![img](/images/configuration/home-assistant-3.png)

{{% alert color="warning"%}}**The "Hourly Consumption" sensor will always have a state of "unknown".** We do not have a state for it, we need to create it in order to push the statistics to it and for it to be available to add to the Energy Dashboard, but there will never be a value for it.

![img](/images/configuration/home-assistant-1.png)
{{% /alert %}}

## Historical Energy Consumption

### Initial Setup

Enabling hourly consumption sync during **hydroqc-ha** integration setup will automatically sync:

- Data from the **last 30 days** via regular sync (efficient and fast)
- For more than 30 days: automatic CSV import in the background during initial setup

### Manual History Import

The **hydroqc-ha** integration provides a Home Assistant service to manually import hourly consumption history up to **2 years back**.

**Service**: `hydroqc.sync_consumption_history`

**Parameters**:

- `days_back`: Number of days to import (default: 731 days = ~2 years)
- `device_id`: The HydroQC device corresponding to your contract

**Usage in Actions**:

```yaml
action: hydroqc.sync_consumption_history
data:
  days_back: 365  # Import last year
target:
  device_id: <your_device_id>
```

**From the UI**:

1. Go to **Developer Tools** → **Services**
2. Select the service **HydroQC: Sync consumption history**
3. Select your HydroQC device
4. Specify the number of days (optional, default: 731)
5. Click **Call Service**

{{% alert color="warning" title="Important" %}}

- Import runs in the **background** and can take **30 minutes to 1 hour** depending on data volume
- Don't run the service multiple times consecutively - wait for the previous import to complete
- Check Home Assistant logs to monitor progress
- Import uses Hydro-Québec's CSV API (more efficient for large periods)

{{% /alert %}}

### Managing Statistics

If you need to correct or delete hourly consumption statistics (for example, after an incorrect import), you can do so via Home Assistant's **Developer Tools**:

**Access statistics**:

1. Go to **Developer Tools** → **Statistics**
2. Search for your hourly consumption sensors (e.g., `sensor.home_total_hourly_consumption`)
3. Click on the sensor to see all recorded statistics

**Adjust or delete a statistic**:

1. Click the **Adjust sum** button to correct an incorrect value
2. Or select a date range and click **Delete** to erase data from a specific period
3. Changes will take effect immediately in the Energy Dashboard

{{% alert color="warning" title="Warning" %}}

Deleting statistics is **permanent** and cannot be undone. Make sure you want to delete the data before confirming. If you accidentally delete history, you'll need to re-import the data using the `hydroqc.sync_consumption_history` service.

{{% /alert %}}

**Common use cases**:

- Correct outliers caused by import errors
- Remove duplicates after accidental multiple imports
- Clean up statistics before a complete re-import
- Adjust data after a timezone change or DST transition

---
title: Troubleshooting
linkTitle: Troubleshooting
weight: 50
description: |
  General troubleshooting steps
date: 2022-09-21T20:33:24.876Z
lastmod: 2026-11-03T00:00:00.000Z
---

{{% alert color="warning" title="Important" %}}**All the components of the HydroQC project depend on the Hydro-Québec customer portal.**

**The customer portal is not a high-criticality 24/7, 99.999% uptime service.**

From our experience it undergoes maintenance almost daily, during the day, the evening or over night. There is often downtime after 21h-22h on weekends.

If your installation is working correctly but you are seeing errors in the logs from time to time, know that it is expected.{{% /alert %}}

1. **Check that you can access the Hydro-Québec customer portal with your account.**

2. Check the [Known Issues](./known-issues).

3. Enable debug logging for the integration in your `configuration.yaml`:

    ```yaml
    logger:
      default: info
      logs:
        custom_components.hydroqc: debug
        custom_components.hydroqc.config_flow.base: debug
        custom_components.hydroqc.coordinator.base: debug
    ```

4. Post the information on Discord [#support](https://discord.gg/JaRfRJEByz) or open an issue for [hydroqc-ha](https://github.com/hydroqc/hydroqc-ha/issues).

## Common problems

### Connection failed

- Verify your credentials on the [Hydro-Québec website](https://session.hydroquebec.com/)
- Check for special characters in your password
- Make sure the account has active contracts

### No data appearing

- Wait 60 seconds for the first update
- Check the Home Assistant logs: **Settings > System > Logs**
- Verify the Hydro-Québec portal is online

### Sensors unavailable

- Some sensors are only active during specific seasons (winter credits)
- Verify that your rate plan supports the sensor
- For peak sensors, verify that a calendar is configured and contains the expected events
- Check that the coordinator is updating (check the logs)

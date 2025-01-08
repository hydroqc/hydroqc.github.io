---
title: Troubleshooting
linkTitle: Troubleshooting
weight: 50
description: |
  General troubleshooting steps
date: 2022-09-21T20:33:24.876Z
lastmod: 2025-01-08T16:51:07.251Z
---

{{< alert color="warning" title="Important" >}}**All the components of the HydroQC project depend on the Hydro-Quebec customer portal.**

**The customer portal is not a high-criticality 24/7, 99.999% uptime service.**

From our experience it undergoes maintenance almost daily, during the day, the evening or over night. There is often downtime after 21h-22h on weekends.

If your installation is working correctly but you are seeing container/addon restart a few times a day know that it is expected.{{< /alert >}}


1. **Check that you can access your Hydro-Quebec customer portal with your account.**

2. Check the [Known Issues](./known-issues)

2. Enable debugging

    ```
    HQ2M_CONTRACTS_0_LOG_LEVEL=DEBUG
    HQ2M_CONTRACTS_0_HTTP_LOG_LEVEL=DEBUG
    ```
3. Post the information on Discord [#support](https://discord.gg/2NrWKC7sfF) or open an issue for [hydroqc2mqtt](https://gitlab.com/hydroqc/hydroqc2mqtt/-/issues) or the [Home-Assistant addon](https://gitlab.com/hydroqc/hydroqc-hass-addons)

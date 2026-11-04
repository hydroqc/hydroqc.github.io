---
title: Known Issues
linkTitle: Known Issues
weight: 52
description: |
  Issues we are aware of and their workarounds.
date: 2022-09-21T18:41:22.563Z
lastmod: 2026-11-03T00:00:00.000Z
---

## Consumption does not sync

### Occasional issue

During the start or end of the billing period, consumption is not available in the portal, so HydroQC is unable to retrieve it. Wait two or three days after the start of your billing period and consumption should start syncing again on its own.

### Long-term history does not sync

When the integration has been running for a while, the consumption history import can stop responding. If you plan to import your long-term historical data, restart Home Assistant before running the import.

## Errors in the logs from time to time

Hydro-Québec often performs maintenance on their systems which results in errors in HydroQC clients. If your installation is generally functional but you see errors in the logs from time to time, there's no need to worry.

## `binascii.Error: Incorrect padding` error

We have had a report of this issue. The problem comes from the Hydro-Québec client portal returning malformed JSON when the person's name contains special characters (for example Benoît). The solution is to modify the name in the client portal.

- Log in to your Hydro-Québec client portal

- Move your cursor over your name in the top right

- Click on "Login Information" (Identification Data)

- Change your full name to remove all accented characters

Try again.

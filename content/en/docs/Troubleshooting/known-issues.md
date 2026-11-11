---
title: Known Issues
linkTitle: Known Issues
weight: 52
description: |
  Issues we are aware of and their workarounds.
date: 2022-09-21T18:41:22.563Z
lastmod: 2026-11-11T00:00:00.000Z
---

## Email verification (MFA) and session duration

Since November 5, 2026, the Hydro-Québec customer portal requires an email verification code for every new session.

**Resolved since version 0.9.1.** The integration now signs in through the **Hydro-Québec mobile app** authentication endpoints. That client renews the session automatically and keeps it for about **90 days**, so the email verification code is only requested during the first setup and when the session expires.

The integration shows the **Email verification** step during initial setup, reconfiguration and reauthentication. Enter the code you received; an empty field requests a new code.

The login client can be changed in **Settings** → **Devices & services** → **Hydro-Québec** → **Configure** → **Advanced** → **Login client**:

| Client | Session duration | Verification code |
| --- | --- | --- |
| **Mobile app** (default) | 90 days, renewed on each login | Once, then only when the session expires |
| **Web portal** | 24 hours | Every day |

Switching client reloads the integration and asks for a new code: a session from one client cannot be used with the other. If the mobile client stops working, select the web portal.

After the session expires, Home Assistant shows **Reauthentication required** in **Settings** → **Devices & services**: click **Reauthenticate** and enter the new code. Automatic logins never request a code: they stop at the verification step and wait for a reauthentication. See [Email verification](../../installation/hass-integration/#email-verification-mfa).

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

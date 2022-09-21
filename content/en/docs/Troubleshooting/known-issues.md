---
title: Known issues
linkTitle: Known issues
weight: 52
description: |
  Issues we are aware of and their workarounds when available
lastmod: 2022-09-21T18:41:22.563Z
---

## Hydroqc2mqtt (or the addon) restarts often

Hydro-Quebec often have maintenance on their systems that will result in errors in hydroqc clients. If your installation is usually functionnal but the container/addon restarts once in a while there is no need to worry.

## Duplicate entities in Home-Assistant

Sometimes if issues are encountered when configuring hydroqc2mqtt (or the addon) for the first time it may run with invalid values and create empty entities.

You can resolve this by doing the following

- Stop hydroqc2mqtt or the addon

- Leave mqtt running

- Go in the mqtt integration in Home-Assistant and open the hydroqc entity

- In the "Device Info" box click on the three dots and click "Delete"
  This will remove all the hydroqc entities in Home-Assistant and in mqtt.

- You can then start hydroqc2mqtt or the addon and all entities will be recreated without the duplicates.

## `binascii.Error: Incorrect padding` error

We have had one reported occurence of this issue. The problem come from Hydro-Québec customer portal returning malformed JSON when the person's name contain special characters. The solution is to change the name in the customer portal (no need to change it on the account).

- Login to your Hydro-Quebec customer portal

- Move your cursor over your name in the top right

- Click on "Login Information" (Données d'identification)

- Change your Full Name to remove any accented characters

Try the module again.
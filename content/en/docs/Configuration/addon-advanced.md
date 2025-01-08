---
title: Add-on - Advanced Configuration
linkTitle: Add-on - Advanced Configuration
weight: 28
description: |
  Advanced Add-on configuration via configuration file
date: 2025-01-08T16:46:20.068Z
lastmod: 2025-01-08T16:46:22.440Z
---

If you are using the add-on and want to have multiple contracts in your Home-Assistant, you will need to manually configure the Add-on with the configuration file.

1. You will need to create a long-lived access token and a specific account for Hydroqc in your mosquitto add-on. This is beyond the scope of this documentation but you can find how in the Home-Assistant documentation and the Mosquitto add-on documentation.

2. Create a configuration file in the `/config` folder of your Home-Assistant installation. Hint: you can install the Vscode add-on for this.

3. Modify this file to include your [custom configurations](/en/docs/configuration/config-file/).

You can use these values specific to Home-Assistant OS

```yaml
...
mqtt_host: "core-mosquitto"
mqtt_port: "1883"

contracts:
  maison:
    ...
      home_assistant_websocket_url: http://home-assistant.local:8123/api/websocket

```
4. Configure the add-on to use the file.

Go to the Hydroqc add-on configuration, scroll to the bottom and enable "Show unused optional configuration options"

Once this option is enabled, scroll to the bottom and enter the full path to your configuration file. For example: `/config/hydroqc.yaml`

You will need to put values in the required fields "Contract Name" and "Rate of the contract". These values are not taken into account when the configuration file is used.

5. Start the add-on.

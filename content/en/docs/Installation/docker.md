---
title: Docker
linkTitle: Docker
weight: 12
description: |
  Install with docker
date: 2022-09-22T12:38:37.777Z
lastmod: 2025-01-08T15:59:39.478Z
---

**The examples below are not always up to date, please refer to the [Configuration](/en/docs/configuration/) section for valid configurations.**

Edit the environment variable in the following command to start the project.

```bash
docker run -d --restart=always --name hydroqc2mqtt \
-e MQTT_USERNAME='yourmqttusername' \
-e MQTT_PASSWORD='yourmqttpassword' \
-e MQTT_HOST='yourmqttserver' \
-e MQTT_PORT='1883' \
-e HQ2M_CONTRACTS_0_NAME='maison' \
-e HQ2M_CONTRACTS_0_USERNAME='HQUsername' \
-e HQ2M_CONTRACTS_0_PASSWORD='HQPassword' \
-e HQ2M_CONTRACTS_0_CUSTOMER='HQCustomerNo' \
-e HQ2M_CONTRACTS_0_ACCOUNT='HQAccountNo' \
-e HQ2M_CONTRACTS_0_CONTRACT='HQContractNo' \
-e HQ2M_CONTRACTS_0_RATE='D' \
-e HQ2M_CONTRACTS_0_RATE_OPTION='CPC' \
-e HQ2M_CONTRACTS_0_PREHEAT_DURATION_MINUTES='180' \
-e HQ2M_CONTRACTS_0_SYNC_HOURLY_CONSUMPTION_ENABLED="true" \
-e HQ2M_CONTRACTS_0_HOME_ASSISTANT_WEBSOCKET_URL=http://home-assistant:8123/api/websocket \
-e HQ2M_CONTRACTS_0_HOME_ASSISTANT_TOKEN=dqwdq23dqwd34q234dr \
registry.gitlab.com/hydroqc/hydroqc2mqtt
```

You can also use the following `docker-compose.yaml` file in a folder and run `docker-compose up -d`.

```yaml
version: "3"
services:
  hydroqc2mqtt:
    image: registry.gitlab.com/hydroqc/hydroqc2mqtt
    restart: always
    environment:
      MQTT_USERNAME: 'yourmqttusername'
      MQTT_PASSWORD: 'yourmqttpassword'
      MQTT_HOST: 'yourmqttserver'
      MQTT_PORT: '1883'
      HQ2M_CONTRACTS_0_NAME: 'maison'
      HQ2M_CONTRACTS_0_USERNAME: 'HQUsername'
      HQ2M_CONTRACTS_0_PASSWORD: 'HQPassword'
      HQ2M_CONTRACTS_0_CUSTOMER: 'HQCustomerNo'
      HQ2M_CONTRACTS_0_ACCOUNT: 'HQAccountNo'
      HQ2M_CONTRACTS_0_CONTRACT: 'HQContractNo'
      HQ2M_CONTRACTS_0_RATE: 'D'
      HQ2M_CONTRACTS_0_RATE_OPTION: 'CPC'
      HQ2M_CONTRACTS_0_PREHEAT_DURATION_MINUTES: '180'
      HQ2M_CONTRACTS_0_SYNC_HOURLY_CONSUMPTION_ENABLED: "true"
      HQ2M_CONTRACTS_0_PREHEAT_DURATION_MINUTES: '180'
      HQ2M_CONTRACTS_0_HOME_ASSISTANT_WEBSOCKET_URL: 'http://home-assistant:8123/api/websocket'
      HQ2M_CONTRACTS_0_HOME_ASSISTANT_TOKEN: 'dqwdq23dqwd34q234dr'
```

### Unraid
If you are on unraid devzwf created a community app to install the hydroqc2mqtt
 - [hydroqc2mqtt Unraid app](https://unraid.net/community/apps?q=hydroqc2mqtt)
 - [Unraid app specific support](https://forums.unraid.net/topic/129079-support-devzwf-hydroqc2mqtt)

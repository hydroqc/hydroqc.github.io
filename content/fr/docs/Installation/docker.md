---
title: Docker
linkTitle: Docker
weight: 12
description: |
  Installation avec docker
date: 2022-09-22T12:38:37.777Z
lastmod: 2025-01-08T15:59:20.834Z
---

**Les exemples ci-dessous ne sont pas toujours mis à jour, référez-vous à la section [Configuration](/fr/docs/configuration/) pour les configurations valide.**

Adaptez les variables d'environnement à votre goût et démarrer le conteneur.

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
-e HQ2M_CONTRACTS_0_RATE='CPC' \
-e HQ2M_CONTRACTS_0_PREHEAT_DURATION_MINUTES='180' \
-e HQ2M_CONTRACTS_0_SYNC_HOURLY_CONSUMPTION_ENABLED="true" \
-e HQ2M_CONTRACTS_0_HOME_ASSISTANT_WEBSOCKET_URL=http://home-assistant:8123/api/websocket \
-e HQ2M_CONTRACTS_0_HOME_ASSISTANT_TOKEN=dqwdq23dqwd34q234dr \
registry.gitlab.com/hydroqc/hydroqc2mqtt
```

Vous pouvez également placer le fichier `docker-compose.yaml` dans un dossier et exécuter `docker-compose up -d`.

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
      HQ2M_CONTRACTS_0_RATE: 'CPC'
      HQ2M_CONTRACTS_0_PREHEAT_DURATION_MINUTES: '180'
      HQ2M_CONTRACTS_0_SYNC_HOURLY_CONSUMPTION_ENABLED: "true"
      HQ2M_CONTRACTS_0_HOME_ASSISTANT_WEBSOCKET_URL: 'http://home-assistant:8123/api/websocket'
      HQ2M_CONTRACTS_0_HOME_ASSISTANT_TOKEN: 'dqwdq23dqwd34q234dr'
```

### Unraid

Si vous utilisez Unraid, devzwf a créé une application Unraid pour faire l'installation
 - [hydroqc2mqtt Unraid app](https://unraid.net/community/apps?q=hydroqc2mqtt)
 - [Support Unraid app](https://forums.unraid.net/topic/129079-support-devzwf-hydroqc2mqtt)

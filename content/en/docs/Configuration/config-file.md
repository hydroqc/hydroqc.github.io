---
title: Configuration File
linkTitle: Configuration File
weight: 27
description: |
  Configuration File 
lastmod: 2022-09-21T19:49:55.894Z
---

The configuration file contains the same options and values as the environment variable but in a yaml file. You can refer to the environement documentation for more details.

```yaml
sync_frequency: 600
# Multiple contracts can be defined here
contracts:
  - name: maison # This will be used as the device name in HA and in the topic structure in MQTT
    username: USERNAME
    password: PASSWORD

    # Customer number (Numéro de facture) from your invoice. 10 digits
    # 10 digits, you may need to add a leading 0 to the value!!!
    # Ex: "987 654 321" will be "0987654321"
    customer: "customer_id"

    # Account Number (Numéro de compte) from your invoice
    account: "account_id"

    # Contract Number (Numéro de contrat) from your invoice
    # 10 digits, you may need to add a leading 0 to the value!!!
    # Ex: "123 456 789" will be "0123456789"
    contract: "contract_id"

    # Home-Assistant energy statistics
    sync_hourly_consumption_enabled: false
    home_assistant_websocket_url: http://127.0.0.1:8123/api/websocket
    home_assistant_token: "YOUR LONGLIVED ACCESS TOKEN"
```
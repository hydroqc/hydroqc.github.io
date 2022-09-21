---
title: Environment Variable
linkTitle: Environment Variable
weight: 26
description: |
  Environment variables
lastmod: 2022-09-21T00:38:19.782Z
---

## Refresh interval

The refresh interval is an area we have greatly improved on since version 0.4.0. The hydroqc library now provides caching of the data fetched from the customer portal. This means we can increase the refresh interval of the sensors without querying Hydro-Québec each time. The main gain here is that we are able to set the refresh interval to every 60 seconds which greatly improve the reliability of the Winter Credit sensors and partly adress [issue #5](https://gitlab.com/hydroqc/hydroqc2mqtt/-/issues/5).

| Variable | Syntax | Example | Comment |
|- | - | - | - |
| HQ2M_SYNC_FREQUENCY | integer | 60 | |

## MQTT configuration variables

| Variable | Syntax | Example | Comment |
|- | - | - | - |
| MQTT_USERNAME | string | `hydroqcuser` | Optional |
| MQTT_PASSWORD | string | `yourmqttpassword` | Optional |
| MQTT_HOST | string | `yourmqttserver.tld` | Required |
| MQTT_PORT | string | `'1883'` | Required make sure it is between 'quotes' |

## Hydro-Quebec account variables

| Variable | Syntax | Example | Comment |
|- | - | - | - |
| HQ2M_CONTRACTS_0_NAME | lowercase string | `maison` | Name of the contract, will appear in Home Assistant and in the hydroqc topics. |
| HQ2M_CONTRACTS_0_USERNAME | string | `email@domain.tld`| Username for your HQ account |
| HQ2M_CONTRACTS_0_PASSWORD | string | `'Soleil123'`| Your HQ account password |
| HQ2M_CONTRACTS_0_CUSTOMER | string | `'0987654321'` | Customer number (Numéro de client) from your invoice. **10 digits, you may need to add a leading 0 to the value** Ex: '987 654 321' will be '0987654321'|
| HQ2M_CONTRACTS_0_ACCOUNT | string | `'654321987654'` | Account Number (Numéro de compte) from your invoice |
| HQ2M_CONTRACTS_0_CONTRACT | string | `'0123456789'` | Contract Number (Numéro de contrat) from your invoice. **10 digits, you may need to add a leading 0 to the value.** Ex: '123 456 789' will be '0123456789'


## Home-Assistant specific variables

| Variable | Syntax | Example | Comment |
|- | - | - | - |
|HQ2M_CONTRACTS_0_SYNC_HOURLY_CONSUMPTION_ENABLED | string | `"true"` | Enable importing hourly consumption from Hydro-Quebec (last 24h) |
|HQ2M_CONTRACTS_0_HOME_ASSISTANT_WEBSOCKET_URL | string | `http://home-assistant:8123/api/websocket` | URL to your Home-Assistant installation websocket API |
HQ2M_CONTRACTS_0_HOME_ASSISTANT_TOKEN | string | `dqwdq23dqwd34q234dr` | Long-lived Home-Assistant access token to be used to access the API |

## Multiple contracts

Account variables are configurable as an array which allows you to have more than one contract synced by the integration. You simply have to create new variable by incrementing the contract number.

```
HQ2M_CONTRACTS_0_NAME='maison' \
HQ2M_CONTRACTS_0_USERNAME='email@domain.tld'
HQ2M_CONTRACTS_0_PASSWORD='Password'
HQ2M_CONTRACTS_0_CUSTOMER='0987654321'
HQ2M_CONTRACTS_0_ACCOUNT='654321987654'
HQ2M_CONTRACTS_0_CONTRACT='0123456789'

HQ2M_CONTRACTS_1_NAME='chalet' \
HQ2M_CONTRACTS_1_USERNAME='email@domain.tld'
HQ2M_CONTRACTS_1_PASSWORD='Password'
HQ2M_CONTRACTS_1_CUSTOMER='0912354321'
HQ2M_CONTRACTS_1_ACCOUNT='654123987654'
HQ2M_CONTRACTS_1_CONTRACT='0112356789'

HQ2M_CONTRACTS_2_NAME='triplex' \
HQ2M_CONTRACTS_2_USERNAME='email@domain.tld'
HQ2M_CONTRACTS_2_PASSWORD='Password'
HQ2M_CONTRACTS_2_CUSTOMER='0812354321'
HQ2M_CONTRACTS_2_ACCOUNT='854123987654'
HQ2M_CONTRACTS_2_CONTRACT='0122356789'
```
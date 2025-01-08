---
title: Variables d'environement
linkTitle: Variables d'environement
weight: 26
description: |
  Variables d'environment
date: 2022-12-22T01:35:29.596Z
lastmod: 2025-01-08T16:00:03.661Z
---

## Variable de configuration MQTT

| Variable | Syntaxe | Exemple | Commentaire |
|- | - | - | - |
| MQTT_USERNAME | string | `hydroqcuser` | Facultatif |
| MQTT_PASSWORD | string | `yourmqttpassword` | Facultatif |
| MQTT_HOST | string | `yourmqttserver.tld` | Requis |
| MQTT_PORT | string | `'1883'` | Requis, assurez vous de le mettre entre guillemets simple '' |

## Variables de compte Hydro-Québec

| Variable | Syntaxe | Exemple | Commentaire |
|- | - | - | - |
| HQ2M_CONTRACTS_0_NAME | lowercase string | `maison` | Le nom du contrat apparaîtra dans Home-Assistant et dans les topic MQTT Hydroqc. |
| HQ2M_CONTRACTS_0_USERNAME | string | `email@domain.tld`| Courriel de login au portail Hydro-Québec |
| HQ2M_CONTRACTS_0_PASSWORD | string | `'Soleil123'`| Mot de passe du portail |
| HQ2M_CONTRACTS_0_CUSTOMER | string | `'0987654321'` | Numéro de client visible sur votre facture. **10 chiffres, vous devez possiblement ajouter un 0 au début** Ex: '987 654 321' deviendra '0987654321'|
| HQ2M_CONTRACTS_0_ACCOUNT | string | `'654321987654'` | Numéro de compte visible sur votre facture. |
| HQ2M_CONTRACTS_0_CONTRACT | string | `'0123456789'` | Numéro de contrat visible sur votre facture. **10 chiffres, vous devez possiblement ajouter un 0 au début** Ex: '123 456 789' deviendra '0123456789'|
| HQ2M_CONTRACTS_0_PREHEAT_DURATION_MINUTES | string | `'180'` | Durée désirée de la période de préchauffage'|
| HQ2M_CONTRACTS_0_RATE | string | `'D'` | Code de votre tarif au contrat|
| HQ2M_CONTRACTS_0_RATE_OPTION | string | `'CPC'` | Option tarifaire au contrat |

## Variables pour Home-Assistant

| Variable | Syntaxe | Exemple | Commentaire |
|- | - | - | - |
|HQ2M_CONTRACTS_0_SYNC_HOURLY_CONSUMPTION_ENABLED | string | `"true"` | Active l'import de la consommation horaire dans Home-Assistant. |
|HQ2M_CONTRACTS_0_HOME_ASSISTANT_WEBSOCKET_URL | string | `http://home-assistant:8123/api/websocket` | Adresse de l'API websocket de votre instance Home-Assistant |
HQ2M_CONTRACTS_0_HOME_ASSISTANT_TOKEN | string | `dqwdq23dqwd34q234dr` | Jetons d'accès de longue durée générée dans Home-Assistant pour l'envoi de la consommation |

## Contrats multiples

Les variables de compte sont configurables comme un tableau qui vous permet d'avoir plus d'un contrat synchronisé par l'intégration. Il vous suffit de créer une nouvelle variable en incrémentant le numéro de contrat.

```
HQ2M_CONTRACTS_0_NAME='maison'
HQ2M_CONTRACTS_0_RATE: D
HQ2M_CONTRACTS_0_RATE_OPTION: CPC
HQ2M_CONTRACTS_0_USERNAME='email@domain.tld'
HQ2M_CONTRACTS_0_PASSWORD='Password'
HQ2M_CONTRACTS_0_CUSTOMER='0987654321'
HQ2M_CONTRACTS_0_ACCOUNT='654321987654'
HQ2M_CONTRACTS_0_CONTRACT='0123456789'

HQ2M_CONTRACTS_1_NAME='chalet'
HQ2M_CONTRACTS_1_RATE: DPC
HQ2M_CONTRACTS_1_USERNAME='email@domain.tld'
HQ2M_CONTRACTS_1_PASSWORD='Password'
HQ2M_CONTRACTS_1_CUSTOMER='0912354321'
HQ2M_CONTRACTS_1_ACCOUNT='654123987654'
HQ2M_CONTRACTS_1_CONTRACT='0112356789'

HQ2M_CONTRACTS_2_NAME='triplex'
HQ2M_CONTRACTS_2_RATE: DT
HQ2M_CONTRACTS_2_USERNAME='email@domain.tld'
HQ2M_CONTRACTS_2_PASSWORD='Password'
HQ2M_CONTRACTS_2_CUSTOMER='0812354321'
HQ2M_CONTRACTS_2_ACCOUNT='854123987654'
HQ2M_CONTRACTS_2_CONTRACT='0122356789'
```

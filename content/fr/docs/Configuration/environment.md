---
title: Variables d'environement
linkTitle: Variables d'environement
weight: 26
description: |
  Variables d'environment
lastmod: 2022-12-22T01:35:29.596Z
---

## Intervalle de rafraîchissement

Depuis la version 0.4.0, la bibliothèque HydroqC fournit désormais la mise en cache des données obtenues à partir du portail client. Cela signifie que nous pouvons augmenter l'intervalle de rafraîchissement des capteurs sans interroger Hydro-Québec à chaque fois. Le principal gain est que nous sommes en mesure de définir l'intervalle de rafraîchissement à toutes les 60 secondes, ce qui améliore considérablement la fiabilité des capteurs de crédit hivernaux et règle en partie [issue #5](https://gitlab.com/hydroqc/hydroqc2mqtt/-/issues/5).

| Variable | Syntaxe | Exemple | Commentaire |
|- | - | - | - |
| HQ2M_SYNC_FREQUENCY | entier | 60 | |

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
| HQ2M_CONTRACTS_0_PREHEAT_DURATION_MINUTES | string | `'180'` | Durée désiré de la période de préchauffage'|
| HQ2M_CONTRACTS_0_RATE | string | `'D'` | Code de votre tarif au contrat|
| HQ2M_CONTRACTS_0_RATE_OPTION | string | `'CPC'` | Option tarifaire au contrat **Doit être à `'NONE'` si vous en avez pas** |

## Variables pour Home-Assistant

| Variable | Syntaxe | Exemple | Commentaire |
|- | - | - | - |
|HQ2M_CONTRACTS_0_SYNC_HOURLY_CONSUMPTION_ENABLED | string | `"true"` | Active l'import de la consomation horaire dans Home-Assistant. |
|HQ2M_CONTRACTS_0_HOME_ASSISTANT_WEBSOCKET_URL | string | `http://home-assistant:8123/api/websocket` | Adresse de l'API websocket de votre instance Home-Assistant |
HQ2M_CONTRACTS_0_HOME_ASSISTANT_TOKEN | string | `dqwdq23dqwd34q234dr` | Jetons d'accès de longue durée généré dans Home-Assistant pour l'envoi de la consomation |

## Contrats multiples

Les variables de compte sont configurables comme un tableau qui vous permet d'avoir plus d'un contrat synchronisé par l'intégration. Il vous suffit de créer une nouvelle variable en incrémentant le numéro de contrat.

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
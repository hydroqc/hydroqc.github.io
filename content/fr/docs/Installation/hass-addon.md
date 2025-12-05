---
title: Home-Assistant Addon (Hérité)
linkTitle: Home-Assistant Addon
weight: 14
description: |
  Installation avec le addon Home-Assistant (Hérité - Non recommandé pour les nouveaux utilisateurs)
date: 2022-09-21T19:50:59.393Z
lastmod: 2025-12-02T00:00:00.000Z
---

{{% alert color="warning" title="Avis de dépréciation" %}}
**Cet addon est en cours de dépréciation.** Pour les nouvelles installations, nous recommandons fortement d'utiliser [**l'intégration personnalisée hydroqc-ha**](../hass-integration) à la place. L'addon ne recevra plus de nouvelles fonctionnalités et sera éventuellement retiré.

La nouvelle intégration personnalisée offre:
- Intégration native Home Assistant sans MQTT
- Meilleure performance et fiabilité
- Configuration plus facile
- Parité complète des fonctionnalités

[Cliquez ici pour le nouveau guide d'installation](../hass-integration)
{{% /alert %}}

## Instructions d'installation héritées

**Prérequis**

Vous devez avoir un broker MQTT d'installé sur votre système, par exemple Mosquitto.

[![Open your Home Assistant instance and show the dashboard of an add-on.](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_mosquitto)

**Option 1**

Utilisez le bouton suivant:

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgitlab.com%2Fhydroqc%2Fhydroqc-hass-addons)

**Option 2**

Dans la section "Supervisor" -> Add-on Store -> cliquez sur les "..." verticaux en haut à droite et ajoutez : https://gitlab.com/hydroqc/hydroqc-hass-addons.git

Une fois terminé, accédez à l'addon hydroqc et cliquez sur Installer.

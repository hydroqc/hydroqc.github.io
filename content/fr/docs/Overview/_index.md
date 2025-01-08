---
title: Survol
linkTitle: Survol
weight: 1
description: |
  Survol du projet
date: 2022-09-22T12:40:13.967Z
lastmod: 2025-01-08T16:51:07.251Z
---
{{< alert color="warning" title="Important" >}}**Ce projet n'est pas affilié à Hydro-Québec!**{{< /alert >}}

## Origine du projet

Ce projet a été créé pour fournir un moyen d'accéder aux données de compte Hydro-Québec et des signaux de crédits hivernaux pour intégration dans Home-Assistant.

## Quelles informations peuvent être récupérées de mon compte?

- Données générales du compte (projection de la période de facturation, solde actuel, consommation actuelle de la période de facturation et bien d'autres)

- La consommation horaire peut être envoyée à Home-Assistant pour être utilisée avec le tableau de bord énergétique

- Les signaux de crédits hivernaux sont récupérés et peuvent être utilisés pour déclencher des automatismes.


## Quels sont les différents composants?

### [Bibliothèque python HydroQC](https://gitlab.com/hydroqc/hydroqc)

La bibliothèque HydroqC Python est à la base du projet et traite tous les appels vers le portail client Hydro-Quebec.

### [hydroqc2mqtt](https://gitlab.com/hydroqc/hydroqc2mqtt)

Ce module utilise la bibliothèque HydroqC pour récupérer toutes les informations pertinentes et les signaux de crédits hivernaux à envoyer à MQTT. Il fournit également "discovery topics" d'Home-Assistant pour créer tous les capteurs pertinents dans Home-Assistant.

Il comprend également une logique distincte qui envoie les statistiques de consommation horaire à Home-Assistant via WebSocket.

### [Addon Home-Assistant](https://gitlab.com/hydroqc/hydroqc-hass-addons)

L'addon Home-Assistant intégre Hydroqc2MQTT dans un interface convivial à utiliser dans Home-Assistant


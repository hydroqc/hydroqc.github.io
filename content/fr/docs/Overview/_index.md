---
title: Survol
linkTitle: Survol
weight: 1
description: |
  Survol du projet
date: 2022-09-22T12:40:13.967Z
lastmod: 2025-12-02T18:00:00.000Z
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

La bibliothèque HydroQC Python est à la base du projet et traite tous les appels vers le portail client Hydro-Québec.

### [hydroqc-ha - Intégration personnalisée Home Assistant](https://github.com/hydroqc/hydroqc-ha) ⭐ **Recommandé**

L'intégration personnalisée **hydroqc-ha** est la méthode recommandée pour intégrer Hydro-Québec avec Home Assistant. Elle fournit une intégration native Home Assistant avec toutes les fonctionnalités intégrées directement dans Home Assistant sans nécessiter de démons externes ou de courtiers MQTT.

**Caractéristiques principales:**
- Intégration native Home Assistant
- Aucun courtier MQTT requis
- Découverte automatique des capteurs
- Intégration au tableau de bord énergétique
- Support pour les crédits hivernaux et la tarification dynamique
- Support multi-contrats

**Pour les nouvelles installations avec Home Assistant, utilisez hydroqc-ha.**

### [hydroqc2mqtt](https://gitlab.com/hydroqc/hydroqc2mqtt)

Ce module utilise la bibliothèque HydroQC pour récupérer toutes les informations pertinentes et les signaux de crédits hivernaux à envoyer à MQTT. Il fournit également des "discovery topics" d'Home-Assistant pour créer tous les capteurs pertinents dans Home-Assistant.

{{< alert color="warning" title="Avis de dépréciation" >}}
La fonctionnalité de synchronisation de consommation vers Home Assistant dans hydroqc2mqtt est en cours de dépréciation en faveur de la nouvelle intégration personnalisée **hydroqc-ha**. hydroqc2mqtt continuera d'être maintenu pour les utilisateurs de plateformes autres que Home Assistant.
{{< /alert >}}

**Utilisez hydroqc2mqtt si:**
- Vous utilisez une plateforme domotique autre que Home Assistant
- Vous voulez intégrer avec des systèmes personnalisés basés sur MQTT

### [Addon Home-Assistant](https://gitlab.com/hydroqc/hydroqc-hass-addons) ⚠️ **Hérité**

{{< alert color="warning" title="Avis de dépréciation" >}}
L'addon Home Assistant est en cours de dépréciation en faveur de la nouvelle intégration personnalisée **hydroqc-ha**. L'addon ne recevra plus de nouvelles fonctionnalités et sera éventuellement retiré. Les utilisateurs existants devraient planifier la migration vers l'intégration hydroqc-ha.
{{< /alert >}}

L'addon Home-Assistant intègre le démon hydroqc2mqtt dans un package pour Home-Assistant. **Les nouveaux utilisateurs devraient utiliser l'intégration personnalisée hydroqc-ha à la place.**


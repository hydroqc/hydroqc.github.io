---
title: Blueprint Flex D
linkTitle: Blueprint Flex D
weight: 47
description: |
  Blueprint Home-Assistant pour Flex D
date: 2023-01-17T02:12:08.942Z
lastmod: 2025-01-08T16:51:07.251Z
---

## Blueprint Home-Assistant

Un blueprint Home-Assistant qui relie les événements de pointe critique de votre calendrier Flex D (DPC) à vos propres actions de pré-chauffage et de réduction de consommation. Il peut être installé directement avec le bouton suivant:

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Fhydroqc%2Fhydroqc-ha%2Fmain%2Fblueprints%2Fflex-d-calendar.yaml)

La source du blueprint est disponible [ici](https://raw.githubusercontent.com/hydroqc/hydroqc-ha/main/blueprints/flex-d-calendar.yaml). Pour l'importer manuellement, allez dans **Paramètres** > **Automatisations et scènes** > **Blueprints** > **Importer un blueprint** et collez cette URL.

## Fonctionnement

Le blueprint est une seule automatisation avec quatre déclencheurs calendrier sur le calendrier sélectionné dans les options de l'intégration:

| Déclencheur | Se déclenche |
|---|---|
| Pré-chauffage (matin) | `preheat_offset_morning` avant un événement qui commence avant 12h00 |
| Pré-chauffage (soir) | `preheat_offset_evening` avant un événement qui commence à 12h00 ou plus tard |
| Début de pointe | `critical_peak_offset` avant le début de l'événement |
| Fin de pointe | À la fin de l'événement |

Les quatre déclencheurs ne s'exécutent que si le résumé de l'événement contient `pointe` et que sa description contient `Tarif: DPC`: les événements d'autres calendriers ou d'autres tarifs sont ignorés. Chaque action exige aussi que l'événement soit une pointe critique (`Critique: Oui` dans la description). L'intégration n'écrit que des pointes critiques dans le calendrier, donc cette condition est toujours remplie pour les événements synchronisés.

L'automatisation utilise le mode `parallel`, ce qui permet de traiter une nouvelle pointe pendant que les actions de la précédente sont encore en cours.

## Prérequis

- Intégration Hydro-Québec configurée avec le tarif **DPC (Flex D)**
- Un calendrier local dédié sélectionné dans les options de l'intégration, pour que l'intégration puisse y écrire les événements de pointe (voir [Configuration](../../../installation/hass-integration/#configuration))
- Le blueprint importé

{{% alert color="info" title="Langue du blueprint" %}}

L'interface du blueprint, ses notifications par défaut et les événements écrits dans le calendrier par l'intégration sont en français seulement. Les noms des paramètres ci-dessous sont ceux affichés dans l'interface.

{{% /alert %}}

## Paramètres

| Paramètre | Défaut | Description |
|---|---|---|
| Calendrier Hydro-Québec | – | Entité calendrier à surveiller. Sélectionnez le même calendrier que dans les options de l'intégration |
| Délai de pré-chauffage (matin) | `-02:00:00` | Temps avant une pointe du matin où démarre l'action de pré-chauffage. Format `-HH:MM:SS`, donc `-01:30:00` pour 90 minutes |
| Délai de pré-chauffage (soir) | `-02:00:00` | Idem, pour les pointes du soir |
| Délai avant début pointe critique | `-00:01:00` | Temps avant le début officiel où s'exécute l'action de début de pointe. Permet aux appareils de se stabiliser avant la pointe |
| Action de pré-chauffage (matin) | Notification persistante | Actions à exécuter avant une pointe du matin |
| Action de pré-chauffage (soir) | Notification persistante | Actions à exécuter avant une pointe du soir |
| Action début pointe critique | Notification persistante | Actions à exécuter au début de la pointe critique |
| Action fin pointe critique | Délai aléatoire, puis notification persistante | Actions à exécuter à la fin de la pointe critique |

Les délais sont calculés à partir de l'événement du calendrier: un changement annoncé par Hydro-Québec déplace donc automatiquement les actions. Les délais doivent être des valeurs négatives au format `-HH:MM:SS`.

## Événements de pointe écrits par l'intégration

Pour chaque pointe critique à venir, l'intégration crée un événement dans le calendrier configuré:

- **Résumé**: une icône suivie de `Pointe critique`
- **Endroit**: `Hydro-Québec DPC`
- **Description**:

```
Réduisez votre consommation d'électricité pendant cette période.

Début: 06:00
Fin: 10:00

--- Métadonnées ---
Ajouté le: 2026-01-15 08:12:34 EST
Tarif: DPC
Critique: Oui
ID: hydroqc_123456789_2026-01-16T06:00:00-05:00
```

Les lignes de métadonnées `Tarif` et `Critique` sont celles utilisées par les filtres du blueprint. Les pointes régulières ne sont pas ajoutées au calendrier, et les événements créés manuellement avec le service `hydroqc.create_peak_event` utilisent le même format.

## Recommandations

- Regroupez vos actions dans `parallel:` plutôt que dans une séquence simple: une action en échec n'empêche alors pas les suivantes de s'exécuter:

    ```yaml
    parallel:
      - action: climate.set_temperature
        target:
          entity_id: climate.thermostat
        data:
          temperature: 21
      - action: light.turn_on
        target:
          entity_id: light.office
    ```

- Conservez le délai aléatoire de 30 secondes à 5 minutes dans l'action de fin, et ajoutez des délais similaires entre vos propres actions de reprise. Sans cela, des milliers d'appareils redémarrent à la même seconde et créent un nouveau pic de demande.
- Pour une logique complexe, utilisez le blueprint seulement comme déclencheur (déclencheur `calendar` ou automatisation séparée) au lieu d'y empiler plusieurs conditions. L'ensemble reste plus facile à maintenir et à déboguer.
- L'action de fin par défaut ne fait qu'envoyer une notification. Ajoutez-y vos vraies actions avant de vous y fier.

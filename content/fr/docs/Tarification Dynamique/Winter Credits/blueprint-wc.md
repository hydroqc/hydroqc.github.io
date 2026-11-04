---
title: Blueprint Crédits Hivernaux
linkTitle: Blueprint Crédits Hivernaux
weight: 45
description: |
  Blueprint Home-Assistant pour Crédits Hivernaux
date: 2023-01-17T02:12:08.942Z
lastmod: 2025-12-18T00:00:00.000Z
---

## Blueprint Home-Assistant

Un blueprint Home-Assistant qui gère l'horaire des Crédits Hivernaux (DCPC): ancrages et pointes à heures fixes, pré-chauffage piloté par le calendrier pour les pointes critiques, et un jeu d'actions distinct pour les pointes régulières. Il peut être installé directement avec le bouton suivant:

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Fhydroqc%2Fhydroqc-ha%2Fmain%2Fblueprints%2Fwinter-credits-calendar.yaml)

La source du blueprint est disponible [ici](https://raw.githubusercontent.com/hydroqc/hydroqc-ha/main/blueprints/winter-credits-calendar.yaml). Pour l'importer manuellement, allez dans **Paramètres** > **Automatisations et scènes** > **Blueprints** > **Importer un blueprint** et collez cette URL.

## Fonctionnement

Le blueprint est une seule automatisation en mode `parallel` (avec `max_exceeded: silent`) qui combine deux types de déclencheurs:

| Déclencheur | Se déclenche |
|---|---|
| Pré-chauffage (matin) | `preheat_offset_morning` avant le début d'un événement du calendrier |
| Pré-chauffage (soir) | `preheat_offset_evening` avant le début d'un événement du calendrier |
| Début ancrage matin | 01h00 |
| Fin ancrage matin | 04h00 |
| Début pointe matin | 06h00 |
| Fin pointe matin | 10h00 |
| Début ancrage soir | 12h00 |
| Fin ancrage soir | 14h00 |
| Début pointe soir | 16h00 |
| Fin pointe soir | 20h00 |

Deux conditions globales s'appliquent à tous les déclencheurs:

- le mois courant doit être décembre, ou de janvier à mars: l'automatisation ne s'exécute jamais en dehors de la saison des crédits hivernaux
- les déclencheurs calendrier exigent un événement dont le résumé contient `pointe` et dont la description contient `Tarif: DCPC`

### Pointe critique ou régulière?

À chaque exécution, le blueprint lit les événements du jour avec `calendar.get_events` et détermine si une pointe critique existe:

```yaml
- action: calendar.get_events
  target:
    entity_id: !input hydroqc_calendar
  data:
    start_date_time: "{{ now().replace(hour=0, minute=0, second=0, microsecond=0).isoformat() }}"
    end_date_time: "{{ now().replace(hour=23, minute=59, second=59, microsecond=0).isoformat() }}"
  response_variable: calendar_events
```

Une pointe du matin est critique lorsqu'un événement du jour a un résumé `pointe`, `Tarif: DCPC` dans sa description et une heure de début à 06h00. La pointe du soir est détectée de la même façon à 16h00. C'est ce qui permet à l'automatisation de fonctionner avec les seuls déclencheurs à heures fixes: à 01h00, 04h00, 06h00, 10h00, 12h00, 14h00, 16h00 et 20h00, elle relit le calendrier au lieu de dépendre d'un helper.

Chaque branche d'ancrage et de pointe choisit ensuite les actions critiques si une pointe critique existe ce jour-là, et les actions régulières sinon. Le pré-chauffage est déclenché uniquement par les déclencheurs calendrier: il ne s'exécute jamais pour une pointe régulière.

### Délais de pré-chauffage

Les deux déclencheurs calendrier visent le même événement et sont distingués par l'heure de début: avant 12h00, l'action de pré-chauffage du matin s'exécute; à 12h00 ou plus tard, celle du soir. Les deux délais valent `-01:45:00` par défaut.

Les actions de fin d'ancrage se déclenchent à 04h00 et 14h00. Si vous réglez un délai de pré-chauffage à `-02:00:00` ou plus (par exemple `-02:30:00`), le pré-chauffage commence avant ou en même temps que la fin d'ancrage: prévoyez les deux actions en conséquence.

## Prérequis

### 1. Créer un calendrier local

{{% alert color="warning" title="Important" %}}

Vous devez créer un calendrier local dans Home Assistant **avant** de configurer l'intégration HydroQC.

{{% /alert %}}

1. Allez dans **Paramètres** > **Appareils et services** > **Intégrations**
2. Cliquez sur **Ajouter une intégration**
3. Recherchez **« Calendrier local »** (Local Calendar)
4. Créez un nouveau calendrier avec un nom comme « Pointes HydroQC » ou « Crédits hivernaux »
5. Notez le `entity_id` du calendrier (ex: `calendar.pointes_hydroqc`)

Utilisez un calendrier dédié uniquement aux événements de pointe HydroQC pour éviter les conflits avec vos événements personnels.

### 2. Configurer l'intégration HydroQC

Lors de la configuration de l'intégration Hydro-Québec, sélectionnez l'entité calendrier que vous venez de créer. L'intégration synchronise automatiquement les événements de pointe critique vers ce calendrier. Pour les tarifs DPC (Flex D) et DCPC (Crédits hivernaux), le calendrier est requis.

{{% alert color="info" title="Langue du blueprint" %}}

L'interface du blueprint, ses notifications et les événements écrits dans le calendrier par l'intégration sont en français seulement. Les noms des paramètres ci-dessous sont ceux affichés dans l'interface.

{{% /alert %}}

## Paramètres

| Paramètre | Défaut | Description |
|---|---|---|
| Calendrier Hydro-Québec | – | Entité calendrier à surveiller. Sélectionnez le même calendrier que dans les options de l'intégration |
| Délai de pré-chauffage (matin) | `-01:45:00` | Temps avant une pointe critique du matin où démarre le pré-chauffage. Format `-HH:MM:SS` |
| Délai de pré-chauffage (soir) | `-01:45:00` | Idem, pour les pointes critiques du soir |
| [Critique] Action pré-chauffage (matin) | Notification persistante | Actions à exécuter avant une pointe critique du matin |
| [Critique] Action pré-chauffage (soir) | Notification persistante | Actions à exécuter avant une pointe critique du soir |
| [Critique] Action début pointe | Notification persistante | Actions à exécuter à 06h00 et 16h00 un jour de pointe critique |
| [Critique] Action fin pointe | Délai aléatoire, puis notification persistante | Actions à exécuter à 10h00 et 20h00 un jour de pointe critique |

Les actions critiques sont activées par défaut, y compris leurs notifications. Deux sections repliées optionnelles contiennent le reste:

| Section | Paramètres | Défaut |
|---|---|---|
| Actions pointes régulières | [Régulière] Début pointe, [Régulière] Fin pointe | Désactivées (`enabled: false`) |
| Actions d'ancrage (optionnel) | Début et fin d'ancrage critiques et réguliers, matin et soir | Désactivées (`enabled: false`) |

Pour utiliser une action désactivée, retirez la ligne `enabled: false` de sa séquence ou remplacez la séquence au complet.

## Événements de pointe écrits par l'intégration

Pour chaque pointe critique à venir, l'intégration crée un événement dans le calendrier configuré:

- **Résumé**: une icône suivie de `Pointe critique`
- **Endroit**: `Hydro-Québec DCPC`
- **Description**:

```
Réduisez votre consommation d'électricité pendant cette période.

Début: 06:00
Fin: 10:00

--- Métadonnées ---
Ajouté le: 2026-01-15 08:12:34 EST
Tarif: DCPC
Critique: Oui
ID: hydroqc_123456789_2026-01-16T06:00:00-05:00
```

La ligne de métadonnées `Tarif` est celle utilisée par les filtres du blueprint, et l'heure de début (06h00 ou 16h00) est ce qui marque la journée comme jour de pointe critique. Les pointes régulières ne sont pas ajoutées au calendrier, et les événements créés manuellement avec le service `hydroqc.create_peak_event` utilisent le même format.

## Recommandations

- Regroupez vos actions dans `parallel:` plutôt que dans une séquence simple: une action en échec n'empêche alors pas les suivantes de s'exécuter.
- Conservez le délai aléatoire de 30 secondes à 5 minutes dans l'action de fin, et ajoutez des délais similaires entre vos propres actions de reprise. Sans cela, des milliers d'appareils redémarrent à la même seconde et créent un nouveau pic de demande.
- Activez les actions d'ancrage seulement si vous voulez agir sur les périodes de consommation de référence. Elles sont optionnelles et désactivées par défaut.
- Pour une logique complexe, utilisez le blueprint seulement comme déclencheur (déclencheur `time` ou automatisation séparée) au lieu d'y empiler plusieurs conditions. L'ensemble reste plus facile à maintenir et à déboguer.

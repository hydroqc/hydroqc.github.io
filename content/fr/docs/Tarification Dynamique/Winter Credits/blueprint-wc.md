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

Un Blueprint Home-Assistant avec les options pour réaliser les automatismes décrits dans cette section est disponible [ici](https://raw.githubusercontent.com/hydroqc/hydroqc-ha/main/blueprints/winter-credits-calendar.yaml) et peut être installé directement avec le bouton suivant:

[![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Fhydroqc%2Fhydroqc-ha%2Fmain%2Fblueprints%2Fwinter-credits-calendar.yaml)

## Architecture du Blueprint

Le blueprint Crédits Hivernaux utilise une approche hybride combinant déclencheurs à heures fixes et déclencheurs calendrier:

### Déclencheurs à Heures Fixes

**Horaire quotidien hivernal** (1er décembre - 31 mars):
- **01h00** : Début de l'ancrage du matin
- **04h00** : Fin de l'ancrage du matin
- **06h00** : Début de la pointe du matin
- **10h00** : Fin de la pointe du matin
- **12h00** : Début de l'ancrage du soir
- **14h00** : Fin de l'ancrage du soir
- **16h00** : Début de la pointe du soir
- **20h00** : Fin de la pointe du soir

Ces déclencheurs à heures fixes assurent que vos automatisations se déclenchent à chaque période d'ancrage et de pointe, qu'elles soient critiques ou régulières.

### Déclencheurs Calendrier

Le blueprint requiert une **entité calendrier locale** créée dans Home Assistant. L'intégration HydroQC synchronise automatiquement les événements de pointe critique annoncés par Hydro-Québec vers ce calendrier.

**Important** : Vous devez créer votre propre calendrier local dans Home Assistant (Paramètres → Appareils & Services → Calendriers locaux → Ajouter un calendrier). L'intégration ne crée pas de calendrier automatiquement, elle ajoute des événements à un calendrier existant que vous spécifiez dans la configuration.

**Recommandation** : Utilisez un calendrier dédié uniquement aux événements de pointe pour éviter les conflits avec d'autres événements.

Le blueprint utilise également des déclencheurs calendrier avec offset pour le pré-chauffage avant les pointes critiques.

### Détection Automatique de Criticité

À **chaque exécution**, le blueprint appelle le service `calendar.get_events` pour récupérer les événements de la journée et déterminer automatiquement si les pointes sont critiques ou régulières:

```yaml
- action: calendar.get_events
  data:
    start_date_time: "{{ now().replace(hour=0, minute=0, second=0).isoformat() }}"
    end_date_time: "{{ now().replace(hour=23, minute=59, second=59).isoformat() }}"
  response_variable: calendar_events
```

Cette approche assure que le blueprint:
- Détecte de manière fiable les pointes critiques vs régulières
- Fonctionne avec les déclencheurs à heures fixes ET calendrier
- Ne nécessite pas de helpers input_boolean supplémentaires
- Récupère les données du calendrier au moment de l'exécution

## Prérequis

### 1. Créer un Calendrier Local

{{% alert color="warning" title="Important" %}}
Vous devez créer un calendrier local dans Home Assistant **avant** de configurer l'intégration HydroQC.
{{% /alert %}}

**Étapes pour créer un calendrier local** :

1. Allez dans **Paramètres** → **Appareils & Services** → **Intégrations**
2. Cliquez sur **Ajouter une intégration**
3. Recherchez **"Calendrier local"** (Local Calendar)
4. Créez un nouveau calendrier avec un nom comme "Pointes HydroQC" ou "Winter Credits"
5. Notez le `entity_id` du calendrier (ex: `calendar.pointes_hydroqc`)

**Recommandation** : Utilisez un calendrier dédié uniquement aux événements de pointe HydroQC pour éviter les conflits avec d'autres événements personnels.

### 2. Configurer l'Intégration HydroQC

Lors de la configuration de l'intégration Hydro-Québec, sélectionnez l'entité calendrier que vous venez de créer. L'intégration synchronise automatiquement les événements de pointe critique vers ce calendrier. Pour les tarifs DPC (Flex D) et DCPC (Crédits hivernaux), le calendrier est requis.

## Actions Configurables

Le blueprint fournit des actions séparées pour :

### Pointes Critiques
- **Pré-chauffage** (activé par défaut)
- **Début ancrage** (désactivé par défaut) 
- **Fin ancrage** (désactivé par défaut)
- **Début pointe** (activé par défaut)
- **Fin pointe** (activé par défaut)

### Pointes Régulières (Non-Critiques)
- **Début ancrage** (désactivé par défaut)
- **Fin ancrage** (désactivé par défaut) 
- **Début pointe** (désactivé par défaut)
- **Fin pointe** (désactivé par défaut)

Tous les actions incluent des **notifications persistantes désactivées par défaut** que vous pouvez activer au besoin.

---
title: Intégration personnalisée Home Assistant
linkTitle: Intégration Home Assistant
weight: 12
description: |
  Installer l'intégration personnalisée hydroqc-ha pour Home Assistant (Recommandé)
aliases:
  - /docs/configuration/
  - /docs/configuration/addon-advanced/
  - /docs/configuration/config-file/
  - /docs/configuration/environment/
  - /docs/installation/hass-addon/
date: 2025-12-02T00:00:00.000Z
lastmod: 2026-11-03T00:00:00.000Z
---

{{% alert color="success" title="Recommandé pour les utilisateurs de Home Assistant" %}}

L'intégration personnalisée **hydroqc-ha** est la méthode recommandée pour intégrer Hydro-Québec avec Home Assistant. Elle fournit une intégration native directement dans Home Assistant.

{{% /alert %}}

## Pourquoi choisir hydroqc-ha?

- **Intégration native**: Fonctionne comme un composant personnalisé de Home Assistant
- **Configuration facile**: Configuration entièrement via l'interface de Home Assistant
- **Support complet des fonctionnalités**: Consommation, facturation, crédits hivernaux et tarification dynamique
- **Multi-contrats**: Un appareil par contrat Hydro-Québec
- **Entités de diagnostic**: Entités optionnelles pour le dépannage et les automatisations avancées

## Installation

### Via HACS (Recommandé)

#### Prérequis

Assurez-vous que [HACS](https://hacs.xyz/) est installé dans votre instance Home Assistant. Si ce n'est pas déjà fait:

1. Suivez le [guide d'installation HACS](https://hacs.xyz/docs/setup/download)
2. Redémarrez Home Assistant après l'installation de HACS

#### Installation de l'intégration

**Option A: Installation en un clic**

[![Ouvrir votre instance Home Assistant et ouvrir le dépôt dans HACS.](https://my.home-assistant.io/badges/hacs_repository.svg)](https://my.home-assistant.io/redirect/hacs_repository/?owner=hydroqc&repository=hydroqc-ha&category=integration)

Cliquez sur le badge ci-dessus pour ajouter le dépôt à HACS, puis:

1. Cliquez sur **"Télécharger"** (ou **"Installer"**)
2. **Redémarrez Home Assistant**

**Option B: Installation manuelle via HACS**

1. Ouvrez **HACS** dans Home Assistant
2. Cliquez sur **Intégrations**
3. Cliquez sur le menu **trois points** dans le coin supérieur droit
4. Sélectionnez **"Dépôts personnalisés"**
5. Ajoutez l'URL du dépôt: `https://github.com/hydroqc/hydroqc-ha`
6. Sélectionnez la catégorie: **Intégration**
7. Cliquez sur **"Ajouter"**
8. Recherchez **"Hydro-Québec"** dans la liste des intégrations HACS
9. Cliquez sur l'intégration **Hydro-Québec**
10. Cliquez sur **"Télécharger"** (ou **"Installer"**)
11. **Redémarrez Home Assistant**

> **Note**: après le redémarrage, vous devrez encore configurer l'intégration (voir la section Configuration ci-dessous).

### Installation manuelle

1. Téléchargez la dernière version depuis [GitHub Releases](https://github.com/hydroqc/hydroqc-ha/releases)
2. Extrayez le dossier `hydroqc` dans votre répertoire `custom_components`
3. Redémarrez Home Assistant

## Configuration

La première étape demande le mode de connexion: **Portal Mode (requires login)** pour un compte Hydro-Québec, ou **OpenData Mode (no login required)** pour les données publiques de pointe sans identifiants.

### Option 1: Mode Portail (compte Hydro-Québec)

1. Allez dans **Paramètres** > **Appareils et services**
2. Cliquez sur **+ Ajouter une intégration**
3. Recherchez **Hydro-Québec**
4. Sélectionnez **Portal Mode (requires login)**
5. Entrez vos identifiants:
   - **Nom d'utilisateur**: votre courriel Hydro-Québec
   - **Mot de passe**: votre mot de passe Hydro-Québec
   - **Nom du contrat**: un nom convivial (ex: "Maison", "Chalet")
6. Sélectionnez le contrat à surveiller
7. Choisissez le nombre de jours d'historique de consommation à importer (0-800). Mettez `0` pour ne synchroniser que les 30 derniers jours
8. Activez ou désactivez la synchronisation de consommation
9. Pour les tarifs DPC (Flex D) et DCPC (Crédits hivernaux), sélectionnez un calendrier dédié
10. Terminé! Les entités apparaîtront sous peu

**Fonctionnalités avec un compte:**

- Données de consommation actuelle et historique
- Informations de solde et de facturation
- Tarif actuel et option tarifaire
- Crédits hivernaux et événements de pointe
- Informations sur les pannes
- Statistiques du tableau de bord énergétique

{{% alert color="info" title="Synchronisation de consommation" %}}

La synchronisation de consommation importe la consommation horaire sous forme de statistiques à long terme pour le tableau de bord énergétique de Home Assistant. Vous pouvez la désactiver si vous n'avez pas besoin du suivi de consommation historique ou pour réduire les appels API. Ce paramètre peut être modifié dans les options de l'intégration.

{{% /alert %}}

### Option 2: Mode OpenData (aucun compte requis)

Pour les utilisateurs qui souhaitent uniquement les informations sur les périodes de pointe sans se connecter:

1. Allez dans **Paramètres** > **Appareils et services**
2. Cliquez sur **+ Ajouter une intégration**
3. Recherchez **Hydro-Québec**
4. Sélectionnez **OpenData Mode (no login required)**
5. Choisissez votre secteur de clientèle (résidentiel ou commercial)
6. Sélectionnez votre plan tarifaire (les plans disponibles sont récupérés depuis l'API publique d'Hydro-Québec)
7. Entrez un nom de contrat et une durée de préchauffage (0-240 minutes)
8. Pour les tarifs DPC (Flex D) et DCPC (Crédits hivernaux), sélectionnez un calendrier dédié
9. Terminé! Les entités apparaîtront sous peu

**Fonctionnalités sans compte:**

- Informations sur les événements de pointe
- Informations sur la tarification dynamique
- Pas de suivi de consommation
- Pas d'informations de facturation

{{% alert color="info" title="Durée de préchauffage" %}}

La durée de préchauffage peut être configurée lors de la configuration et modifiée plus tard dans les options de l'intégration. Elle détermine combien de temps à l'avance la période de préchauffage commence avant un événement de pointe (par défaut: 120 minutes, plage: 0-240 minutes).

{{% /alert %}}

### Configuration multi-contrats

Pour surveiller plusieurs contrats (ex: maison et chalet):

1. Ajoutez l'intégration plusieurs fois
2. Utilisez un nom de contrat différent pour chacun
3. Sélectionnez un contrat différent lors de chaque configuration

### Changer de contrat ou de mot de passe

Hydro-Québec attribue un nouveau numéro de contrat chaque fois que le responsable d'un lieu de consommation change, même si ce lieu est déjà associé au compte. Pas besoin de supprimer l'intégration pour mettre à jour:

1. Allez dans **Paramètres** > **Appareils et services** > **Hydro-Québec**
2. Ouvrez le menu **trois points** de l'entrée et sélectionnez **Reconfigurer**
3. Confirmez votre courriel. Laissez le mot de passe vide pour garder l'actuel, ou entrez le nouveau
4. Sélectionnez le contrat

Les entités conservent leur `entity_id` et l'historique de consommation est préservé.

## Options de l'intégration

Ouvrez **Paramètres** > **Appareils et services** > **Hydro-Québec** > **Configurer** pour modifier:

- **Durée de préchauffage**: combien de temps avant un événement de pointe la période de préchauffage commence (0-240 minutes, par défaut: 120)
- **Activer la synchronisation de consommation**: importe la consommation horaire pour le tableau de bord énergétique. Nécessite un rechargement de l'intégration
- **Entité calendrier**: le calendrier utilisé pour les événements de pointe. Requis pour les tarifs DPC/DCPC et validé lors de l'enregistrement

## Services

| Service | Description | Champs |
|-|-|-|
| `hydroqc.refresh_data` | Rafraîchir manuellement les données depuis l'API Hydro-Québec | Cible: une entité Hydro-Québec |
| `hydroqc.sync_consumption_history` | Importer l'historique de consommation horaire (s'exécute en arrière-plan) | `days_back` (1-2000, par défaut: 731) |
| `hydroqc.create_peak_event` | Créer manuellement un événement de pointe critique dans le calendrier configuré | `device_id`, `date` (AAAA-MM-JJ), `time_slot` (`AM` = 6h-10h, `PM` = 16h-20h) |

`hydroqc.sync_consumption_history` nécessite le Mode Portail et la synchronisation de consommation activée. Un événement de pointe créé manuellement est automatiquement jumelé si Hydro-Québec annonce plus tard le même événement.

## Entités

L'intégration crée les entités suivantes pour chaque contrat:

- **Compte et facturation**: Solde, Total facture à ce jour, Facture projetée, Moyenne quotidienne facture, Moyenne quotidienne conso, Conso. totale, Conso. totale projetée, Température moyenne, Coût moyen kWh, Jour période facturation, Durée période facturation, Tarif actuel, Option tarifaire
- **Bi-énergie**: Conso. prix supérieur, Conso. prix inférieur, Différence Flex D vs Tarif D (DT et DPC)
- **Événements de pointe**: État DPC et horodatages des prochaines pointes (DPC), État Crédit Hivernal, crédits hivernaux totaux et horodatages des prochaines pointes (DCPC)
- **Résultats des crédits hivernaux**: crédit, consommation, consommation de référence et consommation économisée d'hier matin et d'hier soir (DCPC)
- **Panne**: État panne, avec la cause, la durée et le statut en attributs
- **Capteurs binaires**: MVE actif, Statut du portail, et indicateurs de pointe et de préchauffage pour DPC et DCPC
- **Bouton**: Refresh Peak Data (DPC et DCPC uniquement)

Certaines entités de diagnostic sont désactivées par défaut (Statut du portail, MVE actif, Début prochain préchauffage DPC et Préchauffage actif des crédits hivernaux). Activez-les dans les paramètres de l'entité si nécessaire.

Consultez la référence des [capteurs](../../reference/sensors/) pour la liste complète, ainsi que les pages [Flex D](../../tarification-dynamique/flex-d/flexd-sensors/) et [Crédits hivernaux](../../tarification-dynamique/winter-credits/wc-sensors/) pour les entités propres à chaque tarif.

{{% alert color="info" title="Calendrier local requis" %}}

Pour les tarifs DPC (Flex-D) et DCPC (Crédits hivernaux), vous devez créer un calendrier local dédié dans Home Assistant avant de configurer l'intégration. Tous les capteurs de pointe (état, heures des prochaines pointes et préchauffage) lisent leurs données depuis les événements du calendrier. N'utilisez pas un calendrier partagé.

{{% /alert %}}

## Dépannage

Consultez la page [Dépannage](../../troubleshooting/) pour les problèmes de connexion, les données manquantes et la journalisation en mode débogage.

## Soutien

- **Problèmes**: [GitHub Issues](https://github.com/hydroqc/hydroqc-ha/issues)
- **Documentation**: [hydroqc.ca](https://hydroqc.ca)
- **Code source**: [Dépôt GitHub](https://github.com/hydroqc/hydroqc-ha)
- **Discord**: [Rejoindre notre Discord](https://discord.gg/JaRfRJEByz)

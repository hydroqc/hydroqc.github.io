---
title: Intégration personnalisée Home Assistant
linkTitle: Intégration Home Assistant
weight: 12
description: |
  Installer l'intégration personnalisée hydroqc-ha pour Home Assistant (Recommandé)
date: 2025-12-02T00:00:00.000Z
lastmod: 2025-12-02T00:00:00.000Z
---

{{% alert color="success" title="Recommandé pour les utilisateurs de Home Assistant" %}}
L'intégration personnalisée **hydroqc-ha** est la méthode recommandée pour intégrer Hydro-Québec avec Home Assistant. Elle fournit une intégration native sans nécessiter MQTT ou de démons externes.
{{% /alert %}}

## Pourquoi choisir hydroqc-ha?

- **Intégration native**: Intégrée directement dans Home Assistant comme composant personnalisé
- **Aucun MQTT requis**: Intégration directe sans besoin d'un courtier MQTT
- **Configuration facile**: Configuration simple via l'interface utilisateur de Home Assistant
- **Support complet des fonctionnalités**: Toutes les fonctionnalités incluant le suivi de consommation, crédits hivernaux et tarification dynamique
- **Meilleure performance**: Plus efficace et fiable que l'addon hérité
- **Multi-contrats**: Support pour plusieurs contrats Hydro-Québec

## Installation

### Via HACS (Recommandé)

#### Prérequis

Assurez-vous que [HACS](https://hacs.xyz/) est installé dans votre instance Home Assistant. Si ce n'est pas déjà fait :

1. Suivez le [guide d'installation HACS](https://hacs.xyz/docs/setup/download)
2. Redémarrez Home Assistant après l'installation de HACS

#### Installation de l'intégration

**Option A : Installation en un clic**

[![Ouvrir votre instance Home Assistant et ouvrir le dépôt dans HACS.](https://my.home-assistant.io/badges/hacs_repository.svg)](https://my.home-assistant.io/redirect/hacs_repository/?owner=hydroqc&repository=hydroqc-ha&category=integration)

Cliquez sur le badge ci-dessus pour ajouter automatiquement ce dépôt à HACS, puis :

1. Cliquez sur **"Télécharger"** (ou **"Installer"**)
2. **Redémarrez Home Assistant**

**Option B : Installation manuelle via HACS**

1. Ouvrez **HACS** dans Home Assistant
2. Cliquez sur **Intégrations**
3. Cliquez sur les **3 points** dans le coin supérieur droit
4. Sélectionnez **"Dépôts personnalisés"**
5. Ajoutez l'URL du dépôt : `https://github.com/hydroqc/hydroqc-ha`
6. Sélectionnez la catégorie : **Intégration**
7. Cliquez sur **"Ajouter"**
8. Recherchez **"Hydro-Québec"** dans la liste des intégrations HACS
9. Cliquez sur l'intégration **Hydro-Québec**
10. Cliquez sur **"Télécharger"** (ou **"Installer"**)
11. **Redémarrez Home Assistant**

> **Note** : Après le redémarrage, vous devrez encore configurer l'intégration (voir section Configuration ci-dessous).

### Installation manuelle

1. Téléchargez la dernière version depuis [GitHub Releases](https://github.com/hydroqc/hydroqc-ha/releases)
2. Extrayez le dossier `hydroqc` dans votre répertoire `custom_components`
3. Redémarrez Home Assistant

## Configuration

### Option 1 : Avec compte Hydro-Québec (Accès complet)

1. Allez dans **Paramètres** → **Appareils et services**
2. Cliquez sur **+ Ajouter une intégration**
3. Recherchez **Hydro-Québec**
4. Sélectionnez **"Se connecter avec un compte Hydro-Québec"**
5. Entrez vos identifiants :
   - **Nom d'utilisateur** : Votre courriel Hydro-Québec
   - **Mot de passe** : Votre mot de passe Hydro-Québec
   - **Nom du contrat** : Nom convivial (ex: "Maison", "Chalet")
6. Sélectionnez le contrat à surveiller dans la liste
7. Terminé ! Les capteurs apparaîtront dans ~60 secondes

**Fonctionnalités avec compte:**
- Données de consommation actuelles et historiques
- Informations de solde et de facturation
- Crédits hivernaux et événements de pointe
- Notifications de pannes
- Intégration au tableau de bord énergétique

### Option 2 : Données de pointe uniquement (Aucun compte requis)

Pour les utilisateurs qui souhaitent uniquement les informations sur les périodes de pointe sans se connecter :

1. Allez dans **Paramètres** → **Appareils et services**
2. Cliquez sur **+ Ajouter une intégration**
3. Recherchez **Hydro-Québec**
4. Sélectionnez **"Données de pointe uniquement (aucun compte)"**
5. Choisissez votre secteur tarifaire et votre plan
6. Configurez la durée de préchauffage pour les événements de pointe

**Fonctionnalités sans compte:**
- Notifications d'événements de pointe
- Informations sur la tarification dynamique
- Pas de suivi de consommation
- Pas d'informations de facturation

### Configuration multi-contrats

Pour surveiller plusieurs contrats (ex: maison et chalet):

1. Ajoutez l'intégration plusieurs fois
2. Utilisez des noms de contrat différents pour chacun
3. Sélectionnez un contrat différent lors de chaque configuration

## Capteurs disponibles

L'intégration crée des capteurs pour:

- **Consommation**: Période actuelle, hier, aujourd'hui
- **Facturation**: Solde, montant projeté
- **Événements de pointe**: Statut actuel, prochain événement
- **Crédits hivernaux**: Événements et projections
- **Pannes**: Pannes actuelles dans votre région

Consultez la section [Capteurs Home Assistant](../../home-assistant/) pour des informations détaillées sur les capteurs.

## Dépannage

### Échec de connexion
- Vérifiez vos identifiants sur le [site web d'Hydro-Québec](https://session.hydroquebec.com/)
- Vérifiez les caractères spéciaux dans le mot de passe
- Assurez-vous que le compte a des contrats actifs

### Aucune donnée n'apparaît
- Attendez 60 secondes pour la première mise à jour
- Vérifiez les journaux de Home Assistant : Paramètres → Système → Journaux
- Vérifiez que le portail Hydro-Québec est en ligne

### Capteurs indisponibles
- Certains capteurs ne sont actifs que pendant des saisons spécifiques (crédits hivernaux)
- Vérifiez si votre plan tarifaire supporte le capteur
- Vérifiez que le coordinateur se met à jour (consultez les journaux)

## Migration depuis l'addon hérité

Si vous utilisez actuellement l'addon hérité:

1. Installez hydroqc-ha en parallèle de l'addon (les deux peuvent fonctionner simultanément)
2. Testez la nouvelle intégration de manière approfondie
3. Mettez à jour vos automatisations et tableaux de bord pour utiliser les nouveaux capteurs
4. Une fois satisfait, désactivez l'addon hérité
5. Optionnellement, désinstallez l'addon et le courtier MQTT si vous n'en avez plus besoin

## Projets connexes

- **hydroqc2mqtt** : Pour les plateformes autres que Home Assistant (démon MQTT)
- **Hydro-Quebec-API-Wrapper** : La bibliothèque Python sous-jacente

## Support

- **Problèmes** : [GitHub Issues](https://github.com/hydroqc/hydroqc-ha/issues)
- **Documentation** : [hydroqc.ca](https://hydroqc.ca)
- **Code source** : [Dépôt GitHub](https://github.com/hydroqc/hydroqc-ha)
- **Discord** : [Rejoignez notre Discord](https://discord.gg/BTPDntfaXH)

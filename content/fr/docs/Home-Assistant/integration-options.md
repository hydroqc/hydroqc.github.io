---
title: Options de l'intégration
linkTitle: Options de l'intégration
weight: 21
description: |
  Options disponibles pour l'intégration Hydro-Québec
date: 2026-11-04T00:00:00.000Z
lastmod: 2026-11-11T00:00:00.000Z
---

Ouvrez **Paramètres** > **Appareils et services** > **Hydro-Québec** > **Configurer** pour modifier:

- **Durée de préchauffage**: combien de temps avant un événement de pointe la période de préchauffage commence (0-240 minutes, par défaut: 120)
- **Activer la synchronisation de consommation**: importe la consommation horaire pour le tableau de bord énergétique. Nécessite un rechargement de l'intégration
- **Entité calendrier**: le calendrier utilisé pour les événements de pointe. Requis pour les tarifs DPC/DCPC et validé lors de l'enregistrement

Le formulaire d'options contient aussi une section repliable **Avancé** :

- **Client de connexion**: la façon dont l'intégration se connecte à Hydro-Québec.
  - **Application mobile** (par défaut): utilise les points de terminaison d'authentification de l'application mobile officielle d'Hydro-Québec. La session est renouvelée automatiquement et dure environ 90 jours : le code de vérification par courriel n'est donc demandé qu'une fois, puis lorsque la session expire.
  - **Portail web**: conserve la session environ 24 heures et exige un nouveau code de vérification par courriel chaque jour.

Changer de client de connexion recharge l'intégration et demande un nouveau code de vérification par courriel. Si le client mobile cesse de fonctionner, choisissez le portail web.

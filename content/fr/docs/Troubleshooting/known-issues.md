---
title: Problèmes connus
linkTitle: Problèmes connus
weight: 52
description: |
  Problèmes dont nous sommes conscients et leurs solutions de contournement.
date: 2022-09-21T18:41:22.563Z
lastmod: 2026-11-11T00:00:00.000Z
---

## Vérification par courriel (MFA) et durée de la session

Depuis le 5 novembre 2026, le portail client d'Hydro-Québec demande un code de vérification envoyé par courriel pour chaque nouvelle session.

**Résolu depuis la version 0.9.1.** L'intégration se connecte maintenant au moyen des points de terminaison d'authentification de l'**application mobile** d'Hydro-Québec. Ce client renouvelle la session automatiquement et la conserve environ **90 jours** : le code de vérification par courriel n'est donc demandé qu'à la première configuration et lorsque la session expire.

L'intégration affiche l'étape **Vérification par courriel** pendant la configuration initiale, la reconfiguration et la réauthentification. Entrez le code reçu; un champ vide demande un nouveau code.

Le client de connexion se change dans **Paramètres** → **Appareils et services** → **Hydro-Québec** → **Configurer** → **Avancé** → **Client de connexion** :

| Client | Durée de la session | Code de vérification |
| --- | --- | --- |
| **Application mobile** (par défaut) | 90 jours, renouvelée à chaque connexion | Une seule fois, puis seulement si la session expire |
| **Portail web** | 24 heures | Chaque jour |

Changer de client recharge l'intégration et demande un nouveau code : la session d'un client ne sert pas à l'autre. Si le client mobile cesse de fonctionner, choisissez le portail web.

Après l'expiration de la session, Home Assistant affiche **Réauthentification requise** dans **Paramètres** → **Appareils et services** : cliquez sur **Réauthentifier** et saisissez le nouveau code. Les connexions automatiques ne demandent jamais de code : elles s'arrêtent à l'étape de vérification et attendent une réauthentification. Voir [Vérification par courriel](../../installation/hass-integration/#vérification-par-courriel-mfa).

## La consommation ne se synchronise pas

### Problème occasionnel

Lors du début ou de la fin de la période de facturation, la consommation n'est pas disponible dans le portail, HydroQC n'est donc pas en mesure de la récupérer. Patientez deux ou trois jours après le début de votre période de facturation et la consommation devrait recommencer à se synchroniser d'elle-même.

### L'historique à long terme ne se synchronise pas

Quand l'intégration est en marche depuis un certain temps, la fonctionnalité d'import de l'historique de consommation peut devenir non-fonctionnelle. Si vous prévoyez faire une importation de vos données historiques à long terme, effectuez un redémarrage de Home Assistant avant.

## Erreurs dans les journaux de temps à autre

Hydro-Québec fait souvent des maintenances sur ses systèmes qui se traduisent par des erreurs dans les clients HydroQC. Si votre installation est généralement fonctionnelle, mais que vous voyez des erreurs dans les journaux de temps en temps, il n'est pas nécessaire de s'inquiéter.

## `binascii.Error: Incorrect padding` error

Nous avons eu un signalement de ce problème. Le problème provient du portail client Hydro-Québec qui renvoie un JSON malformé lorsque le nom de la personne contient des caractères spéciaux (par exemple Benoît). La solution consiste à modifier le nom dans le portail client.

- Connectez-vous à votre portail client Hydro-Québec

- Déplacez votre curseur sur votre nom en haut à droite

- Cliquez sur "Informations de connexion" (Données d'identification)

- Changez votre nom complet pour supprimer tous les caractères accentués

Essayez à nouveau.

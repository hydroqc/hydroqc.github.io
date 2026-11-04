---
title: Problèmes connus
linkTitle: Problèmes connus
weight: 52
description: |
  Problèmes dont nous sommes conscients et leurs solutions de contournement.
date: 2022-09-21T18:41:22.563Z
lastmod: 2026-11-03T00:00:00.000Z
---

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

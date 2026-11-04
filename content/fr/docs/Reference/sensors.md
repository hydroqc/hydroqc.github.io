---
title: Capteurs
linkTitle: Capteurs
weight: 32
description: |
  Description des capteurs présents dans Home-Assistant
date: 2022-12-21T20:26:46.748Z
lastmod: 2025-01-08T16:51:07.251Z
---

## Survol

L'intégration définit **41 capteurs** et **18 capteurs binaires**. Seules les entités qui s'appliquent au tarif configuré sont créées pour un contrat. Les noms d'entités sont traduits par Home Assistant (anglais, français et espagnol); les noms ci-dessous sont ceux en français.

Les entités marquées **Diagnostic** apparaissent dans la section Diagnostic de l'appareil et sont exclues des tableaux de bord par défaut. Certaines entités de diagnostic sont aussi **désactivées par défaut**; activez-les dans les paramètres de l'entité si nécessaire.

## Compte

| Entité | Exemple | Description |
|-|-|-|
| Solde | 123,43 $ CA | Solde actuel du compte |

## Période de facturation en cours

| Entité | Exemple | Description |
|-|-|-|
| Jour période facturation | 19 | Numéro du jour dans la période de facturation actuelle (Diagnostic) |
| Durée période facturation | 61 | Nombre total de jours dans la période de facturation actuelle (Diagnostic) |
| Total facture à ce jour | 108,10 $ CA | Coût de votre consommation pour la période à ce jour |
| Facture projetée | 318,15 $ CA | Coût projeté de la consommation à la fin de la période de facturation |
| Moyenne quotidienne facture | 5,69 $ CA | Coût moyen par jour pour la période (Diagnostic) |
| Moyenne quotidienne conso | 60,5 kWh | Consommation moyenne par jour pour la période |
| Conso. totale | 1149 kWh | Consommation à ce jour dans la période actuelle |
| Conso. totale projetée | 3432 kWh | Consommation projetée à la fin de la période de facturation |
| Température moyenne | 15 °C | Température moyenne de la période actuelle, telle que calculée par Hydro-Québec |
| Coût moyen kWh | 0,09 $ CA/kWh | Coût moyen par kWh pour la période |
| Tarif actuel | DPC | Code du tarif actuel (D, DT, DPC, M, M-GDP) |
| Option tarifaire | — | Option tarifaire actuelle |

## Tarifs bi-énergie (DT et DPC)

| Entité | Exemple | Description |
|-|-|-|
| Conso. prix supérieur | 0 kWh | Consommation dans la tranche de prix supérieure pour la période actuelle |
| Conso. prix inférieur | 1149 kWh | Consommation dans la tranche de prix inférieure pour la période actuelle |
| Différence Flex D vs Tarif D | 50,52 $ CA | Montant économisé (positif) ou perdu (négatif) par rapport au tarif D |

## Panne

| Entité | Exemple | Description |
|-|-|-|
| État panne | 2026-01-15 08:00 | Début de la prochaine panne planifiée ou de la panne imprévue en cours (Diagnostic) |

Le capteur **État panne** expose les attributs suivants: `end_date`, `cause`, `planned_duration`, `code`, `state`, `emergency_level` et `is_planned`. Il est indisponible lorsqu'il n'y a aucune panne à venir ou en cours.

## Entités propres au tarif

Les entités d'événements de pointe et de crédits hivernaux dépendent du tarif configuré:

- [Capteurs Flex D](../../tarification-dynamique/flex-d/flexd-sensors/)
- [Capteurs crédits hivernaux](../../tarification-dynamique/winter-credits/wc-sensors/)

## Capteurs binaires

| Entité | Valeurs | Description |
|-|-|-|
| MVE actif | on / off | Le mode de versements égaux est actif pour la période actuelle (Diagnostic, désactivé par défaut) |
| Statut du portail | on / off | Disponibilité du portail Hydro-Québec (Diagnostic, désactivé par défaut) |

Les capteurs binaires de pointe et de préchauffage sont documentés sur les pages [Flex D](../../tarification-dynamique/flex-d/flexd-sensors/) et [Crédits hivernaux](../../tarification-dynamique/winter-credits/wc-sensors/).

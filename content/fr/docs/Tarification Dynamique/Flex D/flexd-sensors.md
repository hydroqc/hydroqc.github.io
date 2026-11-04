---
title: Capteurs Flex D
linkTitle: Capteurs Flex D
weight: 47
description: |
  Description des capteurs Flex D
lastmod: 2025-01-08T16:51:07.251Z
date: 2023-01-18T18:47:29.816Z
---

## Description des capteurs

Les entités suivantes sont créées pour le tarif DPC (Flex D). Les entités d'événements de pointe lisent leurs données depuis le calendrier dédié configuré dans l'intégration; consultez le [blueprint Flex D](../blueprint-flex-d/) pour les automatisations.

{{% alert color="warning" title="Avertissement" %}}

Les entités qui représentent l'état actuel (État DPC, Pointe critique active, Préchauffage actif) dépendent des événements du calendrier et de la mise à jour du coordinateur. Pour les automatisations qui doivent s'exécuter à une heure précise, privilégiez les entités d'horodatage (Début prochaine pointe, Fin prochaine pointe, Début prochain préchauffage).

{{% /alert %}}

### Capteurs

| Entité | Valeurs | Description |
|-|-|-|
| État DPC | normal / peak / critical_peak / off_season | État actuel de la période. `off_season` hors de la saison hivernale (1er décembre au 31 mars) |
| Début prochaine pointe | horodatage | Début de la prochaine période de pointe |
| Fin prochaine pointe | horodatage | Fin de la prochaine période de pointe |
| Début prochain préchauffage | horodatage | Début de la période de préchauffage avant la prochaine pointe (Diagnostic, désactivé par défaut) |
| Heures de pointe | nombre | Heures critiques appelées jusqu'à maintenant cet hiver (Diagnostic). Attribut `max`: nombre maximal d'heures critiques |
| Jours d'hiver | nombre | Jours écoulés depuis le début de la période hivernale (Diagnostic). Attribut `max`: nombre total de jours d'hiver |

Les entités de consommation bi-énergie **Conso. prix supérieur**, **Conso. prix inférieur** et **Différence Flex D vs Tarif D** sont aussi disponibles avec ce tarif; consultez la référence des [capteurs](../../../reference/sensors/).

### Capteurs binaires

| Entité | Valeurs | Description |
|-|-|-|
| Pointe critique active | on / off | Une pointe critique est en cours |
| Préchauffage actif | on / off | La période de préchauffage avant une pointe critique est en cours (Diagnostic, désactivé par défaut) |
| Pointe matin aujourd'hui | on / off | Une pointe critique est prévue ce matin (6h-10h) (Diagnostic, désactivé par défaut) |
| Pointe soir aujourd'hui | on / off | Une pointe critique est prévue ce soir (16h-20h) (Diagnostic, désactivé par défaut) |
| Pointe matin demain | on / off | Une pointe critique est prévue demain matin (6h-10h) (Diagnostic, désactivé par défaut) |
| Pointe soir demain | on / off | Une pointe critique est prévue demain soir (16h-20h) (Diagnostic, désactivé par défaut) |

## Pages connexes

- [Conditions Flex D](../terms/)
- [Blueprint Flex D](../blueprint-flex-d/)
- [Capteurs crédits hivernaux](../../winter-credits/wc-sensors/)

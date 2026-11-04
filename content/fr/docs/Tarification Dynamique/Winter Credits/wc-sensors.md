---
title: Capteurs crédit hivernaux
linkTitle: Capteurs crédit hivernaux
weight: 47
description: |
  Description des capteurs crédit hivernaux
date: 2024-12-14T19:18:47.798Z
lastmod: 2025-01-08T16:51:07.251Z
---

## Description des capteurs

Les entités suivantes sont créées pour le tarif DCPC (Crédits hivernaux). Les entités d'événements de pointe lisent leurs données depuis le calendrier dédié configuré dans l'intégration. Pour le détail de chaque période, consultez la page de [logique d'optimisation](../optimization-logics/).

{{% alert color="warning" title="Avertissement" %}}

Les entités qui représentent l'état actuel (État Crédit Hivernal, Pointe critique active, Préchauffage actif) dépendent des événements du calendrier et de la mise à jour du coordinateur. Pour les automatisations qui doivent s'exécuter à une heure précise, privilégiez les entités d'horodatage (Début du prochain ancrage, Début prochaine pointe, Début prochain préchauffage, etc.).

{{% /alert %}}

### Capteurs

| Entité | Valeurs | Description |
|-|-|-|
| État Crédit Hivernal | anchor / normal / peak / critical_anchor / critical_peak / off_season | État actuel de la période (Diagnostic). `off_season` hors de la saison hivernale (1er décembre au 31 mars) |
| Crédit hivernal total | 123,45 $ CA | Crédit hivernal accumulé à ce jour |
| Crédit hivernal projeté | 234,56 $ CA | Crédit hivernal projeté à la fin de la période hivernale |
| Début du prochain ancrage | horodatage | Début de la prochaine période d'ancrage (Diagnostic). Attribut `critical`: l'ancrage est lié à une pointe critique |
| Fin du prochain ancrage | horodatage | Fin de la prochaine période d'ancrage (Diagnostic). Attribut `critical`: l'ancrage est lié à une pointe critique |
| Début prochaine pointe | horodatage | Début de la prochaine période de pointe (Diagnostic). Attribut `critical`: la pointe est critique |
| Fin prochaine pointe | horodatage | Fin de la prochaine période de pointe (Diagnostic). Attribut `critical`: la pointe est critique |
| Début prochaine pointe critique | horodatage | Début de la prochaine pointe **critique**. Indisponible lorsque la prochaine pointe n'est pas critique |
| Fin prochaine pointe critique | horodatage | Fin de la prochaine pointe **critique**. Indisponible lorsque la prochaine pointe n'est pas critique |
| Début prochain préchauffage | horodatage | Début de la période de préchauffage avant la prochaine pointe (Diagnostic). Attribut `critical`: le préchauffage est pour une pointe critique |

### Résultats d'hier

Ces 8 capteurs rapportent le résultat des pointes critiques d'hier. Ils sont indisponibles s'il n'y a pas eu de pointe critique la veille.

| Entité | Unité | Description |
|-|-|-|
| Crédit hier matin | $ CA | Crédit hivernal obtenu lors de la pointe d'hier matin |
| Conso. réelle hier matin | kWh | Consommation réelle lors de la pointe d'hier matin |
| Conso. réf. hier matin | kWh | Consommation de référence pour la pointe d'hier matin |
| Conso. éco. hier matin | kWh | Consommation économisée par rapport à la référence pour la pointe d'hier matin |
| Crédit hier soir | $ CA | Crédit hivernal obtenu lors de la pointe d'hier soir |
| Conso. réelle hier soir | kWh | Consommation réelle lors de la pointe d'hier soir |
| Conso. réf. hier soir | kWh | Consommation de référence pour la pointe d'hier soir |
| Conso. éco. hier soir | kWh | Consommation économisée par rapport à la référence pour la pointe d'hier soir |

### Capteurs binaires

| Entité | Valeurs | Description |
|-|-|-|
| Période critique | on / off | La prochaine pointe est critique (Diagnostic). Conservé pour compatibilité avec Prochaine pointe critique |
| Pointe critique active | on / off | Une pointe critique est en cours (Diagnostic) |
| Préchauffage actif | on / off | La période de préchauffage avant une pointe est en cours (Diagnostic, désactivé par défaut) |
| Prochain ancrage critique | on / off | La prochaine période d'ancrage est liée à une pointe critique (Diagnostic) |
| Prochaine pointe critique | on / off | La prochaine période de pointe est critique (Diagnostic) |
| Pointe critique à venir | on / off | Une pointe critique est annoncée et toujours à venir (Diagnostic) |
| Pointe matin aujourd'hui | on / off | Une pointe critique est prévue ce matin (6h-10h) (Diagnostic, désactivé par défaut) |
| Pointe soir aujourd'hui | on / off | Une pointe critique est prévue ce soir (16h-20h) (Diagnostic, désactivé par défaut) |
| Pointe matin demain | on / off | Une pointe critique est prévue demain matin (6h-10h) (Diagnostic, désactivé par défaut) |
| Pointe soir demain | on / off | Une pointe critique est prévue demain soir (16h-20h) (Diagnostic, désactivé par défaut) |

## Pages connexes

- [Logique d'optimisation des crédits hivernaux](../optimization-logics/)
- [Blueprint crédits hivernaux](../blueprint-wc/)
- [Capteurs Flex D](../../flex-d/flexd-sensors/)

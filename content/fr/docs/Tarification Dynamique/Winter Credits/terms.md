---
title: Termes
linkTitle: Termes
weight: 42
description: |
  Termes utilisés en lien avec les crédits hivernaux
date: 2022-09-20T23:47:28.801Z
lastmod: 2025-11-24T17:56:00.000Z
---

Les termes suivants sont utilisés dans ce module et proviennent autant que possible du document officiel des taux d'électricité hydro-quebec (page 31):

[https://www.hydroquebec.com/data/documents-donnees/pdf/tarifs-electricite.pdf](https://www.hydroquebec.com/data/documents-donnees/pdf/tarifs-electricite.pdf#page=37)

et du document de la “Régie de l’énergie” :

[http://publicsde.regie-energie.qc.ca/projets/469/DocPrj/R-4057-2018-B-0062-DDR-RepDDR-2018_10_26.pdf#page=124](http://publicsde.regie-energie.qc.ca/projets/469/DocPrj/R-4057-2018-B-0062-DDR-RepDDR-2018_10_26.pdf#page=124)

## Periode

Dans le contexte des crédits hivernaux, une période est une plage horaire pendant laquelle un tarif spécifique ou une logique algorythmique est appliquée par Hydro-Québec.

Il y a 3 types de période:

### Pointe

Une période de pointe est une période pendant laquelle la consommation d'énergie de tous les clients est généralement élevée.
Dans le contexte des crédits hivernaux, les plages horaire suivantes sont des périodes de pointe:

Période de pointe matinale : 06:00 à 10:00
Période de pointe du soir: 16:00 à 20:00

### Ancrage

Cette période commence 5 heures avant l'heure de début de pointe suivante pour le matin (durée de 3 heures) et 4 heures avant pour le soir (durée de 2 heures). Avec les périodes de pointes décrites ci-dessus, il en résulte les périodes d'ancrage suivantes:

Période d'ancrage matinale: 01:00 à 04:00
Période d'ancrage du soir: 12:00 à 14:00

Cette période est utilisée par Hydro-Québec en combinaison avec la période de référence pour calculer l'énergie de référence utilisée pour calculer le crédit en essayant de d'estimer la consommation d'énergie supplémentaire causée par la température plus froide.

Dans le document de taux du Hydro-Québec, cette période se nomme "Ajustement de la température" et dans le document «Regie de l’énergie», il est appelé une période «d’ancrage».

### Normale

Toute période qui n'est pas un ancrage ou une pointe.

## Critique

Une période de pointe ou d'ancrage peut être critique ou non. Une période critique est lorsqu'un événement de pointe critique a été déclaré par Hydro-Québec pour la période.

## Énergie Effacée et Limitation (Nouveau 2025)

L'énergie effacée représente la différence entre l'énergie de référence (consommation estimée basée sur l'historique) et l'énergie réellement consommée pendant un événement de pointe critique. Cette valeur ne peut jamais être négative.

### Limitation de l'ajustement pour la température

**Si l'énergie effacée dépasse 40 kWh**, l'ajustement pour la température est plafonné à un maximum :

- **Pour une pointe matinale** : Maximum de 2 fois la consommation moyenne de la période d'ancrage (01:00-04:00) des 5 jours de référence
- **Pour une pointe du soir** : Maximum de 2 fois la consommation moyenne de la période d'ancrage (12:00-14:00) des 5 jours de référence

**Implication pratique** : Cette règle limite le bénéfice des stratégies d'optimisation aggressives. Si vous effacez plus de 40 kWh pendant la pointe critique, l'ajustement de température (qui augmente normalement votre crédit) sera plafonné, réduisant ainsi le crédit potentiel total.

### Crédit minimum

Aucun crédit n'est versé pour un événement de pointe si la valeur de l'énergie effacée est inférieure à 1 kWh (soit moins de 0,57 $ de crédit).

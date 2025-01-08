---
title: Termes
linkTitle: Termes
weight: 42
description: |
  Termes utilisés en lien avec les crédits hivernaux
date: 2022-09-20T23:47:28.801Z
lastmod: 2025-01-08T16:51:07.251Z
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

Période de pointe matinale : 06:00 à 09:00
Période de pointe du soir: 16:00 à 20:00

### Ancrage

Cette période commence 5 heures avant l'heure de début de pointe suivante et a une durée de 3 heures. Avec les périodes de pointes décrites ci-dessus, il en résulte les périodes d'ancrage suivantes suivantes

Période d'ancrage matinale: 01:00 à 04:00
Période d'ancrage du soir: 11:00 à 14:00

Cette période est utilisée par Hydro-Québec en combinaison avec la période de référence pour calculer l'énergie de référence utilisée pour calculer le crédit en essayant de d'estimer la consommation d'énergie supplémentaire causée par la température plus froide.

Dans le document de taux du Hydro-Québec, cette période se nomme "Ajustement de la température" et dans le document «Regie de l’énergie», il est appelé une période «d’ancrage».

### Normale

Toute période qui n'est pas un ancrage ou une pointe.

## Critique

Une période de pointe ou d'ancrage peut être critique ou non. Une période critique est lorsqu'un événement de pointe critique a été déclaré par Hydro-Québec pour la période.

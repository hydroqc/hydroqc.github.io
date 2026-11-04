---
title: Entités
linkTitle: Entités
weight: 24
description: |
  Entités créées par l'intégration Hydro-Québec
date: 2026-11-04T00:00:00.000Z
lastmod: 2026-11-04T00:00:00.000Z
---

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

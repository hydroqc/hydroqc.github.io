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

Voici la description de des capteurs en liens avec le tarif Flex D.

{{% alert color="warning" title="Avertissement" %}}Les capteur qui représente un état présent (Current dpc period detail) comportent un risque de ne pas être mis à jour de manière ponctuelle. Nous vous recommandons d'utiliser les capteur de type "timestamp" pour déclancher vos automatisme.{{% /alert %}}

| Nom du capteur | Valeurs | Description |
|-|-|-|
|Current dpc period detail | normal / peak | Nom de la période et état actuel|
| next peak start / end | timestamp | L'heure où la prochaine période de pointe commence et se termine.Peut être utilisé comme déclencheurs dans les automatisations Home-Assistant. |
| next_pre-heat start | timestamp | Heure de démarrage de la période de pré-chauffage |
| net saving/loss vs rate d | -CA$50.52 | Gain ou perte avec Flex D en comparaison au tarif D. Si le chiffre est positif il s'agit d'une perte (ça vous coute plus cher) |

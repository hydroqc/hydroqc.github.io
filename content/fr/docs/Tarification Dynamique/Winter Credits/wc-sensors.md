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

Voici la description de certains des capteurs en liens avec les crédits hivernaux. Si vous voulez plus de détails sur les logiques de chaque période, vous pouvez obtenir plus de détails ici: [logique pour les crédits hivernaux](/fr/docs/Tarification Dynamique/Winter Credits/optimization-logics/)

{{% alert color="warning" title="Avertissement" %}}Les capteurs qui représente un état présent (Current period state for winter credit / current wc period detail / wc critical peak in progress) comportent un risque de ne pas être mis à jour de manière ponctuelle. Nous vous recommandons d'utiliser les capteurs de type "timestamp" pour déclencher vos automatismes.{{% /alert %}}

| Nom du capteur | Valeurs | Description |
|-|-|-|
|Current period state for winter credit / current wc period detail | anchor / normal / peak / critical_anchor / critical_peak | Nom de la période et état actuel|
| wc next anchor start / end | timestamp | L'heure où la prochaine période d'ancrage commence et se termine. Peut être utilisé comme déclencheurs dans les automatisations Home-Assistant. |
| wc next peak start / end | timestamp | L'heure où la prochaine période de pointe commence et se termine.Peut être utilisé comme déclencheurs dans les automatisations Home-Assistant. |
| wc next critical peak start / end | timestamp | L'heure où la prochaine période de pointe commence et se termine.Peut être utilisé comme déclencheurs dans les automatisations Home-Assistant. Sera "Indisponible" si la prochaine pointe n'est pas critique |
| wc upcoming_critical_peak | true/false | Y a-t-il une pointe critique à venir.Sera True dès que nous détecterons une annonce d'Hydro-Québec et reviendra à False une fois qu'il n'y aura pas de pointe critique à venir.|
| wc critical peak in progress | true/false | Sommes-nous dans une pointe critique en ce moment.|
| wc next anchor critical | true/false | Est-ce que la prochaine période d'ancrage est liée à une pointe critique? Sera true de la fin de la dernière pointe à la fin de la prochaine pointe si la prochaine pointe est critique.|
| wc next peak critical | true/false | Est-ce que la prochaine pointe est critique? Sera true de la fin de la dernière pointe à la fin de la prochaine pointe si la prochaine pointe est critique.
| wc upcoming critical peak today/tomorrow morning/evening | true/false | Est-ce qu'il y a une pointe critique planifiée dans la période spécifiée.Restera true/false jusqu'à la fin de la journée en question |
| wc yesterday morning/evening * | various | Les valeurs (crédit, énergie de référence, énergie effacée, consommation réelle) pour les pointes critiques qui se sont produits hier. Ne sera pas disponible s'il n'y avait pas de pointe critique la veille. |
| wc critical | true/false | Sera true de la fin de la dernière pointe à la fin de la prochaine pointe si la prochaine pointe est critique. Puisqu'il s'agit d'un double de "Next Peak Critical", il sera éventuellement supprimé |
| pre-heat in progress | true/false | Vrai durant la période de pré-chauffage |

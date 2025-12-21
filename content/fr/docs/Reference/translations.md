---
title: Système de Traduction
linkTitle: Traductions
weight: 20
description: |
  Comprendre comment l'intégration HydroQC affiche les noms d'entités dans différentes langues
date: 2025-12-21T21:50:00.000Z
lastmod: 2025-12-21T21:50:00.000Z
---

## Vue d'ensemble

L'intégration HydroQC utilise le système de traduction intégré de Home Assistant pour afficher les noms de capteurs et d'entités dans votre langue préférée. L'intégration supporte l'**anglais**, le **français** et l'**espagnol**.

## Fonctionnement des Traductions

Home Assistant détermine la langue d'affichage selon un ordre de priorité spécifique :

1. **Langue du système** (priorité la plus élevée)
2. **Langue du profil utilisateur** (repli)
3. **Langue par défaut (anglais)** (repli final)

Cela signifie que les noms d'entités apparaîtront dans la langue configurée pour l'ensemble de votre système Home Assistant, **et non** nécessairement la langue définie dans votre profil utilisateur individuel.

## Langues Supportées

| Langue | Fichier de Traduction | Couverture |
|--------|----------------------|------------|
| Anglais | `en.json` | ✅ Complète (58 capteurs, 16 capteurs binaires) |
| Français | `fr.json` | ✅ Complète (58 capteurs, 16 capteurs binaires) |
| Espagnol | `es.json` | ✅ Complète (58 capteurs, 16 capteurs binaires) |

## Changer la Langue d'Affichage

### Langue du Système

Pour changer la langue de tous les noms d'entités dans le système :

1. Allez dans **Paramètres** → **Système** → **Général**
2. Sous **Langue & Région**, sélectionnez votre langue préférée dans le menu déroulant **Langue**
3. Cliquez sur **Enregistrer**
4. Rafraîchissez votre navigateur pour voir les changements

{{< alert color="info" title="Note" >}}
Changer la langue du système affecte l'ensemble de l'interface Home Assistant, incluant toutes les intégrations et entités.
{{< /alert >}}

### Langue du Profil Utilisateur

Bien que vous puissiez définir une langue différente dans votre profil utilisateur (**Paramètres** → **Profil**), cela **ne remplacera pas** la langue du système pour les noms d'entités. La langue du système a toujours la priorité pour les traductions d'entités.

## Exemples de Noms de Capteurs

Voici quelques exemples de la façon dont les noms de capteurs apparaissent dans chaque langue :

| Clé du Capteur | Anglais | Français | Espagnol |
|----------------|---------|----------|----------|
| `balance` | Balance | Solde | Saldo |
| `current_billing_period_current_day` | Billing Period Day | Jour période facturation | Día período facturación |
| `current_billing_period_total_consumption` | Billing Period Consumption | Conso. période facturation | Consumo período facturación |
| `wc_cumulated_credit` | Winter Credit | Crédit cumulé | Crédito acumulado |
| `dpc_pre_heat` | Pre-heat Period | Période de préchauffage | Período de precalentamiento |

## Contribuer aux Traductions

Si vous souhaitez améliorer les traductions existantes ou ajouter le support d'une nouvelle langue :

1. Les fichiers de traduction sont situés dans `custom_components/hydroqc/translations/`
2. Chaque fichier suit le format `{code_langue}.json` (ex : `es.json` pour l'espagnol)
3. La structure inclut :
   - Traductions du flux de configuration (`config.step.*`)
   - Traductions du flux d'options (`options.step.*`)
   - Traductions des entités (`entity.sensor.*` et `entity.binary_sensor.*`)

Pour des instructions détaillées sur la contribution de traductions, consultez le fichier [CONTRIBUTING.md](https://github.com/hydroqc/hydroqc-ha/blob/main/CONTRIBUTING.md) dans le dépôt.

## Détails Techniques

### Clés de Traduction

L'intégration utilise le système `translation_key` de Home Assistant au lieu de noms codés en dur. Chaque capteur a une clé unique définie dans `const.py` :

```python
SENSORS = {
    "balance": {
        "data_source": "account.balance",
        "device_class": SensorDeviceClass.MONETARY,
        # Pas de champ "name" - utilise translation_key à la place
    },
}
```

L'entité du capteur définit ensuite `_attr_translation_key` :

```python
self._attr_translation_key = self._sensor_key
```

Home Assistant recherche automatiquement le nom traduit dans le fichier de traduction approprié selon la langue du système.

### Avantages des Clés de Traduction

- **Maintenabilité** : Mettre à jour les traductions sans changer le code Python
- **Cohérence** : Les noms sont cohérents à travers l'intégration
- **Localisation** : Facile d'ajouter de nouvelles langues en créant de nouveaux fichiers de traduction
- **Expérience utilisateur** : Les noms d'entités apparaissent dans la langue préférée de l'utilisateur

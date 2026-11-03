---
title: Tableau de bord énergie
linkTitle: Tableau de bord énergie
weight: 25
description: |
  Configurations du tableau de bord d'énergie Home-Assistant
lastmod: 2026-11-03T00:00:00.000Z
date: 2023-11-08T00:33:04.684Z
---

## Consommation horaire dans le tableau de bord énergétique

{{% alert color="info" title="Désactiver la synchronisation de consommation" %}}
Si vous n'avez pas besoin du suivi de consommation ou utilisez une autre intégration pour cela, vous pouvez désactiver la synchronisation de consommation lors de la configuration initiale ou dans les options de l'intégration. Cela empêchera la création des capteurs de consommation et désactivera le service de synchronisation d'historique.
{{% /alert %}}

{{% alert color="warning"%}}**La consommation horaire d'Hydro-Québec n'est pas en direct.** La consommation horaire se synchronisera automatiquement lorsqu'elle sera disponible auprès d'Hydro-Québec. Dans le portail web d'Hydro-Québec, vous ne pouvez voir la consommation horaire que de la veille. Il y a toujours un retard de quelques heures avant la publication des données.{{% /alert %}}

Lorsque vous activez la synchronisation de la consommation horaire, un ou plusieurs capteurs sont créés dans Home-Assistant nommés "*_hourly consumption" selon votre tarif.

### Tarif D et D avec option CPC (Crédits Hivernaux)

Dans le tableau de bord énergétique, vous devrez utiliser le capteur "Total Hourly Consumption" dans la section "Consommation du réseau", sans suivi des coûts.

![img](/images/configuration/home-assistant-4.png)

### Tarifs Flex-D et DT (bi-énergie)

Pour les tarifs FlexD et Bi-Énergie vous pouvez mettre les capteurs "High price hourly consumption" et "Reg price hourly consumption". Ceci vous permettra de distinguer les deux types de consommation dans le tableau de bord.

![img](/images/configuration/home-assistant-3.png)

{{% alert color="warning"%}}**Les capteurs de consommation auront toujours un état "inconnu".** Nous n'avons pas d'état pour cela, nous devons le créer afin d'y pousser les statistiques et pour qu'il soit disponible à ajouter au tableau de bord énergétique, mais il n'aura jamais de valeur.

![img](/images/configuration/home-assistant-1.png)
{{% /alert %}}

## Historique de consommation d'énergie

### Configuration Initiale

L'activation de la synchronisation de consommation horaire durant la configuration de l'intégration **hydroqc-ha** synchronisera automatiquement:

- Les données des **30 derniers jours** via la synchronisation régulière (efficace et rapide)
- Pour plus de 30 jours: importation CSV automatique en arrière-plan lors de la configuration initiale

### Importation Manuelle de l'Historique

L'intégration **hydroqc-ha** fournit un service Home Assistant pour importer manuellement l'historique de consommation horaire jusqu'à **2 ans en arrière**.

**Service**: `hydroqc.sync_consumption_history`

**Paramètres**:

- `days_back`: Nombre de jours à importer (défaut: 731 jours = ~2 ans)
- `device_id`: L'appareil HydroQC correspondant à votre contrat

**Utilisation dans les Actions**:

```yaml
action: hydroqc.sync_consumption_history
data:
  days_back: 365  # Importer la dernière année
target:
  device_id: <votre_device_id>
```

**Depuis l'interface**:

1. Allez dans **Outils pour développeurs** → **Services**
2. Sélectionnez le service **HydroQC: Sync consumption history**
3. Sélectionnez votre appareil HydroQC
4. Spécifiez le nombre de jours (optionnel, défaut: 731)
5. Cliquez sur **Appeler le service**

{{% alert color="warning" title="Important" %}}

- L'importation s'exécute en **arrière-plan** et peut prendre **30 minutes à 1 heure** selon la quantité de données
- N'exécutez pas le service plusieurs fois consécutivement - attendez que l'importation précédente se termine
- Vérifiez les journaux de Home Assistant pour suivre la progression
- L'importation utilise l'API CSV d'Hydro-Québec (plus efficace pour de grandes périodes)

{{% /alert %}}

### Gestion des Statistiques

Si vous avez besoin de corriger ou supprimer des statistiques de consommation horaire (par exemple, après une importation incorrecte), vous pouvez le faire via les **Outils pour développeurs** de Home Assistant:

**Accéder aux statistiques**:

1. Allez dans **Outils pour développeurs** → **Statistiques**
2. Recherchez vos capteurs de consommation horaire (ex: `sensor.home_total_hourly_consumption`)
3. Cliquez sur le capteur pour voir toutes les statistiques enregistrées

**Ajuster ou supprimer une statistique**:

1. Cliquez sur le bouton **Ajuster la somme** pour corriger une valeur incorrecte
2. Ou sélectionnez une plage de dates et cliquez sur **Supprimer** pour effacer les données d'une période spécifique
3. Les modifications prendront effet immédiatement dans le tableau de bord énergétique

{{% alert color="warning" title="Attention" %}}

La suppression de statistiques est **permanente** et ne peut pas être annulée. Assurez-vous de bien vouloir supprimer les données avant de confirmer. Si vous supprimez l'historique par erreur, vous devrez réimporter les données via le service `hydroqc.sync_consumption_history`.

{{% /alert %}}

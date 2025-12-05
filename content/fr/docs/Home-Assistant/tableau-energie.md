---
title: Tableau de bord énergie
linkTitle: Tableau de bord énergie
weight: 25
description: |
  Configurations du tableau de bord d'énergie Home-Assistant
lastmod: 2025-01-08T16:51:07.251Z
date: 2023-11-08T00:33:04.684Z
---

## Consommation horaire dans le tableau de bord énergétique

{{% alert color="warning"%}}**La consommation horaire d'Hydro-Québec n'est pas en direct.** La consommation horaire se synchronisera automatiquement lorsqu'elle sera disponible auprès d'Hydro-Québec. Dans le portail web d'Hydro-Québec, vous ne pouvez voir la consommation horaire que de la veille.Avec Hydroqc2MQTT, vous pourrez parfois voir la consommation du jour en cours. Il y a toujours un retard de quelques heures avant la publication des données.{{% /alert %}}

Lorsque vous activez la synchronisation de la consommation horaire, un ou plusiseurs capteur est créé dans Home-Assistant nommé "*_hourly consumption" selon votre tarif.
### Tarif D et D avec option CPC (Crédits Hivernaux)
Dans le tableau de bord énergétique, vous devrez utiliser le capteur "Total Hourly Consumption" dans la section "Consommation du réseau", sans suivi des coûts.

![img](/images/configuration/home-assistant-4.png)

### Tarifs Flex-D et DT (bi-énergie)

Pour les tarif FlexD et Bi-Énergie vous pouvez mettre les capteurs "High price hourly consumption" et "Reg price hourly consumption". Ceci vous permettera de distinguer les deux types de consommation dans le tableau de bord.

![img](/images/configuration/home-assistant-3.png)

{{% alert color="warning"%}}**Les capteurs de consommation auront toujours un état "inconnu".** Nous n'avons pas d'état pour cela, nous devons le créer afin d'y pousser les statistiques et pour qu'il soit disponible à ajouter auTableau de bord énergétique, mais il n'aura jamais de valeur.

![img](/images/configuration/home-assistant-1.png)
{{% /alert %}}

## Historique de consommation d'énergie

L'activation de l'option ci-dessus synchronisera la consommation des deux derniers jours et toutes les données de consommation futures disponibles.

Sur l'appareil `hydroqc_maison`, vous trouverez également un moyen d'importer les données historiques de consommation horaire des deux dernières années.

![img](/images/configuration/home-assistant-2.png)

Le bouton Clear supprimera tous l'historique horaire de consommation. Cela peut être utile si vous avez un problème avec l'historique importé.

L'option de jours à synchroniser vous permet de définir la période pour laquelle vous souhaitez importer l'historique. Nos tests montrent que l'importation échoue lorsque vous reculez plus de 2 ans dans le passé. Vous pouvez également utiliser cette option pour refaire un import de l'historique si, pour une raison quelconque, il vous manque quelques jours dans votre historique récente.

Le commutateur nommé "Sync hourly consumption history" doit être activé lorsque vous souhaitez démarrer la synchronisation.

{{% alert color="warning"%}}La synchronisation de l'historique peut prendre une heure ou plus pour terminer et entraîne souvent des erreurs. C'est normal, ne réactivez pas le bouton de synchronisation d'historique plusieurs fois d'affilée sans redémarrer d'abord Hydroqc2MQTT{{% /alert %}}

Lorsque l'importation sera terminée, le commutateur reviendra à l'état désactivé. **Vous ne devriez l'allumer qu'une seule fois, il n'y a aucun avantage à faire une resynchronisation de l'historique si elle est déjà importée.**

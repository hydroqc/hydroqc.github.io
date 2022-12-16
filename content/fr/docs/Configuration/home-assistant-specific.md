---
title: Home-Assistant
linkTitle: Home-Assistant
weight: 28
description: |
  Configurations spécifiques à Home-Assistant
lastmod: 2022-09-21T20:03:32.100Z
---

## Consommation horaire dans le tableau de bord énergétique

{{< alert color="warning">}}**La consommation horaire d'Hydro-Québec n'est pas en direct.** La consommation horaire se synchronisera automatiquement lorsqu'elle sera disponible auprès d'Hydro-Québec. Dans le portail web d'Hydro-Québec, vous ne pouvez voir la consommation horaire que de la veille.Avec Hydroqc2MQTT, vous pourrez parfois voir la consommation du jour en cours. Il y a toujours un retard de quelques heures avant la publication des données.{{< /alert >}}

Lorsque vous activez la synchronisation de la consommation horaire, un capteur est créé dans Home-Assistant nommé "hourly consumption" (sensor.hydroqc_maison_hourly_consomption).

{{< alert color="warning">}}**Le capteur "Houly Consumption" aura toujours un état "inconnu".** Nous n'avons pas d'état pour cela, nous devons le créer afin d'y pousser les statistiques et pour qu'il soit disponible à ajouter auTableau de bord énergétique, mais il n'aura jamais de valeur.
{{< /alert >}}

Dans le tableau de bord énergétique, vous devrez utiliser ce capteur dans la section "Grid Consumption".

![img](/images/configuration/home-assistant-1.png)

Il n'y a aucun moyen précis de suivre le prix des tarifs actuellement, car tous les capteurs disponibles suivent les données de la veille.

Si vous ne vous souciez pas de l'exactitude, vous pouvez également ajouter le capteur "Current billing period total to date" sous l'option "Utiliser une entité de suivi des coûts totaux". Cela affichera les données de taux, mais elle le calculera le prix d'hier avec la consommation du jour en cours.

## Historique de consommation d'énergie

L'activation de l'option ci-dessus synchronisera la consommation des deux derniers jours et toutes les données de consommation futures disponibles. Nous fournissons également un moyen d'importer les données historiques de consommation horaire des deux dernières années.

![img](/images/configuration/home-assistant-2.png)

Le bouton Clear supprimera tous l'historique horaire de consommation. Cela peut être utile si vous avez un problème avec l'historique importé.

L'option de jours à synchroniser vous permet de définir la période pour laquelle vous souhaitez importer l'historique. Nos tests montrent que l'importation échoue lorsque vous reculez environ 2 ans dans le passé. Vous pouvez également utiliser cette option pour refaire un import de l'histoire si pour une raison quelconque, vous manquez quelques jours dans votre historique récente.

Le commutateur nommé "Historique de consommation horaire de synchronisation" doit être activé lorsque vous souhaitez démarrer la synchronisation.

{{< alert color="warning">}}La synchronisation historique peut prendre une heure ou plus pour terminer et entraîner souvent des erreurs. C'est normal, ne réactivez pas le bouton d'historique plusieurs fois d'affilée sans redémarrer d'abord Hydroqc2MQTT{{< /alert >}}

Lorsque l'importation sera terminée, le commutateur se désactivera à nouveau. **Vous ne devriez l'allumer qu'une seule fois, il n'y a aucun avantage à faire une resynchronisation de l'historique si elle est déjà importée.**

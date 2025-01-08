---
title: Problèmes connus
linkTitle: Problèmes connus
weight: 52
description: |
  Problèmes dont nous sommes conscients et leurs solutions de contournement.
date: 2022-09-21T18:41:22.563Z
lastmod: 2025-01-08T16:51:07.251Z
---

## La consommation ne se synchronise pas

### Problème occasionnel

Lors du début ou de la fin de la période de facturation la consommation n'est pas disponible dans le portail, Hydroqc n'est donc pas en mesure de la récupérer. Patientez deux ou trois jours après le début de votre période de facturation et la consommation devrais recommencer à se synchroniser d'elle-même

### L'historique à long terme ne se synchronise pas

Quand le hydroqc2mqtt est en marche depuis un certain temps, la fonctionnalité d'import de l'historique de consommation devient non-fonctionnel. Si vous prévoyez faire une importation de vos donnée historique long-terme, effectuez un redémarrage de Hydroqc avant.


## Hydroqc2mqtt (ou l'addon) redémarre souvent

Hydro-Québec font souvent des maintenances sur leurs systèmes qui se traduisent par des erreurs dans les clients Hydroqc. Si votre installation est généralement fonctionnelle, mais que le conteneur / addon redémarre de temps en temps, il n'est pas nécessaire de s'inquiéter.

Pour le add-on Home-Assistant vous pouvez utiliser l'automatisme suivant pour redémarrer le add-on:

```yaml
alias: AUTO restart HydroQC
description: Restart automatiquement l'addon à 4h00 AM si il est planté/arrêté
trigger:
  - platform: time
    at: "05:31:00"
condition:
  - condition: state
    entity_id: binary_sensor.hydroqc_add_on_running
    state: "off"
action:
  - service: hassio.addon_restart
    data:
      addon: 57e6a4ee_hydroqc
mode: single
```

## Entitées en double dans Home-Assistant ou changement de contrat

Parfois, si des problèmes sont rencontrés lors de la configuration initiale de Hydroqc2MQTT (ou de l'addon), il peut s'exécuter avec des valeurs non valides et créer des entités vides.

Lors d'un changement de contrat (Flex D vers Crédits Hivernaux ou vice-versa) les entitées obsoletes ne sont pas automatiquement supprimées. Vous pouvez suivre cette procédure pour les retirer.

Vous pouvez résoudre ce problème en faisant ce qui suit

1. Arrêtez Hydroqc2MQTT ou l'addon

2. Laissez MQTT en cours d'exécution

3. Allez dans l'intégration MQTT dans Home-Assistant et ouvrez l'entité Hydroqc

4. Dans la case "Info de l'appareil", cliquez sur les trois points et cliquez sur "Supprimer"
  Cela supprimera toutes les entités Hydroqc Home-Assistant et dans MQTT.

5. Vous pouvez ensuite démarrer Hydroqc2MQTT ou l'addon et toutes les entités seront recréées sans les doublons.

## `binascii.Error: Incorrect padding` error

Nous avons eu un signalement de ce problème. Le problème provient du portail client Hydro-Québec renvoyant un JSON malformé lorsque le nom de la personne contient des caractères spéciaux (par exemple Benoît). La solution consiste à modifier le nom dans le portail client.

- Connectez-vous à votre portail client hydro-quebec

- Déplacez votre curseur sur votre nom en haut à droite

- Cliquez sur "Informations de connexion" (Données d'identification)

- Changez votre nom complet pour supprimer tous les caractères accentués

Essayez à nouveau le module.

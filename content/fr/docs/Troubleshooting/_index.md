---
title: Dépannage
linkTitle: Dépannage
weight: 50
description: |
  Étapes de dépannage
date: 2022-09-21T20:33:24.876Z
lastmod: 2025-01-08T16:51:07.251Z
---

{{< alert color="warning" title="Important" >}}**Tous les composants du projet HYDROQC dépendent du portail client Hydro-Quebec.**

**Le portail client n'est pas un service à haute criticité disponible 24/7, 99,999%.**

D'après notre expérience, il subit un entretien presque quotidiennement, pendant la journée, le soir ou la nuit. Il y a souvent des temps d'arrêt après 21h-22h le week-end.

Si votre installation fonctionne correctement, mais vous voyez un redémarrage de conteneurs / addons quelques fois par jour, sachez que c'est normal.{{< /alert >}}


1. **Vérifiez que vous pouvez accéder à votre portail client Hydro-Quebec avec votre compte.**

2. Vérifiez les [problèmes connus](./known-issues)

2. Activez le mode debug

    ```
    HQ2M_CONTRACTS_0_LOG_LEVEL=DEBUG
    HQ2M_CONTRACTS_0_HTTP_LOG_LEVEL=DEBUG
    ```
3. Publier les informations sur Discord [#support](https://discord.gg/2NrWKC7sfF) ou ouvrir un "issue" pour [hydroqc2mqtt](https://gitlab.com/hydroqc/hydroqc2mqtt/-/issues) ou l'[addon Home-Assistant](https://gitlab.com/hydroqc/hydroqc-hass-addons)

---
title: Dépannage
linkTitle: Dépannage
weight: 50
description: |
  Étapes de dépannage
date: 2022-09-21T20:33:24.876Z
lastmod: 2026-11-03T00:00:00.000Z
---

{{% alert color="warning" title="Important" %}}**Tous les composants du projet HYDROQC dépendent du portail client Hydro-Québec.**

**Le portail client n'est pas un service à haute criticité disponible 24/7, 99,999%.**

D'après notre expérience, il subit un entretien presque quotidiennement, pendant la journée, le soir ou la nuit. Il y a souvent des temps d'arrêt après 21h-22h le week-end.

Si votre installation fonctionne correctement, mais que vous voyez des erreurs dans les journaux de temps à autre, sachez que c'est normal.{{% /alert %}}

1. **Vérifiez que vous pouvez accéder à votre portail client Hydro-Québec avec votre compte.**

2. Vérifiez les [problèmes connus](./known-issues).

3. Activez le mode debug de l'intégration dans votre `configuration.yaml`:

    ```yaml
    logger:
      default: info
      logs:
        custom_components.hydroqc: debug
        custom_components.hydroqc.config_flow.base: debug
        custom_components.hydroqc.coordinator.base: debug
    ```

4. Publiez les informations sur Discord [#support](https://discord.gg/JaRfRJEByz) ou ouvrez un "issue" pour [hydroqc-ha](https://github.com/hydroqc/hydroqc-ha/issues).

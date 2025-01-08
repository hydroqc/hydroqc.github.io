---
title: Add-on - Configuration avancée
linkTitle: Add-on - Configuration avancée
weight: 28
description: |
  Configuration avancée du Add-on via fichier de configuration
date: 2025-01-08T16:46:10.437Z
lastmod: 2025-01-08T16:46:11.808Z
---

Si vous utilisez le add-on et voulez avoir plusieurs contrats dans votre Home-Assistant vous devrez faire une configuration manuelle du Addon avec le fichier de configuration.

1. Vous devrez créer un jeton d'accès longue durée ainsi qu'un compte spécifique à Hydroqc dans votre add-on mosquitto. Ceci dépasse la portée de cette documentation mais vous trouverez comment dans la documentation Home-Assistant et celle du add-on Mosquitto.

2. Créé un fichier de configuration dans le dossier `/config` de votre installation Home-Assistant. Indice: vous pouvez installer l'add-on Vscode pour ceci.

3. Modifiez ce fichier pour y mettre vos [configurations](/en/docs/configuration/config-file/) personnalisés.

Vous pouvez utiliser ces valeurs spécifiques au Home-Assistant OS

```yaml
...
mqtt_host: "core-mosquitto"
mqtt_port: "1883"

contracts:
  maison:
    ...
      home_assistant_websocket_url: http://home-assistant.local:8123/api/websocket

```
4. Configuration du add-on pour l'utilisation du fichier.

Allez dans la configuration du add-on Hydroqc, défilez jusqu'au bas et activé "Afficher les options de configuration optionnelles inutilisées"

Une fois cette option activée, défilez jusqu'en bas et entré le chemin complet vers votre fichier de configuration. Par example: `/config/hydroqc.yaml`

Vous devrez mettre des valeurs dans les champs obligatoires "Nom du contrat" et "Tarif du contrat". Ces valeurs ne sont pas prises en comptes lorsque le fichier de configuration est utilisé.

5. Démarrez le add-on.

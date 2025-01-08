---
title: Ligne de commande
linkTitle: Ligne de commande
weight: 16
description: |
   Installation native en ligne de commande
lastmod: 2024-12-14T19:23:05.450Z
date: 2025-01-08T15:59:48.894Z
---

### Installation Linux

Vous aurez besoin de python 3.12

1. Créez un dossier pour hydroqc2mqtt

   ```bash
   mkdir hydroqc2mqtt
   cd hydroqc2mqtt
   ```

2. Créez un environement virtuel python et activez le

   ```bash
   python -m venv env
   . env/bin/activate
   ```

3. Installez (et/ou mettez à jour) le module et ses dépendances

   ```bash
   pip install hydroqc2mqtt
   ```

4. Créez votre configuration

Utilisez soit des [variables d'environnement](/fr/docs/configuration/environment/) ou un [fichier de configuration](/fr/docs/configuration/config-file/)


5. Exécutez hydroqc2mqtt

Si vous utilisez des variables d'environnement
```bash

hydroqc2mqtt
```

Si vous utilisez un fichier de configuration
```bash
hydroqc2mqtt --config votreconfig.yaml
```

6. Mise à jour vers une nouvelle version
```bash

pip install --upgrade hydroqc2mqtt
```

## Windows

Les commandes d'installation sont sensiblement les mêmes.
Une procédure plus complète est en cours d'élaboration.

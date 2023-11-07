---
title: Ligne de commande
linkTitle: Ligne de commande
weight: 16
description: |
  Installation native en ligne de commande
lastmod: 2022-09-22T13:04:37.315Z
date: 2022-12-14T02:37:12.970Z
---


### Installation Linux

Vous aurez besoin de python 3.10

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

3. Installation du module et ses dépendances

   ```bash
   pip install hydroqc2mqtt
   ```

4. Téléchargement et ajustement de la configuration par défault

   ```bash
   wget "https://gitlab.com/hydroqc/hydroqc2mqtt/-/raw/main/config.sample.yaml"
   cp config.sample.yaml config.yaml
   ```

5. Copiez et adaptez run.sh à votre configuration MQTT.Si votre serveur MQTT ne nécessite pas d'authentification, laissez les valeurs MQTT_UNERNAME et  MQTT_PASSWORD vides.

   ```bash
   wget "https://gitlab.com/hydroqc/hydroqc2mqtt/-/raw/main/run.sample.sh"
   cp run.sample.sh run.sh
   chmod +x run.sh
   ```

6. Démarrez le tout!

   ```bash
   ./run.sh
   ```

Pour mettre à jour, vous pouvez exécuter la commande suivante `pip install --upgrade hydroqc2mqtt`.


## Windows

Procédure en cours d'élaboration.
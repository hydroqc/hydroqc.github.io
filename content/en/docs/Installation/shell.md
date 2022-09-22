---
title: Shell
linkTitle: Shell
weight: 16
description: |
  Install in shell
lastmod: 2022-09-22T13:04:37.315Z
---


1. Clone the repo

   ```bash
   git clone https://gitlab.com/hydroqc/hydroqc2mqtt
   cd hydroqc2mqtt
   ```

2. Create a python virtual env and activate it

   ```bash
   python -m venv env
   . env/bin/activate
   ```

3. Install requirements and module

   ```bash
   pip install --editable -r requirements.txt --no-cache-dir --force
   python setup.py develop
   ```

4. Copy and change the configuration or use environement variable.

   ```bash
   cp config.sample.yaml config.yaml
   ```

5. Copy and adapt run.sh to your MQTT configuration. If your MQTT server does not require auth leave the MQTT_USERNAME and MQTT_PASSWORD values empty

   ```bash
   cp run.sample.sh run.sh
   chmod +x run.sh
   ```

6. Run it!

   ```bash
   ./run.sh
   ```

To update you have to re-rerun the steps above. A simple git pull is not sufficient.

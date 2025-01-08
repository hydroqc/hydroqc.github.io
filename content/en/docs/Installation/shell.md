---
title: Command Line
linkTitle: Command Line
weight: 16
description: |
   Native command line installation
lastmod: 2025-01-08T16:51:07.251Z
date: 2022-12-14T02:37:12.970Z
---

### Linux Installation

You will need python 3.12

1. Create a folder for hydroqc2mqtt

   ```bash
   mkdir hydroqc2mqtt
   cd hydroqc2mqtt

2. Create a python virtual environment and activate it
```bash
python -m venv env
. env/bin/activate
```
3. Install (and/or upgrade) the module and its dependencies
```bash
pip install --upgrade hydroqc2mqtt
```
4. Create your configuration

Either use [environment variable](/en/docs/configuration/environment/) or a [config file](/en/docs/configuration/config-file/)

5. Run hydroqc2mqtt

If you are using environment variables
```bash
hydroqc2mqtt
```
If you are using a config file
```bash
hydroqc2mqtt --config yourconfig.yaml
```
6. Upgrade to newer release
```bash
pip install --upgrade hydroqc2mqtt
```
## Windows

Les commandes d'installation sont sensiblement les mêmes.
Une procédure plus complète est en cours d'élaboration.

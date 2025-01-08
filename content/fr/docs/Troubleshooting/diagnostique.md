---
title: Outil diagnostique
linkTitle: Outil diagnostique
weight: 60
description: |
  Extraction des données de comptes grâce à l'outil diagnostique.
lastmod: 2025-01-08T16:51:07.251Z
date: 2022-12-29T02:21:55.644Z
---

## Outil diagnostique

La bibliothèque hydroqc comporte un outil diagnostique pour récupéré l'ensemble des données disponible votre compte Hydro-Québec dans un format nous permettant d'investiguer les problèmes spécifiques.

{{< alert color="warning" title="Important" >}}**À utiliser sur demande expresse des développeurs seulement**

La plupart des problèmes peuvent être réglé à partir des logs disponible. SVP, nous envoyer les infos de diagnostique que lorsque de demandé.{{< /alert >}}

### Installation

Dans un premier temps il faut installé la bibliothèque hydroqc dans un environement virtuel python.

```bash
mkdir hydroqc
cd hydroqc
python3 -m venv env
. env/bin/activate
pip install Hydro-Quebec-API-Wrapper
```
### Utilisation

Un fois installé vous pouvez utiliser la commande suivante pour générer le dossier et les fichiers de diagnostique. Un dossier sera créé automatiquement avec l'ensemble des informations que la bibliothèque est en mesure d'aller chercher sur le portail d'Hydro-Québec.

```bash
hydroqc-diag -u email@domaine.com -p Soleil123 -c NoClient -a NoCompte -C NoContrat
```

Pour obtenir plus d'information sur les options disponibles vous pouvez faire la commande `hydroqc-diag -h`

### Traitement et partage des données
{{< alert color="warning" title="Important" >}}**Ces fichiers contiennent des informations personnelles**

Nous vous demandons d'effacer vos renseignement personnel des fichiers avant de nous les envoyer. Vos nom, adresse, courriel, no de comptes/client/contrat devraient être idéalement remplacé par des valeurs factices du même format.{{< /alert >}}

Pour le partage des fichiers avec les développeur nous suggèrons d'utiliser l'outil https://privatebin.net qui permet le partage de données de manière sécuritaire.

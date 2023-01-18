---
title: Tarifs supportés
linkTitle: Tarifs supportés
weight: 35
description: >
  Tarifs pris en charge par la bibliothèque HydroqC.
lastmod: 2022-09-21T19:53:56.545Z
---


Nous prenons actuellement en charge les tarifs et les options tarifaires suivantes. Nous n'avons pas accès à des comptes avec tous les types de tarifs, donc si votre tarif n'est pas répertorié ici, vous pouvez nous aider à prendre en charge de nouveaux types de compte en suivant les étapes [ici](/docs/troubleshooting/get-account-info/).


| Tarif de base | Option Tarifaire | Nom courant | Support | Testé | Commentaire |
| - | - | - | - | - | - |
| D | | [Tarif résidentiel](https://www.hydroquebec.com/residentiel/espace-clients/tarifs/tarif-d.html) | Complet | Oui | Tarif résidentiel commun |
| D | CPC | [Residentiel avec crédit hivernaux](https://www.hydroquebec.com/residentiel/espace-clients/tarifs/option-credit-hivernal.html) | Complet | Oui | Récupération des signaux de pointe critiques |
| DPC | | [Flex-D](https://www.hydroquebec.com/residentiel/espace-clients/tarifs/tarif-flex-d.html) | Complet | Oui | Récupération des signaux de pointe critiques |
| DT | | [Biénergie](https://www.hydroquebec.com/residentiel/espace-clients/tarifs/tarif-dt.html) | Complet  | Oui | |
| M | | [Tarif M](https://www.hydroquebec.com/affaires/espace-clients/tarifs/tarif-m-general-clientele-moyenne-puissance.html) | Oui | Oui | Développement initial commandité par [HD Energie](https://hd.energy)
| M | GDP | [Tarif M avec gestion de puissance](https://www.hydroquebec.com/affaires/espace-clients/tarifs/option-gestion-demande-puissance.html) | Oui | Oui | Développement initial commandité par [HD Energy](https://hd.energy)

**Support**: Signifie que nous soutenons ce tarif et l'avons intégré en partie ou complètement

**Testé**: Nous avons des tests en cours d'exécution dans nos pipelines CI/CD à l'aide de comptes réels. Voir [ici](https://gitlab.com/hydroqc/hydroqc/-/blob/main/README.md) pour plus d'informations et les résultats des tests récents . Si vous êtes "techno" et souhaitez ajouter votre compte aux tests, vous pouvez trouver les détails [ici](https://gitlab.com/hydroqc/hydroqc-test-template/-/blob/main/README.md)
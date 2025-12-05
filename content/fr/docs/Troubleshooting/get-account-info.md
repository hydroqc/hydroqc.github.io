---
title: Obtenir vos informations de compte
linkTitle: Obtenir vos informations de compte
weight: 55
description: |
  Comment obtenir les informations de votre compte pour nous aider à intégrer de nouveaux types ou fonctionnalités de compte
date: 2022-09-21T18:41:22.563Z
lastmod: 2025-01-08T16:51:07.251Z
---

Les développeurs du projet n'ont pas accès à tous les types de compte et aux options disponibles chez Hydro-quebec et s'appuient sur les informations fournies par les utilisateurs pour les implémenter.

Si votre type de compte n'est pas encore pris en charge, il peut être utile pour nous si vous pouvez fournir les informations disponibles dans votre portail client Hydro-Quebec.

{{% alert color="warning" title="Important" %}}Veuillez vous assurer de supprimer toutes vos informations personnelles des sorties avant de nous l'envoyer.{{% /alert %}}

1. Accédez à la page de connexion du portail Hydro-Quebec mais ne vous connectez pas encore

2. Activez Inspect dans les outils de developpement de votre fureteur (Ctrl+Shift+I)

3. Dans la section Inspect cliquez sur Network puis sur Fetch/XHR
  ![img](/images/troubleshooting/account-2.png)

4. Maintenant, connectez-vous à votre portail hydro-quebec avec votre compte

5. Vous devriez voir que des liens apparaissent dans la partie gauche de la fenêtre Inspect

6. Cliquez l'un d'entre eux (infoBase par exemple) et vous verrez les informations au format JSON sur le côté droit de la fenêtre (assurez-vous d'utiliser l'onglet "Preview")
   ![img](/images/troubleshooting/account-6.png)

    - Cliquez avec le bouton droit sur la section Infobase du volet gauche et copiez le lien complet
      ![img](/images/troubleshooting/account-6-2.png)

    - Copiez les données JSON dans le volet droit

7. Remplacez les informations personnelles par des données équivalentes. Essayez de préserver les données (c.-à-d. s'il y a 9 chiffres pour votre numéro de compte remplacez les par 9 chiffres aléatoires).

Répétez ce processus pour une autre section du site Web pertinente à votre compte et essayez de trouver les données.

Voici un endroit connu pour trouver des données pertinentes:

  - Consommation page
      - contrat
      - conso?noContrat=
  - Facture

    Dans l'onglet Facture, vous trouverez différentes sections en fonction de votre compte. C'est là que vous devez rechercher les informations spécifiques à votre compte dont nous pourrions avoir besoin. Vous devrez fouiller un peu pour trouver les informations pertinentes.


Lorsque tout est récupéré, veuillez publier les données anonymisés (informations personnelles supprimées) dans un "Issue" sur Gitlab https://gitlab.com/hydroqc/hydroqc/-/issues.

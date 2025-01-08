---
title: Obtaining your account information
linkTitle: Obtaining your account information
weight: 55
description: |
  How to get information from your account to help us integrate new account types or features
date: 2022-09-21T18:41:22.563Z
lastmod: 2025-01-08T16:51:07.251Z
---

The developpers of the project don't have access to all of the account types and options available at Hydro-Quebec and rely on information provided by the users to implement them.

If your account type is not supported yet it may be helpful for us if you can provide the information available in your Hydro-Quebec customer portal.

{{< alert color="warning" title="Important" >}}Please make sure to remove all your personal information from the outputs before sending it to us.{{< /alert >}}

1. Go to the Hydro-Quebec portal login page but don't login yet

2. Enable Inspect in the developper tools (Ctrl+Shift+I)

3. In the inspect section click on Network then Fetch/XHR
  ![img](/images/troubleshooting/account-2.png)
4. Now login to your Hydro-Quebec portal with your account

5. You should see links appear in the left part of the Inpector window

6. Click on one of them (infoBase for example) and you will see the information in JSON format on the right side of the window (make sure you select the Preview tab)
   ![img](/images/troubleshooting/account-6.png)

    - Right click on the InfoBase section on the left pane and copy the full link
      ![img](/images/troubleshooting/account-6-2.png)

    - Copy the JSON data in the right pane

7. Replace Personnal Information with equivalent data. Try to preserve the data (ie. if there are 9 numbers for your account number type 9 random numbers).

Repeat this process for other section of the website relevant to your account and try to find the data.

Here are some known place to find relevant data:

  - Consommation page
      - contrat
      - conso?noContrat=
  - Facture

    Under the facture section you will find different sections depending on your account. This is where you should search for your account specific information we might need. You will have to poke around a bit to find the relevant information. Check for the `estAbonne` url for your specific option and make sure to send it over to us.
    - estAbonne (for example `https://cl-services.idp.hydroquebec.com/cl/prive/api/v3_0/alertes/CPC/estAbonne` for winter credits)
    - account specific url (for example we have `creditPointeCritique` for winter credit)


When everything is gathered please post the sanitized data (personal info removed) in an issue on gitlab https://gitlab.com/hydroqc/hydroqc/-/issues.




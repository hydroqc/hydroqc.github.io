---
title: Diagnostic tool
linkTitle: Diagnostic tool
weight: 60
description: |
  Extraction of account data with the diagnostic tool.
lastmod: 2025-01-08T16:51:07.251Z
date: 2022-12-29T02:21:55.644Z
---

## Diagnostic tool

The Hydroqc library includes a diagnostic tool to recover all the available data from your Hydro-Québec account in a format allowing us to investigate specific problems.

{{% alert color="warning" title="Important" %}}**To be used on the express request of developers only**

Most problems can be resolved from available logs. Please send us diagnostic data only when asked.{{% /alert %}}

### Installation

At first you must install the hydroqc library in a virtual environment Python.

```bash
mkdir hydroqc
cd hydroqc
python3 -m venv env
. env/bin/activate
pip install Hydro-Quebec-API-Wrapper
```
### Usage

Once installed you can use the following command to generate the folder and diagnostic files. A folder will be created automatically with all the information that the library is able to fetch on the Hydro-Québec portal for the specified account.

```bash
hydroqc-diag -u email@domaine.com -p Soleil123 -c NoClient -a NoCompte -C NoContrat
```

For more information on available options you can run `hydroqc-diag -h`

### Traitement et partage des données
{{% alert color="warning" title="Important" %}}**These files contain personal information**

We ask you to erase your personal file information before sending it to us. Your names, address, email, accounts/customer/contract should ideally be replaced by fake values in the same format.{{% /alert %}}

To share files with developers we will suggest using the https://privatebin.net tool which allows data sharing in a safe manner.

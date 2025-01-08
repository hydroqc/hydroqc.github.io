---
title: Terms
linkTitle: Terms
weight: 42
description: |
  Terms used when working with Winter Credit logics and automations.
date: 2022-09-20T23:47:28.801Z
---

The following terms are in use in this module and coming as much as possible from the official Hydro-Quebec electricy rates document (page 31) :

https://www.hydroquebec.com/data/documents-donnees/pdf/electricity-rates.pdf

and from the “Régie de l’énergie” document :

http://publicsde.regie-energie.qc.ca/projets/469/DocPrj/R-4057-2018-B-0062-DDR-RepDDR-2018_10_26.pdf#page=124


## Period

In the context of the Winter Credits a period is a time window during which a specific billing or algorythmic logic is applied by Hydro-Quebec.

There are 3 type of period:

### peak

A peak period is a period during which the energy consumption across all customers is generally high.
In the context of winter credits the following time range are always peak periods:

Morning peak period: 06:00 to 09:00
Evening peak period: 16:00 to 20:00

### anchor

This period starts 5 hours before the next peak start time and has a duration of 3 hours. With the current peak period (as described above) it results in the following time periods

Morning anchor period: 01:00 to 04:00
Evening anchor period: 11:00 to 14:00

This period is used by HQ in combination with the reference period to calculate the Reference Energy used to calculate the credit by trying to guess the additionnal energy usage caused by the colder temperature.

In HQ’s rate document it is called temperature adjustment and in the “Regie de l’énergie” document it is refered to as an “anchor” period.

### normal or other

Any period that is not peak or anchor.

## Critical

A peak or anchor period can be critical or not. A critical period is when a critical peak event has been declared by Hydro-Quebec for the period.

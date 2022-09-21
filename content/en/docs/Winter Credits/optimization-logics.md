---
title: Optimization logics
linkTitle: Optimization logic
weight: 45
description: >
  Description of the various logics that can be implemented with the winter
  credits.
lastmod: 2022-09-20T23:56:58.290Z
---

{{% alert title="Note" %}}A Home-Assistant blueprint implementing these logics is available [here](https://raw.githubusercontent.com/hydroqc/hass-blueprint-hydroqc/main/hydroqc-winter-credits.yaml) or with the magic button here: [![Open your Home Assistant instance and show the blueprint import dialog with a specific blueprint pre-filled.](https://my.home-assistant.io/badges/blueprint_import.svg)](https://my.home-assistant.io/redirect/blueprint_import/?blueprint_url=https%3A%2F%2Fraw.githubusercontent.com%2Fhydroqc%2Fhass-blueprint-hydroqc%2Fmain%2Fhydroqc-winter-credits.yaml){{% /alert %}}

The following information is derived from the following document and formula from the "Régie de l'énergie" filing:

http://publicsde.regie-energie.qc.ca/projets/469/DocPrj/R-4057-2018-B-0062-DDR-RepDDR-2018_10_26.pdf#page=127

### Basic critical peak logic

The instruction from Hydro-Quebec in regards to the winter credit is to move the consumption that would occur during the critical peak period to the rest of the day. 

**Before the critical peak**
They recommend to raise your thermostat setpoints a few hours before the critical peak period to pre-heat the house.

**During the peak**
	Reduce the thermostat setpoint and avoid using power hungry appliances (electric oven, kettle, hot water heater, electric vehicule charger, etc)

**After the peak**
	Resume your normal consumption.

```mermaid
graph TD
	      NormalStart[Consommation Normale] -->PeakStart
	      PeakStart[Début pointe<br/>6h ou 16h] -->PeakCritical{Critique?}
	      PeakCritical -->|Oui| PeakLowCon[Réduire consommation] 
	      PeakCritical -->|Non| PeakHighCon[Aucun changement]
	      
	      PeakHighCon --> PeakEnd
	      PeakLowCon --> PeakEnd
	      PeakEnd[Fin de pointe<br/>9h ou 20h] --> NormalEnd[Consommation Normale]

```

### Critical Peak day optimisation

The idea is that instead of just moving the critical peak consumption to the rest of the day we try to concentrate it as much as possible during the anchor period. Doing so will increase the calculated temperature adjustment that is used to calculate the critical peak period offset consumption.

```mermaid
graph TD
	      NormalStart[Consommation Normale] -->PeakStart & AnchorStart
	      PeakStart[Début pointe<br/>6h ou 16h] -->PeakCritical{Critique?}
	      PeakCritical -->|Oui| PeakLowCon[Réduire consommation] 
  
	      AnchorStart[Début Ancrage<br/>1h ou 11h] -->AnchorCritical{Critique?}
	      
	      AnchorCritical -->|Oui| AnchorHighCon[Augmente la consommation]
	      PeakLowCon --> PeakEnd
	      AnchorHighCon --> AnchorEnd
	      PeakEnd[Fin de pointe<br/>9h ou 20h] --> Normal
	      AnchorEnd[Fin d'ancrage<br/>4h ou 14h] --> Normal(Consommation Normale)
```


### Maximum return optimisation

This optimisation logic is the one that will give you the highest returns from the winter credits program. 

This logic involves moving your consumption not only on days when there is a critical peak event but everyday in order to influence the reference period that is used to estimate the energy offset during critical peak period.

We do not encourage you to use it as it is a bit against the spirit of the winter credit program.

```mermaid
graph TD
	      NormalStart[Consommation Normale] -->PeakStart & AnchorStart
	      PeakStart[Début pointe<br/>6h ou 16h] -->PeakCritical{Critique?}
	      PeakCritical -->|Oui| PeakLowCon[Réduire consommation] 
	      PeakCritical -->|Non| PeakHighCon[Augmente la consommation]
	  
	      AnchorStart[Début Ancrage<br/>1h ou 11h] -->AnchorCritical{Critique?}
	      AnchorCritical -->|Non| AnchorLowCon[Réduire la consommation]
	      AnchorCritical -->|Oui| AnchorHighCon[Augmente la consommation]
	      
	      PeakHighCon --> PeakEnd
	      PeakLowCon --> PeakEnd
	      AnchorHighCon --> AnchorEnd
	      AnchorLowCon --> AnchorEnd
	      PeakEnd[Fin de pointe<br/>9h ou 20h] --> Normal
	      AnchorEnd[Fin d'ancrage<br/>4h ou 14h] --> Normal(Consommation Normale)
```
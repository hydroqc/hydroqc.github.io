---
title: Other sensors
linkTitle: Other sensors
weight: 30
description: |
  Sensors not provided by Hydroqc but related to Hydro-Québec
lastmod: 2022-12-21T20:31:51.482Z
---

## Overview

These configurations are manual configurations that can be added to your system to display additional information related to Hydro-Québec.

### Total Hydro-Québec power call

Hydro-Québec provides some of its data on its [open data portal](https://www.hydroquebec.com/documents-donnees/donnees-ouvertes/)

The following sensor configuration retrieves the current electricity demand on the Hydro-Québec network

```yaml
- platform: rest
  resource: "https://www.hydroquebec.com/data/documents-donnees/donnees-ouvertes/json/demande.json"
  name: Demande de puissance réseau Hydro-Québec
  unique_id: edbb1dd6-6160-4279-a64d-3acc146121e5
  json_attributes:
  unit_of_measurement: MW
  device_class: power
  state_class: measurement
  value_template: >
   {% set index =  value_json.indexDonneePlusRecent %}
   {{ value_json.details[index]["valeurs"]["demandeTotal"] }}
```
Les données de ce capteur peuvent par la suite être affiché dans Home-Assistant de plusieurs manières. Voici un exemple qui utilise la carte mini-graph-card

![img](/images/home-assistant/demande-puissance.png)

```yaml
type: custom:mini-graph-card
entities:
  - sensor.demande_de_puissance_reseau_hydro_quebec
hours_to_show: 18
points_per_hour: 4
animate: true
line_width: 3
show:
  extrema: true
  fill: fade
color_thresholds:
  - value: 20000
    color: '#2596be'
  - color: '#49be25'
  - color: '#bea925'
  - value: 40000
    color: '#be4d25'
```



---
title: Services
linkTitle: Services
weight: 22
description: |
  Services exposés par l'intégration Hydro-Québec
date: 2026-11-04T00:00:00.000Z
lastmod: 2026-11-04T00:00:00.000Z
---

| Service | Description | Champs |
|-|-|-|
| `hydroqc.refresh_data` | Rafraîchir manuellement les données depuis l'API Hydro-Québec | Cible: une entité Hydro-Québec |
| `hydroqc.sync_consumption_history` | Importer l'historique de consommation horaire (s'exécute en arrière-plan) | `days_back` (1-2000, par défaut: 731) |
| `hydroqc.create_peak_event` | Créer manuellement un événement de pointe critique dans le calendrier configuré | `device_id`, `date` (AAAA-MM-JJ), `time_slot` (`AM` = 6h-10h, `PM` = 16h-20h) |

`hydroqc.sync_consumption_history` nécessite le Mode Portail et la synchronisation de consommation activée. Un événement de pointe créé manuellement est automatiquement jumelé si Hydro-Québec annonce plus tard le même événement.

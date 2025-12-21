---
title: Translation System
linkTitle: Translations
weight: 20
description: |
  Understanding how the HydroQC integration displays entity names in different languages
date: 2025-12-21T21:50:00.000Z
lastmod: 2025-12-21T21:50:00.000Z
---

## Overview

The HydroQC integration uses Home Assistant's built-in translation system to display sensor and entity names in your preferred language. The integration supports **English**, **French**, and **Spanish**.

## How Translation Works

Home Assistant determines which language to display based on a specific priority order:

1. **System Language** (highest priority)
2. **User Profile Language** (fallback)
3. **Default Language (English)** (final fallback)

This means that entity names will appear in the language configured for your entire Home Assistant system, **not** necessarily the language set in your individual user profile.

## Supported Languages

| Language | Translation File | Coverage |
|----------|------------------|----------|
| English | `en.json` | ✅ Complete (58 sensors, 16 binary sensors) |
| French | `fr.json` | ✅ Complete (58 sensors, 16 binary sensors) |
| Spanish | `es.json` | ✅ Complete (58 sensors, 16 binary sensors) |

## Changing the Display Language

### System-Wide Language

To change the language for all entity names system-wide:

1. Go to **Settings** → **System** → **General**
2. Under **Language & Region**, select your preferred language from the **Language** dropdown
3. Click **Save**
4. Refresh your browser to see the changes

{{< alert color="info" title="Note" >}}
Changing the system language affects the entire Home Assistant interface, including all integrations and entities.
{{< /alert >}}

### User Profile Language

While you can set a different language in your user profile (**Settings** → **Profile**), this will **not** override the system language for entity names. The system language always takes precedence for entity translations.

## Example Sensor Names

Here are some examples of how sensor names appear in each language:

| Sensor Key | English | French | Spanish |
|------------|---------|--------|---------|
| `balance` | Balance | Solde | Saldo |
| `current_billing_period_current_day` | Billing Period Day | Jour période facturation | Día período facturación |
| `current_billing_period_total_consumption` | Billing Period Consumption | Conso. période facturation | Consumo período facturación |
| `wc_cumulated_credit` | Winter Credit | Crédit cumulé | Crédito acumulado |
| `dpc_pre_heat` | Pre-heat Period | Période de préchauffage | Período de precalentamiento |

## Contributing Translations

If you'd like to improve existing translations or add support for a new language:

1. Translation files are located in `custom_components/hydroqc/translations/`
2. Each file follows the format `{language_code}.json` (e.g., `es.json` for Spanish)
3. The structure includes:
   - Config flow translations (`config.step.*`)
   - Options flow translations (`options.step.*`)
   - Entity translations (`entity.sensor.*` and `entity.binary_sensor.*`)

For detailed instructions on contributing translations, see the [CONTRIBUTING.md](https://github.com/hydroqc/hydroqc-ha/blob/main/CONTRIBUTING.md) file in the repository.

## Technical Details

### Translation Keys

The integration uses Home Assistant's `translation_key` system instead of hardcoded names. Each sensor has a unique key defined in `const.py`:

```python
SENSORS = {
    "balance": {
        "data_source": "account.balance",
        "device_class": SensorDeviceClass.MONETARY,
        # No "name" field - uses translation_key instead
    },
}
```

The sensor entity then sets `_attr_translation_key`:

```python
self._attr_translation_key = self._sensor_key
```

Home Assistant automatically looks up the translated name from the appropriate translation file based on the system language.

### Benefits of Translation Keys

- **Maintainability**: Update translations without changing Python code
- **Consistency**: Names are consistent across the integration
- **Localization**: Easy to add new languages by creating new translation files
- **User Experience**: Entity names appear in the user's preferred language

---
title: Supported Rates
linkTitle: Supported Rates
weight: 35
description: >
  Rates supported by the Hydroqc library.
lastmod: 2022-09-21T19:53:56.545Z
---


We currently support the following rates and rate options. We don't have access to accounts with all type of rates so if your rate is not listed here you can help us support new account types by following the steps [here](/docs/troubleshooting/get-account-info/).

| Base Rate | Rate Option | Common Name | Support | Tested | Comments |
| - | - | - | - | - | - |
| D | | [Residential Rate](https://www.hydroquebec.com/residential/customer-space/rates/rate-d.html) | Complete | Yes | This is your regular residential rate |
| D | CPC | [Residential with Winter Credits](https://www.hydroquebec.com/residential/customer-space/rates/winter-credit-option.html) | Complete | Yes | Extraction of the critical peak periods is available |
| DPC | | [Flex-D](https://www.hydroquebec.com/residential/customer-space/rates/rate-flex-d.html) | Complete | Yes | Extraction of the critical peak periods is available |
| DT | | [Dual Energy](https://www.hydroquebec.com/residential/customer-space/rates/rate-dt.html) | Complete  | Yes | |
| M | | [Rate M](https://www.hydroquebec.com/business/customer-space/rates/rate-m-general-rate-medium-power-customers.html) | Yes | Yes | Initial development sponsored by [HD Energy](https://hd.energy)
| M | GDP | [Rate M with demand response option](https://www.hydroquebec.com/business/customer-space/rates/demand-response-option.html) | Yes | Yes | Initial development sponsored by [HD Energy](https://hd.energy)

**Support**: Means we support the rate and have it integrated in part or completely

**Tested**: We have tests running in our CI/CD pipelines using real accounts. More info and recent test result [here](https://gitlab.com/hydroqc/hydroqc/-/blob/main/README.md). If you are tech savvy and want to add your account to the tests you can find the details [here](https://gitlab.com/hydroqc/hydroqc-test-template/-/blob/main/README.md)
# audyt4apex

![](https://img.shields.io/badge/Oracle-12c-success.svg)  ![](https://img.shields.io/badge/Oracle-18c-success.svg) ![](https://img.shields.io/badge/Oracle-19c-success.svg) ![](https://img.shields.io/badge/Oracle-21c-success.svg)


## Overview

Pakiet pozwala poprzez wpisy w tabeli konfiguracyjnej na parametryzację, które kolumny wybranych tabel mają być autytowane i historyzowane.;


#### All features:

- Historyzacja i audyt danych wg parametryzacji w tabeli


#### Preview: 


## Pre-requisites

- **Oracle Database 12c** lub późniejsza (nie działa na wczesniejszych wersjach ze wzgledu na zmienę w 12c dot. kolumny Identity).

- **Oracle Application Express nie jest wymagany natomiast dla nowszych wersji APEX brak natywnej historyzacji (została wyłączona w Quick sql).

Wymaga grantów: GRANT CREATE TRIGGER,CREATE TABLE,CREATE SEQUENCE DLA "WŁASNEGO SCHEMATU";  


## Installation instructions

1. Pobierz najnowsza wersję
2. Nadaj uprawnienia do w/w operacji
3. Zainstaluj na swoich schemacie danych


## Releases

| Release number | Release date | New features                                                 |
| -------------- | ------------ | ------------------------------------------------------------ |
| 1.00.00        | 2024-01-16   | Initial release                                              |


## Planned features in next releases

*English version.*

## Support

1. MIT license. 

   

   

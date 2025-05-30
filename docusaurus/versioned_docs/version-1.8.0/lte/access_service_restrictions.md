---
id: version-1.8.0-access_service_restrictions
title: Restricting Network Access
hide_title: true
original_id: access_service_restrictions
---

# Options for Network Access Restrictions in MME

This document outlines several options for limiting the service access at the network level.
Access control for a specific subscriber is handled directly via defining the proper subscriber profile and
is not part of this document.

## PLMN Restriction

Utilizing API end point `/lte/{network_id}/cellular/epc` and GET method, the EPC level configurations of the
LTE network can be retrieved including the list of restricted PLMNs if they are already configured. Using the
PUT method on the same API end point, the EPC level configurations will be overwritten including the list of
restricted PLMNs. The list of restricted PLMNs is declared under the key "restricted_plmns" as in the following
example.

```json
{
  // ...
  "restricted_plmns": [
    {
      "mcc": "001",
      "mnc": "01"
    },
    {
      "mcc": "112",
      "mnc": "796"
    },
    {
      "mcc": "112",
      "mnc": "76"
    }
  ],
  // ...
}
```

MNC values can be 2 or 3 digits. The maximum number of PLMNs that can be restricted at the AGW is currently hardcoded as 10 and
the list will be truncated accordingly by the MME process during config initialization. If `restricted_plmns` is defined as an empty list
or the key is not defined, PUT operation would effectively remove any PLMN restrictions. MME process at AGW checks the PLMN portion of
IMSI during the attach procedure and if it matches to any PLMN in this restricted list, the attach request will be rejected and UE should
not attempt to reattach until it switches off and turn back on.

PLMN restrictions can be added, updated, or removed via NMS using the JSON editor and adding, editing, or removing `restricted_plmns` key according to the key hierarchy as below.

```json
"root":{
    "cellular":{
        "epc":{
            // ...
            "restricted_plmns":[
                0:{
                    "mcc":"001"
                    "mnc":"01"
                }
                1:{
                    "mcc":"112"
                    "mnc":"796"
                }
                2:{
                    "mcc":"112"
                    "mnc":"76"
                }
            ]
            // ...
        }
        // ...
    }
    // ...
}
```

## IMEI Restriction

IMEI restriction is configured in a similar vein as PLMN restrictions utilizing API end point `/lte/{network_id}/cellular/epc`. IMEI is represented as 14 digits with 8-digit Type Allocation Code (TAC) followed by 6-digit serial number (SNR). The check digit is omitted as it is derived from the other 14 digits. The restricted IMEIs are represented as a list of two key-value pairs (with keys `snr` and `tac`) or one key-value pair (with the key `tac`) under the key `restricted_imeis` as in the example below.

```json
{
  // ...
  "restricted_imeis": [
    {
      "snr": "176148",
      "tac": "01300600"
    },
    {
      "tac": "01300601"
    }
  ],
  // ...
}
```

If both TAC and SNR fields are defined, a specific hardware is blocked from accessing the network. If only the TAC field is defined, then all the devices with the same TAC (i.e., model and origin) are blocked. Unlike PLMN restriction there is no hard limitation on the length of the IMEI restriction list, but it is not advised to create a long list of restricted IMEIs and EPC configurations should not be treated as dynamic configurations as each time this list is modified, AGW services restart.

IMEI restrictions can be added, updated, or removed via NMS using the JSON editor and adding, editing, or removing `restricted_imeis` key according to the key hierarchy as below.

```json
"root":{
    "cellular":{
        "epc":{
            // ...
            "restricted_imeis":[
                0:{
                    "snr":"176148",
                    "tac":"01300600"
                }
                1:{
                    "tac":"01300601"
                }
            ]
            // ...
        }
        // ...
    }
    // ...
}
```

## Service Area/Tracking Area Restriction

Magma also supports a zone code based service area restriction in federated LTE deployments. To utilize this service restriction, network operators need to configure the following:

- HSS side: Up to 10 Regional Restriction Zone Codes for each subscriber.
- Magma side: Mapping between zone codes and lists of tracking area codes (TACs).

If the HSS does not provide any zone code in Update Location Answer for a subscriber, then no tracking area restriction is applied for the subscriber as the default behavior. On the other hand, if HSS provides a list of zone codes in Update Location Answer, then a subscriber can attain service only when it is currently located in a cell with TAC included in one of the HSS provided zone codes for the subscriber.

Zone codes in Magma are configured at the network level utilizing the API endpoint `/lte/{network_id}/cellular/epc`. An example configuration is shown below.

```json
{
  // ...
  "service_area_maps": {
    "1234": [10, 20],
    "1235": [10, 30, 40],
    "1236": [20, 40, 50, 60]
  },
  // ...
}
```

An important thing to note here is that the zone code used as the key (e.g., `1234`) is a string that corresponds to the decimal representation of the 2-octet zone code that is provided in the Regional-Restriction-Zone-Code AVP (e.g., `\x04D2`).

Service area restrictions can be added, updated, or removed via NMS using the JSON editor and adding, editing, or removing `service_area_maps` key according to the key hierarchy as below.

```json
"root":{
    "cellular":{
        "epc":{
            // ...
            "service_area_maps":{
              "1234":[
                0:10
                1:20
              ]
              "1235":[
                0:10
                1:30
                2:40
              ]
              "1236":[
                0:20
                1:40
                2:50
                3:60
              ]
            }
            // ...
        }
        // ...
    }
    // ...
}
```

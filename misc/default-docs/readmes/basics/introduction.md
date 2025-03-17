---
id: introduction
title: Introduction
hide_title: true
---
# Introduction

## What is Magma?

Magma is an [open-source](https://github.com/magma/magma/) software platform designed to provide a flexible, scalable, and cost-effective solution for building wireless networks, particularly LTE, 5G, and Wi-Fi networks. It allows researchers and operators to extend network coverage, reduce costs, and simplify network management.

Magma is designed to work in environments where traditional mobile network infrastructure is either too costly or complex to deploy, such as rural areas, private enterprise networks, and developing regions.

## What problem does it solve?

Magma addresses several key challenges in mobile networking:

- High Costs & Complexity:
    - Traditional mobile network infrastructure can be expensive and complex, requiring proprietary hardware and extensive expertise.
    - Magma allows operators to offer cellular service without vendor lock-in with a modern, open source core network, enabling operators to manage their networks more efficiently, with more automation, less downtime, better predictability and agility to add new services and applications.
- Limited Coverage:
    - Many areas, particularly rural or remote regions, lack sufficient mobile network coverage due to high deployment costs.
    - Magma enables federation with existing MNOs or new infrastructure providers for expanding rural infrastructure.
- Interoperability:
    - Magma provides an open and software-defined networking (SDN) approach, allowing integration with different radio access technologies (RAN) and core networks, allowing operators who are constrained with licensed spectrum to add capacity and reach by using Wi-Fi and CBRS.
- Edge Computing & Localized Networks:
    - Magma allows network operators to deploy local breakouts, reducing reliance on centralized cloud infrastructures.

## What technology does it implement?

Magma provides a lightweight mobile core network (EPC and 5GC) with a software-defined approach to simplify management and scaling. It includes:

- Access Gateway (AGW):
    - A software-based mobile core network supporting LTE and 5G core functions (MME, HSS, SGW, PGW, AMF, SMF, UPF). Provides network services and policy enforcement.
- Orchestrator (orc8r):
    - A cloud-based control plane for managing multiple AGWs remotely.
    - Enables metrics visualization, analytics and traffic flows trough the Magma NMS.
- Federation Gateway (FGW):
    - Allows integration with traditional mobile operator (MNO) cores using standard 3GPP interfaces and supports roaming scenarios.
    - It acts as a proxy between the Magma AGW and the operator's network and facilitates core functions, such as authentication, data plans, policy enforcement, and charging to stay conformant with an existing MNO network and the expanded network with Magma.
- Subscriber Management (NMS):
    - Provides an easy way to manage users, SIMs, and policies.

The figure below shows the high-level Magma architecture. Magma is designed to be 3GPP generation and access network (cellular or WiFi) agnostic. It can flexibly support a radio access network with minimal effort.

![Magma architecture diagram](../assets/magma_overview.png?raw=true "Magma Architecture")

## What Technology Does It Use?

Magma leverages a variety of modern technologies to implement its solutions:

- Containerization & Orchestration:
    - Uses Docker and Kubernetes for deployment and scalability in a microservice based architecture.
- Bazel:
    - A build system developed and maintained by Google for efficiently compiling, testing and managing dependencies.
- gRPC & Protobuf:
    - Used for fast and secure communication between components.
- Linux & Open-Source Networking Stack:
    - Uses components like Open vSwitch (OVS) for network forwarding.
- Cloud & Edge Computing:
    - Designed to run in public clouds (AWS, GCP) and on-premises edge devices.
    - Allows installation in baremetal embedded system with ARM architecture.
- C++, Python & Go:
    - The main programming languages used in development.
    - Multiple language equals multiple opportunities to contribute.

## Community

Join the [Magma Slack channel](https://magmacore.slack.com/) and interact with our active community.

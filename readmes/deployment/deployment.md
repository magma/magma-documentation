# Deployment

## Introduction
This document provides an overview of deploying Magma. It covers the three main deployment modes - Kubernetes, Docker, and Baremetal. This page serves as a starting point for deployers aiming to set up Magma for operational use.

## Main Deployment Modes
Magma can be deployed using three primary modes, each suited to different scales and technical proficiencies. Below is an overview of these modes to help you choose the right approach for your needs.

### 1. Docker
**Overview**: Docker provides a lightweight, containerized approach for simpler deployments, often used for testing or small to medium-scale setups. It is accessible for deploying components like AGW or Federation Gateway (FEG).
- **Use Case**: Ideal for pilot projects, lab environments, or deployments with 50-200 users.
- **Expertise Required**: Beginner to intermediate; basic understanding of containerization is helpful.
- **Benefits**: Easy to set up, portable, and resource-efficient.
- **Challenges**: Limited scalability compared to Kubernetes; may require manual scaling.
- **Relevant Guides**: Refer to component-specific Docker deployment guides below.

### 2. Kubernetes
**Overview**: Kubernetes is ideal for medium to large-scale deployments requiring high availability and scalability. It is commonly used for the Orchestrator (Orc8r) to manage multiple Access Gateways (AGWs) across distributed environments.
- **Use Case**: Suitable for campus networks or regional operators managing hundreds to thousands of users.
- **Expertise Required**: Advanced; requires familiarity with cluster management and orchestration tools.
- **Benefits**: Offers robust scaling, automated recovery, and centralized management.
- **Challenges**: Complex setup and maintenance; higher resource demands.
- **Relevant Guides**: See specific component deployment guides under each component section for Kubernetes options.

### 3. Baremetal
**Overview**: Baremetal deployment involves installing Magma components directly on physical or virtual servers, offering maximum performance for small-scale or high-performance needs. It is often used for AGW in constrained environments.
- **Use Case**: Best for small enterprises, rural setups, or edge locations with minimal infrastructure.
- **Expertise Required**: Intermediate; requires knowledge of system administration and manual configuration.
- **Benefits**: High performance, cost-effective for small setups, full control over hardware.
- **Challenges**: Lacks automated scaling and recovery; manual updates and maintenance.
- **Relevant Guides**: Check component-specific Baremetal installation guides in the sections below.

## Magma Components Overview
Magma consists of several key components, each with specific roles in the network architecture. Below is a summary of each component, with links to detailed technical references and deployment guides for each deployment mode where applicable.

### Orchestrator (Orc8r)
**Overview**: The Orchestrator is the central management system for Magma, handling configuration, monitoring, and policy enforcement across the network. It is critical for managing multiple AGWs and integrating with external systems.
- **Technical Reference**: [Orchestrator Architecture](../orc8r/architecture_overview.md)
- **Deployment Guides**:
  - **Kubernetes**: [Deploying Orc8r with Juju (Unmaintained)](../orc8r/deploy_using_juju.md) :warning:
  - **Baremetal**: [Baremetal Installation](../orc8r/deploy_install.md)
  - **Additional Guides**: [Ansible Deployment](../orc8r/deploy_using_ansible.md), [Terraform Options](../orc8r/deploy_terraform_options.md), [FAQ](../orc8r/deploy_faq.md)

### Network Management System (NMS)
**Overview**: The NMS provides a user-friendly interface for network operators to monitor, configure, and manage Magma networks, offering dashboards for traffic, subscribers, and alerts.
- **Technical Reference**: [NMS Architecture](../nms/architecture_overview.md)
- **Deployment Guides**:
  - **General**: [NMS Setup](../nms/deploy_setup.md)

### Access Gateway (AGW)
**Overview**: The Access Gateway manages radio access and core network functions, serving as the primary interface for user equipment (UE) in LTE and 5G networks. It handles traffic routing and policy enforcement at the edge.
- **Technical Reference**: [Access Gateway Architecture](../lte/readme_agw.md)
- **Deployment Guides**:
  - **Docker**: [AGW Docker Installation](../lte/deploy_install_docker.md)
  - **Baremetal**: [AGW Baremetal Installation](../lte/deploy_install.md)
  - **Kubernetes**: [Deploy AGW with Juju (Unmaintained)](../lte/deploy_agw_using_juju.md) :warning:
  - **Additional Guides**: [Build and Install Magma Package on AGW](../lte/build_install_magma_pkg_in_agw.md)

### Federation Gateway (FEG)
**Overview**: The Federation Gateway enables roaming and interconnection with external networks, facilitating partnerships with other operators for seamless user connectivity across different network domains.
- **Technical Reference**: [Federation Gateway Architecture](../feg/architecture_overview.md)
- **Deployment Guides**:
  - **Docker**: [FEG Docker Deployment](../feg/docker.md)
  - **Baremetal**: [FEG Installation](../feg/deploy_install.md)
  - **Additional Guides**: [FEG Introduction](../feg/deploy_intro.md), [Build FEG](../feg/deploy_build.md)

## Choosing the Right Deployment Mode
- **Scale**: For small-scale (under 50 users), Baremetal or Docker is sufficient; for medium to large-scale (hundreds to thousands of users), Kubernetes offers better scalability.
- **Use Case**: Edge or rural deployments may favor Baremetal for performance; federated networks with roaming needs require FEG; centralized management benefits from Kubernetes for Orc8r.
- **Expertise**: Beginners may start with Docker for ease; advanced users can leverage Kubernetes for robustness; Baremetal suits those comfortable with system-level configuration.

## Community Contributions
Deployment strategies evolve with community input. We encourage deployers to share their setups, challenges, and solutions on [GitHub](https://github.com/magma/magma) or [Slack](https://magma-developers.slack.com/) to enhance this knowledge base. For contributing guidelines, see [Contributing to Magma](../contributing/contribute_github.md).

## Next Steps
After identifying the appropriate deployment mode and components for your needs, refer to the specific guides linked above for detailed instructions. For troubleshooting deployment issues, consult the [Debugging Section](../howtos/troubleshooting/agw_healthcheck.md) for common problems and solutions.

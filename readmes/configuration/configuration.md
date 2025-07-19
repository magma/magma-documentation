# Configuration Overview

This document provides an overview of the configuration process for various components of the Magma platform. Proper configuration is crucial for ensuring optimal performance, security, and compatibility across your deployment.

## Introduction

Configuration in Magma involves setting up parameters for different components such as the Access Gateway (AGW), Orchestrator (Orc8r), Network Management System (NMS), and Federation Gateway (FEG). Each component has specific configuration needs that must be addressed to ensure seamless operation. Configuration tasks typically include defining network settings, integrating with external systems, managing user access, and optimizing performance through specific parameter tuning.

Configuration in Magma can be performed through various methods including configuration files, the Magma NMS (Network Management System) UI, and API calls. Understanding the specific requirements of your deployment environment—whether it's a small-scale test setup or a large-scale production network—will guide the configuration process.

## Key Configuration Areas

- **Access Gateway (AGW):** Configuring network settings, high availability, and specific features like 5G support.
- **Orchestrator (Orc8r):** Setting up Thanos for metrics and other cloud service configurations.
- **Network Management System (NMS):** Managing organizational settings and user permissions.
- **Federation Gateway (FEG):** Configuring federation parameters for integration with other networks.

## Configuration Methods and Tools

### 1. Configuration Files

Many Magma components rely on YAML or JSON configuration files to define operational parameters. These files are typically located in directories such as `/etc/magma/` or `/var/opt/magma/configs/` on the respective hosts (AGW or Orc8r VMs). Key configuration files include:

- **`control_proxy.yml`**: Manages communication settings between the gateway and the Orchestrator.

### 2. Network Management System (NMS) UI

The NMS provides a user-friendly interface for configuring network-wide settings, gateway parameters, and subscriber policies. Key configuration tasks in the NMS include:

- **Network Configuration**: Setting up EPC (Evolved Packet Core) and RAN (Radio Access Network) parameters such as bandwidth, frequency bands (TDD/FDD), and authentication settings under the 'Network' tab.
- **Gateway Configuration**: Registering and configuring AGWs, including setting up high availability and specific LTE parameters.
- **Subscriber Management**: Defining subscriber profiles and policies for traffic management.

Access the NMS via a web browser using the Orchestrator's URL (typically `https://<orc8r-host>/nms`) and log in with administrative credentials to make configuration changes.

### 3. API and Swagger Interface

For advanced users and automation, Magma offers RESTful APIs to configure components programmatically. The Swagger UI, accessible through the Orchestrator, provides a detailed interface to explore and execute API calls for tasks like:

- Configuring roaming settings for federation networks.
- Updating gateway configurations.
- Managing alert rules and receivers.

### 4. Command-Line Tools

Certain configurations, especially on the AGW, can be managed via command-line scripts provided by Magma. For instance, `config_cli.py` can be used to set log levels or other runtime parameters without editing files directly.

## Best Practices for Configuration

- **Backup Configurations**: Always back up existing configuration files before making changes to prevent loss of working settings. Store backups in a secure location.
- **Document Changes**: Maintain a log of configuration changes, especially for production environments, to track what was changed and why.
- **Test in Staging**: For critical deployments, test configuration changes in a staging environment before applying them to production to minimize risks of downtime.
- **Use Version Control**: If possible, manage configuration files in a version control system to track changes over time and roll back if necessary.
- **Validate Settings**: After applying configurations, validate them by checking logs (e.g., using `journalctl -fu magma@magmad` on AGW) to ensure services are running as expected without errors.

## Common Configuration Challenges

- **Connectivity Issues**: Misconfigured network settings or IP addresses in `control_proxy.yml` can prevent AGWs from checking into the Orchestrator. Ensure correct IP addresses and ports are specified.
- **Service Restarts**: Forgetting to restart services after configuration changes can lead to settings not taking effect. Always restart relevant services like `magmad` or specific component services.
- **API Authentication Errors**: When using the API, ensure correct authentication tokens or credentials are used to avoid access denied errors.
- **Parameter Conflicts**: Inconsistent settings across components (e.g., mismatched PLMN IDs between AGW and Orc8r) can cause operational issues. Cross-check settings for consistency.

## Component-Specific Configuration Highlights

### Access Gateway (AGW)

- **High Availability (HA)**: Configure AGW for HA by setting up primary and secondary gateways with appropriate network interface configurations in AWS or other environments. Modify `mme.yml` to enable HA features.
- **5G NSA Support**: Enable 5G Non-Standalone (NSA) support by ensuring relevant parameters are set in the LTE network configuration through NMS or API.

### Orchestrator (Orc8r)

- **Metrics with Thanos**: Configure Thanos for long-term metrics storage by updating relevant configuration files or using the NMS to set retention policies and storage options.
- **Service Registry**: Ensure service registry configurations in `service_registry.yml` are accurate to manage inter-service communications.

### Network Management System (NMS)

- **User Roles**: Configure user permissions (superuser, user, readonly) under the 'Admin' section to control access to configuration capabilities.
- **Organizations**: Set up organizational structures to manage multiple networks or tenants effectively within the NMS.

### Federation Gateway (FEG)

- **Roaming Configurations**: Use the Swagger API to configure S6a and S8 interfaces for roaming partnerships, ensuring correct routing based on PLMN IDs.
- **Integration Settings**: Define parameters for integration with external HSS and PGW systems to handle federated subscribers.

Navigate through the subcategories in the sidebar for detailed configuration guides for each component. These guides provide step-by-step instructions tailored to specific use cases and deployment scenarios.

---
id: version-1.0.0-setup
title: CWAG Setup
sidebar_label: Setup
hide_title: true
original_id: setup
---
# Carrier Wifi Access Gateway (CWAG) Setup

> **Note**: Vagrant-based CWAG setup has been deprecated. Please use Docker-based deployment.

### Prerequisites

To develop and manage a Magma CWAG using Docker, you must have the following installed:

- Docker and Docker Compose
- Ansible (for configuration)

### Steps

To bring up a Carrier Wifi Access Gateway (CWAG) using Docker, follow the [AGW Docker deployment guide](../deployment/agw/docker.md).

Quick start:

```bash
HOST [magma/cwf/gateway]$ cd cwf/gateway/deploy
HOST [magma/cwf/gateway/deploy]$ ./agw_docker_install.sh
```

For more details, see:
- [Quick Start Guide](../basics/quick_start_guide.md)
- [AGW Docker Deployment](../deployment/agw/docker.md)
---
id: version-1.0.0-setup
title: AGW Setup
sidebar_label: Setup
hide_title: true
original_id: setup
---
# Access Gateway Setup

> **Note**: Vagrant-based AGW setup has been deprecated. Please use Docker-based deployment.

### Prerequisites

To develop and manage a Magma AGW using Docker, you must have the following installed:

- Docker and Docker Compose
- Ansible (for configuration)

### Steps

To bring up an Access Gateway (AGW) using Docker, follow the [AGW Docker deployment guide](../deployment/agw/docker.md).

Quick start:

```bash
HOST [magma/lte/gateway]$ cd lte/gateway/deploy
HOST [magma/lte/gateway/deploy]$ ./agw_docker_install.sh
```

Once the Access Gateway is running successfully, proceed to attaching the eNodeB.

For more details, see:
- [Quick Start Guide](../basics/quick_start_guide.md)
- [AGW Docker Deployment](../deployment/agw/docker.md)
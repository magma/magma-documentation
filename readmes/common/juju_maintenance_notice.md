---
id: juju_maintenance_notice
title: Juju Deployment Maintenance Notice
hide_title: true
---

# Juju Deployment Maintenance Notice

## Call for Contributors & Alternatives

**Juju-based deployment is currently unmaintained.**

The Juju scripts are retained for legacy and ecosystem reasons but are **not actively maintained by the core team**.  
Community contributors are encouraged to help maintain and modernize them.

If you are interested in contributing or tracking the status of Juju scripts, please engage via:
- [**GitHub Issue #15763**](https://github.com/magma/magma/issues/15763) (canonical tracking issue)
- [Magma Slack channels](https://magmacore.slack.com/)

### Supported Deployment Alternatives (Recommended)

For a supported and actively maintained deployment experience, please use:
- **AGW Docker Install** – for Access Gateway deployment
- **Magma Deployer** – the modern, container-based deployment repository

### Comparison

| Feature | Juju Deployment | Container / Deployer Based |
|-------|-----------------|----------------------------|
| **Status** | Unmaintained (Legacy) | **Active / Recommended** |
| **Maintenance** | Community (Needed) | Core Team & Community |
| **Scalability** | Variable | High |
| **Portability** | Juju-dependent | Universal (Docker / K8s) |

> Juju scripts are being tracked and discussed under [**Issue #15763**](https://github.com/magma/magma/issues/15763), which supersedes the earlier deprecation proposal ([#15755](https://github.com/magma/magma/issues/15755)).

---

*This notice applies to all Juju-based deployment guides in the Magma documentation.*

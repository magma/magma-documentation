---
id: 06_destroying_the_env
title: 7. Destroying the environment
hide_title: true
---

:::warning
**UNMAINTAINED STATUS**: This Juju-based deployment guide is **UNMAINTAINED**.
The scripts may not work with newer Juju versions or the current Magma architecture.
Juju scripts currently live in the `magma/magma` repository. Their proposed migration to the [deployer repository](https://github.com/magma/magma-deployer) is pending TSC consensus and a vote.
:::

# 7. Destroying the environment

Destroy the Juju controller:

```console
juju kill-controller -y aws-us-east-2
```

Destroy the AWS resources:

```console
eksctl delete cluster --name magma-orc8r
aws ec2 terminate-instances --instance-ids <Magma Access Gateway instance ID> <srsRAN instance ID>
aws ec2 delete-network-interface --network-interface-id <Magma Access Gateway network interface ID>
aws ec2 delete-network-interface --network-interface-id <srsRAN network interface ID>
aws ec2 delete-subnet --subnet-id <S1 subnet ID>
aws ec2 delete-security-group --group-id <your security group ID>
```

## Call for Contributors & Alternatives

**Juju-based deployment is currently unmaintained.**

The Juju scripts are retained for legacy and ecosystem reasons but are **not actively maintained by the core team**.  
Community contributors are encouraged to help maintain and modernize them.

If you are interested in contributing or tracking the status of Juju scripts, please engage via:
- **GitHub Issue #15763** (canonical tracking issue)
- Magma Slack channels

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

> Juju scripts are being tracked and discussed under **Issue #15763**, which supersedes the earlier deprecation proposal (#15755).


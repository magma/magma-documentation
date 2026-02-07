---
id: 01_getting_started
title: 1. Getting Started
hide_title: true
---

:::warning
**UNMAINTAINED STATUS**: This Juju-based deployment guide is **UNMAINTAINED**.
The scripts may not work with newer Juju versions or the current Magma architecture.
Juju scripts currently live in the `magma/magma` repository. Their proposed migration to the [deployer repository](https://github.com/magma/magma-deployer) is pending TSC consensus and a vote.
:::

# 1. Getting Started

We will start by login in with AWS, creating resources that will be needed throughout the tutorial
and bootstrapping a Juju controller.

## Login to AWS

Login to AWS using the AWS CLI:

```console
aws configure
```

You will be asked to provide your AWS credentials and the region. The rest of this tutorial assumes
that the region is `us-east-2`.

## Create AWS resources

### Create a security group

Create a security group in your default AWS VPC:

```console
aws ec2 create-security-group --group-name "magma" --description "Allow All" --vpc-id <your VPC ID>
```

Note the `GroupId` and use it to add a wildcard rule:

```console
aws ec2 authorize-security-group-ingress --group-id <security group ID> --protocol -1 --port -1 --cidr 0.0.0.0/0
```

### Create a subnet

Create a subnet called **S1**:

```console
aws ec2 create-subnet --vpc-id <your VPC ID> --cidr-block 172.31.126.0/28 --availability-zone us-east-2a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=s1}]'
```

Make sure to use a `cidr-block` that fits into your default VPC's block.

Note the `SubnetId`. You will need it to complete this tutorial.

## Bootstrap a Juju controller on AWS

Bootstrap a Juju controller on AWS:

```console
juju bootstrap aws/us-east-2
```

## Call for Contributors & Alternatives

> **📢 For detailed information about the maintenance status, supported alternatives, and how to contribute, please see the [Juju Deployment Maintenance Notice](../common/juju_maintenance_notice.md).**
>
> **Related GitHub Issues:**
> - [Issue #15763](https://github.com/magma/magma/issues/15763) – Canonical tracking issue for Juju scripts
> - [Issue #15755](https://github.com/magma/magma/issues/15755) – Earlier deprecation proposal (superseded)

---
id: quick_start_guide
title: Quick Start Guide
hide_title: true
---
# Quick Start Guide

The quick start guide is for developing on Magma or just trying it out. Follow
the deployment guides under Orchestrator and Access Gateway if you are
installing Magma for a production deployment.

With the [prereqs](prerequisites.md) installed, we can now set up a minimal
end-to-end system on your development environment. In this guide, we'll start
by running the LTE access gateway (via Docker) and orchestrator cloud, and then
register your local access gateway with your local cloud for management.

> **Note**: Vagrant-based development has been deprecated. Please use the
> Docker-based AGW deployment. See the [AGW Docker deployment guide](../deployment/agw/docker.md)
> for the latest instructions.

## Provisioning the environment

Go ahead and open up 2 fresh terminal tabs.

### Terminal Tab 1: Provision the AGW (Docker)

The development environment can use Docker to run the Access Gateway. See the
[AGW Docker deployment](../deployment/agw/docker.md) for detailed instructions.

For quick setup:

```bash
HOST [magma]$ cd lte/gateway/deploy
HOST [magma/lte/gateway/deploy]$ ./agw_docker_install.sh
```

### Terminal Tab 2: Build Orchestrator

Here, we'll be building the Orchestrator docker containers.

```bash
HOST [magma]$ cd orc8r/cloud/docker
HOST [magma/orc8r/cloud/docker]$ ./build.py --all
```

## Initial Run

### Terminal Tab 2: Start Orchestrator

Once the Orchestrator build finishes, we can start the development Orchestrator
cloud for the first time.

To start Orchestrator (without metrics):

```bash
HOST [magma/orc8r/cloud/docker]$ ./run.py

Creating orc8r_postgres_1 ... done
Creating orc8r_test_1     ... done
Creating orc8r_maria_1    ... done
Creating elasticsearch    ... done
Creating fluentd          ... done
Creating orc8r_kibana_1   ... done
Creating orc8r_proxy_1      ... done
Creating orc8r_controller_1 ... done
```

If you want to run everything, including metrics, run:

```bash
HOST [magma/orc8r/cloud/docker]$ ./run.py --metrics
```

The Orchestrator application containers will bootstrap certificates on startup
which are cached for future runs. Watch the directory `magma/.cache/test_certs`
for a file `admin_operator.pfx` to show up (this may take a minute or two).

```bash
HOST [magma/orc8r/cloud/docker]$ ls ../../../.cache/test_certs

admin_operator.key.pem  bootstrapper.key        controller.crt          rootCA.key
admin_operator.pem      certifier.key           controller.csr          rootCA.pem
admin_operator.pfx      certifier.pem           controller.key          rootCA.srl
```

The owner and group of `admin_operator.key.pem` and `admin_operator.pfx` in `/magma/.cache/test_certs/` are `root`.
You need to change ownership of these files to your user with `chown`, e.g.

```bash
HOST [magma/orc8r/cloud/docker] sudo chown ${USER}:${USER} ../../../.cache/test_certs/admin_operator.key.pem
HOST [magma/orc8r/cloud/docker] sudo chown ${USER}:${USER} ../../../.cache/test_certs/admin_operator.pfx
```

then:

```bash
HOST [magma/orc8r/cloud/docker]$ open ../../../.cache/test_certs
```

In the Finder window that pops up, double-click `admin_operator.pfx` to add the
local client cert to your keychain. *The password for the cert is magma*.
In some cases, you may have to open up the Keychain app in MacOS and drag-drop
the file into the login keychain if double-clicking doesn't work.

If you use Firefox, you'll have to import this .pfx file into your browser's
installed client certificates. See [here](https://support.globalsign.com/customer/en/portal/articles/1211486-install-client-digital-certificate---firefox-for-windows)
for instructions. If you use Chrome or Safari, you may have to restart the
browser before the certificate can be used.

After starting the Orchestrator with `HOST [magma/orc8r/cloud/docker]$ ./run.py`
and importing `admin_operator.pfx`, you should be able to visit the Swagger UI
at [https://localhost:9443/swagger/v1/ui](https://localhost:9443/swagger/v1/ui).
Note that your browser may refuse to accept the server certificate from
`localhost:9443`. Firefox and Safari will let you override this warning. Chrome
will also let you [bypass the warning if you type `thisisunsafe`](https://www.technipages.com/google-chrome-bypass-your-connection-is-not-private-message).

### Register Your AGW with Orchestrator

Register your Docker-based AGW with Orchestrator:

```bash
HOST [magma]$ cd lte/gateway
HOST [magma/lte/gateway]$ fab register-agw
```

Wait a minute or 2 for the changes to propagate, then you can verify that things are working:

```bash
HOST [magma/lte/gateway]$ docker exec -it magma_control /bin/bash

MAGMA-CONTROL$ sudo service magma@* stop
MAGMA-CONTROL$ sudo service magma@magmad start
MAGMA-CONTROL$ sudo tail -f /var/log/syslog

# After a minute or 2 you should see these messages:
Sep 27 22:57:35 magma-dev magmad[6226]: [2018-09-27 22:57:35,550 INFO root] Checkin Successful!
Sep 27 22:57:55 magma-dev magmad[6226]: [2018-09-27 22:57:55,684 INFO root] Processing config update g1
```

## Using the NMS UI

Magma provides an UI for configuring and monitoring the networks. To set up
the NMS to talk to your local Orchestrator:

```bash
HOST [magma]$ cd nms
HOST [magma/nms] $ COMPOSE_PROJECT_NAME=magmalte docker compose --compatibility build magmalte
HOST [magma/nms] $ docker compose --compatibility up -d
HOST [magma/nms] $ ./scripts/dev_setup.sh
```

After this, you will be able to access the UI by visiting
[https://magma-test.localhost](https://magma-test.localhost), and using the email `admin@magma.test`
and password `password1234`. We recommend Firefox or Chrome. If you see Gateway Error 502, don't worry, the
NMS can take upto 60 seconds to finish starting up.
Note that you will only see a network if you connected your local LTE gateway as described above.

`magma-test` is the default organization.
Organizations are managed at [host.localhost](https://host.localhost)
where you can log in with the same credentials.

## Additional Resources

- For detailed AGW Docker deployment, see [AGW Docker deployment guide](../deployment/agw/docker.md)
- For testing LTE features without cloud-based network management, see [S1AP integration tests](../lte/s1ap_tests.md)
- For connecting a physical eNB and UE device, see the [Connecting a physical eNodeb and UE device to gateway](../lte/dev_notes.md#connecting-a-physical-enodeb-and-ue-to-gateway-vm) section.
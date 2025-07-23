# Setup guide for Contributing to Magma's NMS

Magma is an open-source platform that helps network operators build flexible and modern mobile networks. This guide focuses on setting up the NMS (Network Management System) part of Magma for development using Git and Docker.

# Part 1: Deploying Orc8r Backend (Required for NMS)
> ⚠️ **Note**  
> Before deploying the NMS (Network Management System), you must first deploy the Orc8r backend services.   
> The NMS depends on Orc8r to provide backend APIs, authentication, and core orchestration.

## Step 1: Build the Orc8r Backend Docker Artifacts

Magma's backend (Orc8r) requires a specific build step involving Docker containers.

Run the build script from the orc8r/cloud/docker directory:

```bash
cd orc8r/cloud/docker
./build.py --all
```

**Successful Orc8r build output**  
```
Build Log

[x] Building 4/4
  [x] test: Built (0.05s)
  [x] nginx: Built (0.05s)
  [x] fluentd: Built
  [x] controller: Built (0.05s)
```
*Caption: Terminal output confirming the successful build of Orc8r Docker artifacts.*

## Step 4: Start Orc8r Backend Containers

From the `orc8r/cloud/docker/` directory, start the containers:

```bash
./run.py --metrics
```

Or use Docker Compose:

```bash
docker-compose up -d
```

**Orc8r containers running**  
```
Docker Build Log

Creating Containers:
  [x] orc8r_maria_1: done
  [x] elasticsearch: done
  [x] orc8r_postgres_1: done
  [x] orc8r_postgres_test_1: done
  [x] orc8r_test_1: done
  [x] fluentd: done
  [x] orc8r_kibana_1: done
  [x] orc8r_controller_1: done
  [x] orc8r_nginx_1: done
```  
*Caption: Terminal output showing active Orc8r services (e.g., controller, nginx, postgres).*

# Part 2: Deploying NMS Frontend
> ⚠️ **Note**  
> Orc8r must be running before starting this section.

## Step 1: Build and Run the NMS Docker Containers

Navigate to the NMS directory:

```bash
cd ../../../nms
```

Build the NMS Docker image:

```bash
COMPOSE_PROJECT_NAME=magmalte docker compose --compatibility build magmalte
```
**NMS Docker image build**  
```
Docker Export Log
Building:
[x] magmalte: Built
```
*Caption: Terminal output confirming the successful build of the NMS Docker image.*

Start the NMS containers:

```bash
docker compose --compatibility up -d
```

**Image 4: NMS containers running**  
```
Docker NMS Build Log
Running 6/6:
  [x] magmalte: Built
  [x] Network nms_default: Created
  [x] Volume "nms_nms-db": Created
  [x] Container nms_magmalte_1: Started
  [x] Container nms_nginx-proxy_1: Started
  [x] Container nms_postgres_1: Started
```
*Caption: Terminal output confirming the NMS containers are up and running.*

## Step 2: Set the Admin User Password (First-Time Setup)

Configure the admin password for the NMS:

```bash
docker compose exec magmalte yarn setAdminPassword host admin@magma.test password1234
```
You can modify the email and password as needed later.

**Admin user password setup**  
```
Action:
- Creating a new user: email-admin@magna.test

Result:
- Success
- Done in 12.485 seconds
``` 
*Caption: Terminal output confirming the successful setup of the NMS admin user password.*

## Step 3: Verify Orc8r is Running

Check the status of Orc8r containers:

```bash
cd orc8r/cloud/docker
docker-compose ps
```
You should see active containers like nginx, controller, fluentd, and postgres.

## Step 4: (Optional) Start Prometheus and Grafana for Metrics

Start Prometheus and Grafana:

```bash
docker-compose -f docker-compose.metrics.yml up -d
```

Ensure the `docker-compose.metrics.yml` includes:

```yaml
networks:
  default:
    external:
      name: orc8r_default
```

**Prometheus and Grafana metrics**  
```
Creating Containers:
  [x] orc8r_prometheus-cache_1: done
  [x] orc8r_prometheus_1: done
  [x] orc8r_alertmanager-configurer_1: done
  [x] orc8r_user-grafana_1: done
  [x] orc8r_prometheus-configurer_1: done
  [x] orc8r_alertmanager_1: done
```  
*Caption: Terminal output confirming the Prometheus and Grafana containers are up and running.*

## Step 5: Access the Web Portals

- **Host Portal**: Manage organizations at `http://host.localhost:8081/host`  
  Credentials:  
  - Email: `admin@magma.test`  
  - Password: `password1234`

- **Admin Portal**: Manage users at `http://magma-test.localhost:8081/admin`  
  Credentials (after creating a superuser):  
  - Email: `super@magma.test`  
  - Password: `pass1234`

## Final Notes

- Monitor metrics at `http://localhost:9090/targets`.
- Customize credentials for security in production-like setups.

---
[![NMS containers status](https://img.youtube.com/vi/sKfn0KHmxdU/0.jpg)](https://youtu.be/sKfn0KHmxdU)
---

# Easy Git and Docker Setup for Contributing to Magma's NMS

Magma is an open-source platform that helps network operators build flexible and modern mobile networks. This guide focuses on setting up the NMS (Network Management System) part of Magma for development using Git and Docker.

## Introduction

This guide breaks it down into simple steps, including:
- Forking and cloning the repo
- Keeping your code up to date
- Building and running backend services with Docker
- Accessing the NMS portals


## Step 1: Fork and Clone the Repository

The first step is straightforward but essential.
You should have already forked the Magma repository to your own GitHub account. For example:
```bash
https://github.com/username/magma.git
```

Now, clone your fork locally:

```bash
git clone https://github.com/username/magma.git
cd magma
```

## Step 2: Keep Your Fork Updated

To pull in the latest changes from the official Magma repo, add the main repository as an upstream remote:

```bash
git remote add upstream https://github.com/magma/magma.git
```

Verify your remotes:

```bash
git remote -v
```

This setup helps you sync your fork with the original repository regularly.

## Step 3: Build the Orc8r Backend Docker Artifacts

Magma's backend (Orc8r) requires a specific build step involving Docker containers.

### Important Note on Ruby Gem Compatibility

You might encounter compatibility errors with Ruby gems during this step. 
Here's a recommended fix:
- Navigate to the Fluentd Dockerfile path:

```bash
cd magma/orc8r/cloud/docker/fluentd
```
- Modify the Dockerfile from:

```dockerfile
FROM fluent/fluentd:v1.14.6-debian-1.0
USER root
  RUN gem install \
  elasticsearch:7.13.0 \
  fluent-plugin-elasticsearch:5.2.1 \
  fluent-plugin-multi-format-parser:1.0.0 \
  --no-document
USER fluent
```

- To this updated version:

```dockerfile
FROM fluent/fluentd:v1.14.6-debian-1.0
USER root
  RUN gem install rubygems-update -v 3.2.33 --no-document && \
  update_rubygems && \
  gem install multi_json -v 1.15.0 --no-document && \
  gem install elasticsearch -v 7.13.0 --no-document && \
  gem install fluent-plugin-elasticsearch -v 5.2.1 --no-document && \
  gem install fluent-plugin-multi-format-parser -v 1.0.0 --no-document
USER fluent
```

Then run the build script from the orc8r/cloud/docker directory:

```bash
cd orc8r/cloud/docker
./build.py --all
```

**Image 1: Successful Orc8r build output**  
![Orc8r build output](/readmes/assets/nms/setupguide/1.png)  
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

**Image 2: Orc8r containers running**  
![Orc8r containers status](/readmes/assets/nms/setupguide/2.png)  
*Caption: Terminal output showing active Orc8r services (e.g., controller, nginx, postgres).*

## Step 5: Build and Run the NMS Docker Containers

Navigate to the NMS directory:

```bash
cd ../../../nms
```

Build the NMS Docker image:

```bash
COMPOSE_PROJECT_NAME=magmalte docker compose --compatibility build magmalte
```
**Image 3: NMS Docker image build**  
![NMS build output](/readmes/assets/nms/setupguide/3.png)  
*Caption: Terminal output confirming the successful build of the NMS Docker image.*

Start the NMS containers:

```bash
docker compose --compatibility up -d
```

**Image 4: NMS containers running**  
![NMS containers status](/readmes/assets/nms/setupguide/4.png)  
*Caption: Terminal output confirming the NMS containers are up and running.*

## Step 6: Set the Admin User Password (First-Time Setup)

Configure the admin password for the NMS:

```bash
docker compose exec magmalte yarn setAdminPassword host admin@magma.test password1234
```
You can modify the email and password as needed later.

**Image 5: Admin user password setup**  
![Admin password setup](/readmes/assets/nms/setupguide/5.png)  
*Caption: Terminal output confirming the successful setup of the NMS admin user password.*

## Step 7: Verify Orc8r is Running

Check the status of Orc8r containers:

```bash
cd orc8r/cloud/docker
docker-compose ps
```
You should see active containers like nginx, controller, fluentd, and postgres.

## Step 8: (Optional) Start Prometheus and Grafana for Metrics

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

**Image 6: Prometheus and Grafana metrics**  
![Metrics containers status](/readmes/assets/nms/setupguide/6.png)  
*Caption: Terminal output confirming the Prometheus and Grafana containers are up and running.*

## Step 9: Access the Web Portals

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
- Regularly sync your fork with `git fetch upstream` and `git merge upstream/main` to avoid conflicts.
- Customize credentials for security in production-like setups.
![NMS containers status](/readmes/assets/nms/setupguide/nms.gif)  

---
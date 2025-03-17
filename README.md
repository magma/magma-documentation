# Magma user-docs

> [!NOTE]
> This repo serves as a temporary place to work on changes for the [Magma Project](https://github.com/magma/magma/) documentation. Join discussions in [Magma Project Slack channel](https://magmacore.slack.com), under the `docs-training-and-cert`.

## Structure

Magma documentation framework uses the [Docussaurus](https://docusaurus.io/) application to serve markdown as HTML to the general public. It is intended to contain easy to understand instructions on installing Magma core, as well as reference on components and common troubleshooting procedures to enable a quick familiarization with the project and increase the number of users and active developers to the project.

Currently the files of interest are situated at `src/default-docs` directory. There, we have:

- `docussaurus`: configuration files for the Docussaurus application. Versioned docs are inside this directory.
- `readmes`: current documentation files being worked on.

## Prerequisites

The below application must be installed to ensure a better contribution experience.

- [git](https://git-scm.com/downloads) or [GitHub Desktop](https://desktop.github.com/download/)
- [Docker engine](https://docs.docker.com/engine/) and [docker compose](https://docs.docker.com/compose/)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [pre-commit](https://pre-commit.com/)

## Deployment

### Development

In order to deploy the Docussaurus instance locally with the magma documentation, execute the commands below:

```sh
cd magma-documentation
docker compose up docusaurus-dev
```

This will initialize the Docussaurus application inside a docker container with the proper configurations and documents. The service will be running as a daemon, in the background, and exposed trough the `http://localhost:3000` url, with hot-reloading enabled.

In order to stop the Docussaurus container, execute the command below:

```sh
docker compose down
```

If any building procedure fails, it is possible to clean the cached files running the command below:

```sh
docker compose down --rmi all --remove-orphans
```

If you also want to remove the volumes, add the flag `-v`/`--volumes` to the command above.


> [!NOTE]
> For more development information, please refer to the [development notes](./src/development-notes.md) and official [Docussaurus documentation](https://docusaurus.io/docs).

### Production

> To be done.

```sh
cd magma-documentation
docker compose up docusaurus-prod
```
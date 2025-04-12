---
id: version-1.X.X-documentation_development
sidebar_label: Configurations
title: Documentation Development
hide_title: true
original_id: documentation_development
---
# Development
## Local installation
> This is required to run the documentation locally and other commands like the translation commands.

Due to some issues with the `npm install` command, it is recommended to use `yarn` instead. To install `yarn` run the following command:
```sh
npm install -g yarn
```
Then run the following command to install the dependencies (at `./magma-documentation`):
```sh
yarn install
```

> [!TIP]
> If you need to refresh the dependencies, run:
> ```sh
> rm -rf node_modules
> rm yarn.lock
> yarn cache clean
> yarn install
> ```
> This will remove the `node_modules` folder, the `yarn.lock` file, clean the cache and install the dependencies again.

## Docker development
As was needed to run both local and in docker environments, the `scripts.start` configuration of the `package.json` is one for the local and another for the docker environment. The local environment will run the `docusaurus start` command and the docker environment will run the `docusaurus start --host 0.0.0.0` command.

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
> For more development information, please refer to the official [Docussaurus documentation](https://docusaurus.io/docs).

### Production

> To be done.

```sh
cd magma-documentation
docker compose up docusaurus-prod
```

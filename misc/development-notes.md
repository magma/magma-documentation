---
title: Development Notes
---

# Local installation
> This is required to run the documentation locally and other commands like the translation commands.

Due to some issues with the `npm install` command, it is recommended to use `yarn` instead. To install `yarn` run the following command:
```sh
npm install -g yarn
```
Then run the following command to install the dependencies (at `./magma-documentation`):
```sh
yarn install
```

## Docker development

As was needed to run both local and in docker environments, the `scripts.start` configuration of the `package.json` is one for the local and another for the docker environment. The local environment will run the `docusaurus start` command and the docker environment will run the `docusaurus start --host 0.0.0.0` command.

# Translations

Is possible to make two types of translations in Docusaurus:

- Pages: Will not be possible to use React components as the text to be translated will need to be hardcoded in the js file. For that run the following [command](https://docusaurus.io/docs/cli#docusaurus-write-translations-sitedir):
    ```sh
    yarn run write-translations -- --locale <locale>
    ```
- Markdowns: Run the following command:
    ```sh
    mkdir -p i18n/<locale>/docusaurus-plugin-content-docs/current
    cp -r docs/** i18n/<locale>/docusaurus-plugin-content-docs/current
    ```
    This will create a folder with the translated markdowns. The translated markdowns will be in the `i18n` folder.
    Using this method will be needed to manually update all the markdowns for each language.
    `TODO` Find a simpler way to translate.
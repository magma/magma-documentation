# TODO

- Check if `package-lock.json` is needed in the repository.
- Confirm repository name for GH Pages deployment:
    ```js
    // Set the production url of your site here
    url: 'https://magma.github.io',
    // Set the /<baseUrl>/ pathname under which your site is served
    // For GitHub pages deployment, it is often '/<projectName>/'
    baseUrl: '/magma/',
    ```
- Create social-card.jpg

---

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


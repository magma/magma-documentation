// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import {themes as prismThemes} from 'prism-react-renderer';

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Magma Documentation',
  tagline: 'Magma is an open-source software platform that gives network operators an open, flexible and extendable mobile core network solution.',
  favicon: 'img/icon.png',

  // Set the production url of your site here
  url: 'https://magma.github.io',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/magma/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'magma',
  projectName: 'magma-documentation',

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'es', 'pt'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: './sidebars.js',
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          editUrl:
            'https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/',
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      // Replace with your project's social card at /docusaurus/static/img/
      // image: 'img/docusaurus-social-card.jpg',
      navbar: {
        title: 'Magma',
        logo: {
          alt: 'Magma Logo',
          src: 'img/magma_icon.png',
        },
        items: [
          {
            type: 'docsVersionDropdown',
            sidebarId: 'versionlSidebar',
            position: 'left',
            label: 'Tutorial',
          },
          {
            to: 'https://magmacore.org/',
            label: 'Magma Website',
            position: 'left'
          },
          {
            to: '/',
            label: 'Docs',
            position: 'left'
          },
          {
            to: 'https://github.com/magma',
            label: 'Code',
            position: 'left'
          },
          {
            to: 'https://github.com/magma/magma/wiki/Contributor-Guide',
            label: 'Contributing',
            position: 'left'
          },
          {
            to: 'https://lf-magma.atlassian.net/wiki/spaces/HOME/overview?mode=global',
            label: 'Wiki',
            position: 'left'
          },
          {
            type: 'localeDropdown',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Community',
            items: [
              {
                label: 'Slack',
                href: 'https://magmacore.slack.com/ssb/redirect',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Magma. Built with Docusaurus.`,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
      },
    }),

};

export default config;

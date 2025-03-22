/**
 * Copyright 2025 The Magma Authors.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import {themes as prismThemes} from 'prism-react-renderer';

const url = process.env.DOCUSAURUS_URL || 'https://magma.github.io'
const baseUrl = process.env.DOCUSAURUS_BASE_URL || '/'

// Security note on visibility of this secret in the source code: the API key is
// not secured by secrecy. It is secured by a referer check for magma.github.io
// and by a rate limit, both administered on the Algolia site. Linux Foundation
// has a 1Password file with the login info. For debugging on your own machine
// set the environment variable to this unsecured key:
// f95caeb7bc059b294eec88e340e5445b
const algoliaApiKey =
  process.env.ALGOLIA_API_KEY || '7b4d4c984e53d3a746869d22ed9e983b';

const magmaGithubUrl = 'https://github.com/magma/magma'

// Path to images for header/footer
const footerIcon = 'img/magma_icon.png'
const favicon = 'img/icon.png'
const magmaLogo = 'img/magma-logo.svg'

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Magma Documentation',
  tagline: 'Magma is an open-source software platform that gives network operators an open, flexible and extendable mobile core network solution.',
  favicon: favicon,

  url: url, // production url
  baseUrl: baseUrl, // /<baseUrl>/ pathname under which the site is served

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'magma',
  projectName: 'magma',

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
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      }),
    ],
  ],

  themeConfig: /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
  (
    {
      image: favicon,
      navbar: {
        title: 'Magma',
        logo: {
          alt: 'Magma Logo',
          src: magmaLogo,
        },
        items: [
          {
            type: 'docsVersionDropdown',
            sidebarId: 'versionSidebar',
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
            to: magmaGithubUrl,
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
        logo: {
            alt: 'Magma Logo',
            src: footerIcon,
            href: url,
            height: 100,
            width: 100,
          },
        copyright: `Copyright \u{00A9} ${new Date().getFullYear()} Magma Project. Built with Docusaurus.`,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
        defaultLanguage: 'bash',
        // magicComments: [],
      },
      colorMode: {
        defaultMode: 'light',
        disableSwitch: false,
        respectPrefersColorScheme: true,
      },

      // Enable Algolia DocSearch Functionality within Docusaurus
      algolia: {
        appId: 'magma',
        apiKey: algoliaApiKey,
        indexName: 'magma',
      },
    }
  ),

  // Add custom scripts here that would be placed in <script> tags.
  scripts: ['https://buttons.github.io/buttons.js',
    'https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js',
    '/init.js'],

  // Enable mermaid
  themes: ['@docusaurus/theme-mermaid'],
  markdown: {
    mermaid: true,
  },
};

module.exports = config;

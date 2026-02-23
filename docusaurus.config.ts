import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'RVM',
  tagline: 'Ruby Version Manager',
  favicon: 'favicon.ico',

  url: 'https://rvm.io',
  baseUrl: '/',

  organizationName: 'rvm',
  projectName: 'rvm-site',

  onBrokenLinks: 'warn',

  markdown: {
    format: 'md',
  },

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          routeBasePath: '/',
          editUrl: 'https://github.com/rvm/rvm-site/edit/master/',
        },
        blog: {
          showReadingTime: true,
          feedOptions: {
            type: ['rss', 'atom'],
            xslt: true,
          },
          editUrl: 'https://github.com/rvm/rvm-site/edit/master/',
          onInlineTags: 'warn',
          onInlineAuthors: 'warn',
          onUntruncatedBlogPosts: 'warn',
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    image: 'images/logo.png',
    colorMode: {
      respectPrefersColorScheme: true,
    },
    algolia: {
      appId: 'BH4D9OD16A',
      apiKey: '511953e6f628103639db56a6f0f96977',
      indexName: 'rvm',
    },
    navbar: {
      title: 'RVM',
      logo: {
        alt: 'RVM Logo',
        src: 'images/logo.png',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'docs',
          position: 'left',
          label: 'Documentation',
        },
        {to: '/blog', label: 'Blog', position: 'left'},
        {
          href: 'https://github.com/rvm/rvm',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Documentation',
          items: [
            {label: 'Install RVM', to: '/rvm/install'},
            {label: 'RVM Basics', to: '/rvm/basics'},
            {label: 'Rubies', to: '/rubies/installing'},
            {label: 'Gemsets', to: '/gemsets/basics'},
          ],
        },
        {
          title: 'Community',
          items: [
            {label: 'GitHub', href: 'https://github.com/rvm/rvm'},
            {label: 'Issues', href: 'https://github.com/rvm/rvm/issues'},
          ],
        },
        {
          title: 'More',
          items: [
            {label: 'Blog', to: '/blog'},
            {label: 'FAQ', to: '/support/faq'},
            {label: 'License', to: '/license'},
          ],
        },
      ],
      copyright: `Copyright © 2009-${new Date().getFullYear()} Wayne E. Seguin, Michal Papis, Piotr Kuczynski. Built with Docusaurus.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
      additionalLanguages: ['bash', 'ruby'],
    },
  } satisfies Preset.ThemeConfig,
};

export default config;

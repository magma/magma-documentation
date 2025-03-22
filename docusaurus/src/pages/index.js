import React from 'react';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
// import Heading from '@theme/Heading';
import styles from './index.module.css';
import useBaseUrl from '@docusaurus/useBaseUrl';



function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <header className={styles.hero}>
      <img src={useBaseUrl('/img/icon.png')} alt="Magma Logo" style={{ width: 100, marginBottom: 20 }} />
      <h1 className={styles.title}>Welcome to Magma Documentation</h1>
      <p className={styles.subtitle}>
        Open-source platform for building carrier-grade networks with flexibility and scalability.
      </p>
      <div className={styles.buttons}>
        <Link className="button button--primary button--lg" to="/docs/basics/version-1.8.0-introduction">
          Get Started
        </Link>
      </div>
    </header>
  );
}

const docSections = [
  {
    title: 'Getting Started',
    description: 'Understand what Magma is and how to begin using it.',
    to: '/docs/basics/version-1.8.0-introduction',
  },
  {
    title: 'Architecture',
    description: 'Explore Magma’s federated model and core components.',
    to: '/docs/feg/federated-LTE-overview',
  },
  {
    title: 'Deployment',
    description: 'Guides on deploying Magma on different environments.',
    to: '/docs/next/orc8r/deploying_orc8r',
  },
  {
    title: 'APIs & CLI',
    description: 'Explore the REST APIs, Swagger UI, and CLI usage.',
    to: '/docs/orc8r/swagger',
  },
  {
    title: 'Developer Setup',
    description: 'Set up Magma locally and start developing.',
    to: '/docs/next/orc8r/dev_setup',
  },
  {
    title: 'Contributing',
    description: 'Want to contribute? Read our contribution guide.',
    to: '/docs/contributing/contribute-intro',
  },
  {
    title: 'Changelog & Releases',
    description: 'View changes, release notes and access older versions.',
    to: '/docs/next/changelog',
  },
  {
    title: 'GitHub Repository',
    description: 'Browse the source code and open issues.',
    to: 'https://github.com/magma/magma',
  },
  {
    title: 'Download PDF',
    description: 'Get the full documentation in PDF format.',
    to: '/pdfs/magma-docs.pdf',
  },
];

function DocCard({ title, description, to }) {
  return (
    <div className="card margin--sm padding--md">
      <h3>{title}</h3>
      <p>{description}</p>
      <Link className="button button--sm button--secondary" to={to}>
        Learn more
      </Link>
    </div>
  );
}

export default function Home() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      title={`Welcome | ${siteConfig.title}`}
      description="Official Magma documentation portal"
    >
      <HomepageHeader />
      <main className="container">
        <section className="row">
          {docSections.map((props, idx) => (
            <div key={idx} className="col col--4">
              <DocCard {...props} />
            </div>
          ))}
        </section>
      </main>
    </Layout>
  );
}

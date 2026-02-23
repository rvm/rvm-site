import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import Heading from '@theme/Heading';
import CodeBlock from '@theme/CodeBlock';

import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <img src="images/logo.png" alt="RVM Logo" className={styles.heroLogo} />
        <Heading as="h1" className="hero__title">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <p className={styles.heroDescription}>
          RVM is a command-line tool which allows you to easily install, manage,
          and work with multiple Ruby environments from interpreters to sets of gems.
        </p>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
            to="/rvm/install">
            Install RVM
          </Link>
          <Link
            className="button button--outline button--secondary button--lg"
            to="/rvm/basics"
            style={{marginLeft: '1rem'}}>
            Get Started
          </Link>
        </div>
      </div>
    </header>
  );
}

function QuickInstall() {
  return (
    <section className={styles.quickInstall}>
      <div className="container">
        <Heading as="h2">Quick Install</Heading>
        <p>Install GPG keys:</p>
        <CodeBlock language="bash">
          {`gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`}
        </CodeBlock>
        <p>Install RVM:</p>
        <CodeBlock language="bash">
          {`\\curl -sSL https://get.rvm.io | bash -s stable`}
        </CodeBlock>
      </div>
    </section>
  );
}

const features = [
  {
    title: 'Production',
    description: 'Install and manage multiple Ruby versions on your production servers with ease.',
  },
  {
    title: 'Development',
    description: 'Seamlessly switch between Ruby versions and gemsets for different projects.',
  },
  {
    title: 'Testing',
    description: 'Run your test suite across multiple Ruby versions to ensure compatibility.',
  },
  {
    title: 'Gem Management',
    description: 'Use gemsets to isolate project dependencies and avoid version conflicts.',
  },
];

function Features() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {features.map((feature, idx) => (
            <div key={idx} className={clsx('col col--3')}>
              <div className={styles.featureCard}>
                <Heading as="h3">{feature.title}</Heading>
                <p>{feature.description}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

function Community() {
  return (
    <section className={styles.community}>
      <div className="container">
        <Heading as="h2">Community</Heading>
        <p>
          RVM is maintained by the open source community. Get involved on{' '}
          <a href="https://github.com/rvm/rvm">GitHub</a>, report{' '}
          <a href="https://github.com/rvm/rvm/issues">issues</a>, or contribute
          to the project.
        </p>
      </div>
    </section>
  );
}

export default function Home(): JSX.Element {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={siteConfig.title}
      description="Ruby Version Manager - Install, manage, and work with multiple Ruby environments">
      <HomepageHeader />
      <main>
        <QuickInstall />
        <Features />
        <Community />
      </main>
    </Layout>
  );
}

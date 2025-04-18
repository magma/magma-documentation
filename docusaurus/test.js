const { execSync } = require('child_process');

const isCI = process.env.GITHUB_ACTIONS === 'true';

if (isCI) {
  execSync('yarn build:test && yarn check-links', { stdio: 'inherit' });
} else {
  execSync('jest', { stdio: 'inherit' });
}

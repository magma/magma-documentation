# Changes
## Removed
- No need for `docusaurus/blog/` as discussed in Slack, and as the existing text is not relevant to the project, it has been removed.
- Removed `docusaurus/README.md` as it is already present information duplicated with another files like `docs/howtos/documentation_development.md`.
- Removed `docusaurus/package-lock.json` as the local development should be done with `yarn`.
- Removed unused static files.
- Remove `HomepageFeatures` components as was only being imported and not used.

## Added
+ Added `docusaurus/docs/howtos/documentation_development.md` as to give instructions on how to develop documentation.
+ Added `docusaurus/docker.package.json` to include the dependencies needed to build the containers.

## Updated
* Improved `docusaurus/.dockerignore` refenrencing the the other JS modules that are not needed when building the container.
* Updated `docusaurus/package.json` to include the latest versions of the dependencies.
* Included at `docusaurus/Dockerfile` the the new instructions to build the containers of Development and Production.
* Improved `index.js` to include the new components and remove the unused ones.

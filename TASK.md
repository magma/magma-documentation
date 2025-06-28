# Magma Documentation Restructuring Task

## Overview
This task involves restructuring the Magma core documentation to align with user goals (deployers, debuggers, developers), ensure progressive complexity (introductory content at the top, specialized content at the bottom), and avoid repetition through reference links. The changes will affect the content in the 'readmes' directory and will be reflected in the 'docusaurus/sidebars.json' file. This task originates from the open issue: [https://github.com/magma/magma-documentation/issues/18](https://github.com/magma/magma-documentation/issues/18).

## Objectives
- Cater to different user goals: deployers (deployment guides), debuggers (troubleshooting), developers (technical references, contributing guides and workflows).
- Organize documentation with progressive complexity: introductory content first, followed by specialized topics.
- Avoid repetition by using reference links to primary explanations.
- Include new content for development workflows (e.g., devcontainers), container updates, and incentives for "good first issue" contributions.
- Prioritize the "Deployment" section as the initial focus of restructuring.

## Proposed Documentation Structure
- **Introduction** (Page: basics/introduction.md)
  - Overview of Magma, its purpose, and key features.
- **Deployment** (Page: Community validated scenarios - new content to be created) *[Priority Focus]*
  - **Orchestrator (Orc8r)**
    - Kubernetes (Placeholder for new or existing content, e.g., orc8r/deploy_using_juju.md)
    - Docker (Placeholder for new or existing content)
    - Baremetal (Placeholder for new or existing content, e.g., orc8r/deploy_install.md)
  - **Access Gateway (AGW)**
    - Kubernetes (Placeholder for new or existing content)
    - Docker (Existing: lte/deploy_install_docker.md)
    - Baremetal (Existing: lte/deploy_install.md)
  - **Federation Gateway (FEG)**
    - Kubernetes (Placeholder for new or existing content)
    - Docker (Existing: feg/docker.md)
    - Baremetal (Existing: feg/deploy_install.md)
- **Configuration**
  - **First Time Setup** (Placeholder for new or existing content, e.g., lte/deploy_config_agw.md)
  - **Enabling 5G** (Existing: howtos/5g_nsa_support.md)
  - Additional configuration topics as needed from 'howtos' directory.
- **Magma Use Cases** (New content to be created)
  - **Federation Gateway Integration** (Documentation on specific configurations for connecting to a Federation Gateway)
  - **CWAG Integration** (Documentation on integration with CWAG (WiFi) networks)
  - **Edge Computing Setup** (Case report on edge computing in private networks)
  - **Controlling Drones** (Case report on controlling drones on private networks)
- **Technical Reference** (Page: Overview of Magma architecture - new or existing content, e.g., lte/architecture_overview.md)
  - **Orchestrator (Orc8r)** (Existing: orc8r/architecture_overview.md)
  - **Access Gateway (AGW)** (Existing: lte/readme_agw.md)
  - **Federation Gateway (FEG)** (Existing: feg/architecture_overview.md)
- **Contributing** (Page: Links to GitHub/Slack, deployment - existing: contributing/contribute_github.md)
  - **Devcontainer** (New content for development workflows using devcontainers)
  - **Compiling & Upgrading AGW** (Existing: lte/upgrade_1_6.md and others)
  - **Compiling & Upgrading Orchestrator** (Existing: orc8r/upgrade_1_6.md and others)
  - **Incentive to "Good First Issue" and Attendance to Meetings** (New content with specific instructions for beginners on contributing to Magma, including how to search for issues labeled as "good first issue" on GitHub)

## Implementation Plan and Progress Tracking
1. **Document the Plan** (Status: In Progress)
   - Create TASK.md at the root of the repository to track progress.
2. **Prioritize Deployment Section** (Status: Not Started)
   - Focus initial efforts on restructuring and updating the "Deployment" tree.
   - Map existing content from the 'readmes' directory.
   - Create new content for community-validated scenarios.
3. **Map Existing Content** (Status: Not Started)
   - Review all files in the 'readmes' directory to map them to the proposed structure.
   - Identify gaps where new content is needed.
4. **Create New Content** (Status: Not Started)
   - Develop new documentation for topics like "Magma Use Cases", "Devcontainer" workflows, and "Good First Issue" instructions.
5. **Update Sidebar Configuration** (Status: Not Started)
   - Revise the 'docusaurus/sidebars.json' file to reflect the new structure.
   - Ensure all links and categories are correctly updated.
6. **Ensure Non-Repetition** (Status: Not Started)
   - Implement reference links to primary explanations to avoid duplicate content across sections.

## Notes
- This file will be updated as progress is made on each step of the implementation plan.
- The restructuring will be iterative, with a focus on completing the "Deployment" section first before moving to other sections.
- Community feedback and alignment with the GitHub issue will be considered throughout the process.

Last Updated: June 28, 2025

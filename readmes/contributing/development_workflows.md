# Development Workflows for Magma

## Introduction
This document outlines the recommended development workflows for contributing to Magma. Whether you're a new contributor or an experienced developer, following these workflows will help streamline your development process and ensure compatibility with the Magma codebase. This guide covers setting up development environments using devcontainers, managing container updates, and provides directions for tackling "good first issue" tasks.

## Development Environment Setup with Devcontainers
Devcontainers (Development Containers) provide a consistent, reproducible development environment using Docker, ensuring that all developers work with the same tools and dependencies. This approach minimizes "works on my machine" issues and simplifies onboarding for new contributors.

### Prerequisites
- **Docker**: Ensure Docker is installed on your system. Follow the [Docker installation guide](https://docs.docker.com/get-docker/) for your operating system.
- **Visual Studio Code**: Recommended for devcontainer support. Install VS Code and the "Remote - Containers" extension.
- **Devcontainer extention**: 

### Setting Up a Devcontainer for Magma
1. **Clone the Magma Repository**:
   ```bash
   git clone https://github.com/magma/magma.git
   cd magma
   ```
2. **Open in VS Code**:
   - Open the cloned repository in Visual Studio Code.
   - Use the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P` on macOS) and select "Remote-Containers: Reopen in Container".
3. **Configuration**:
   - The `.devcontainer` extention builds the necessary docker image with all developments tools needed, this image contains the configuration for the development environment.
   - The container will build with all necessary dependencies for Magma development, including build tools, libraries, and runtime environments.
4. **Start Developing**:
   - Once the container is running, your VS Code environment will be inside the container, with access to all required tools.
   - Use terminal commands within VS Code to build, test, and run Magma components.

### Benefits of Devcontainers
- **Consistency**: All developers use the same environment, reducing discrepancies.
- **Isolation**: Development environment is isolated from your local system, preventing conflicts with other projects.
- **Ease of Setup**: New contributors can get started quickly without manual dependency installation.

For more details on devcontainers, refer to the [VS Code Remote - Containers documentation](https://code.visualstudio.com/docs/remote/containers).

## Managing Container Updates
When working with containerized environments or deploying Magma components via Docker, keeping containers updated is crucial for security, performance, and compatibility with the latest Magma features.

### Updating Development Containers
- **Rebuild the Container**: If the `.devcontainer` configuration or Dockerfile changes, rebuild the container using "Remote-Containers: Rebuild Container" from the VS Code Command Palette.
- **Pull Latest Images**: Ensure the base Docker images used in the devcontainer are up-to-date by running:
  ```bash
  docker pull <image-name>
  ```
  Check the `.devcontainer/Dockerfile` for the specific image names.

### Updating Magma Deployment Containers
<!-- TODO: revisit and manually add information -->
- **Check for Updates**: Regularly check the Magma GitHub repository or Docker Hub for updates to official Magma images.
- **Pull Updated Images**: For components deployed via Docker (e.g., AGW, FEG), update images with:
  ```bash
  docker pull magmacore/<component>:<tag>
  ```
  Replace `<component>` with the specific Magma component (e.g., `agw`, `orc8r`) and `<tag>` with the desired version or `latest`.
- **Redeploy Containers**: After pulling updates, redeploy the containers using your deployment scripts or Docker Compose files to apply the changes.
- **Version Compatibility**: Ensure that updated containers are compatible with your current Orchestrator (Orc8r) version. Refer to release notes on [GitHub](https://github.com/magma/magma/releases) for compatibility information.

## Contributing to Magma: Good First Issues
Magma welcomes contributions from developers of all skill levels. If you're new to the project, starting with a "good first issue" is an excellent way to get involved, learn the codebase, and make a meaningful impact.

### Why Contribute to Good First Issues?
- **Learning Opportunity**: These issues are typically well-documented and scoped for beginners, helping you understand Magma's architecture and coding standards.
- **Community Impact**: Even small contributions improve the project for all users, from bug fixes to documentation updates.
- **Mentorship**: The Magma community often provides guidance on these issues through GitHub comments or Slack discussions.

### Finding Good First Issues
- Visit the [Magma GitHub Issues page](https://github.com/magma/magma/issues) and filter for issues labeled "good first issue".
- These issues might include tasks like fixing typos in documentation, writing unit tests, or implementing small features.

### How to Get Started
1. **Claim an Issue**: Comment on the issue to express interest, ensuring no one else is already working on it.
2. **Set Up Your Environment**: Use the devcontainer setup described above or follow the [development setup guide](https://github.com/magma/magma/blob/master/docs/basics/quick_start_guide.md) for a local environment.
3. **Submit a Pull Request (PR)**: Follow the [contribution guidelines](https://github.com/magma/magma/blob/master/CONTRIBUTING.md) to submit your changes for review.
4. **Engage with Reviewers**: Address feedback from maintainers to refine your contribution.

### Incentives for Contribution
- **Recognition**: Contributors are acknowledged in release notes and community channels.
- **Skill Development**: Gain experience in mobile networking, open-source collaboration, and cutting-edge technologies like 5G.
- **Networking**: Connect with other developers, operators, and organizations in the Magma community.

## Community Engagement: Attend Meetings
Beyond code contributions, participating in community meetings is a valuable way to engage with Magma's development roadmap, discuss issues, and collaborate on solutions.

### Magma Community Meetings
- **Technical Steering Committee (TSC) Meetings**: Held regularly to discuss project direction, feature prioritization, and governance. Check the [Magma Slack](https://magma-developers.slack.com/) or [GitHub Discussions](https://github.com/magma/magma/discussions) for schedules and agendas.
- **Working Groups**: Focused sessions on specific components (e.g., AGW, Orc8r) or topics (e.g., 5G integration). These are great for deep dives into areas of interest.

### How to Join
- **Slack**: Join the Magma Slack workspace for real-time updates and meeting invites.
- **Calendar**: Meeting links and times are often shared in the community calendar or GitHub repository.
- **Prepare**: Review agendas and bring questions or topics to discuss, especially if you're working on a specific issue or feature.

### Benefits of Attending
- **Influence Development**: Provide input on upcoming features and priorities.
- **Learn from Peers**: Gain insights from experienced contributors and deployers.
- **Build Connections**: Establish relationships that can lead to mentorship or collaboration opportunities.

## Next Steps
- Set up your development environment using devcontainers to start coding on Magma.
- Explore "good first issue" tasks on GitHub to make your first contribution.
- Join a community meeting to connect with other Magma contributors and learn about ongoing efforts.
- For detailed contribution guidelines, refer to [Contributing to Magma](../contributing/contribute_github.md).

We encourage all developers to dive in, ask questions on [Slack](https://magma-developers.slack.com/), and help shape the future of Magma!

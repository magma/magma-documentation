# magma-documentation

A standalone home for work on documentation for Magma, in order to make check-ins less work

## Magma Documentation

This document provides pointers for those looking to make documentation changes for the Magma project

- [Documentation Overview](https://github.com/magma/magma/wiki/Contributing-Documentation) for general documentation information
- `make help` for specific commands

## What is Docusaurus?

[Docusaurus](https://docusaurus.io/) is an open-source static site generator built by Meta and powered using React. It’s optimized for creating technical documentation websites for open-source projects, with support for document versioning, ready for translations, content search, and a hot reload feature.

---

## Repository Structure

```text
docusaurus/
├── Dockerfile
├── docker-compose.yml
├── docs/
├── docusaurus.config.js
├── sidebars.js
├── static/
├── src/
readmes/
```

---

## How to Setup Docusaurus

1. **Install Docker**  
   Download and install [Docker Engine](https://docs.docker.com/engine/install/)
   
   For Windows, you must instead install [Docker Desktop](https://apps.microsoft.com/detail/XP8CBJ40XLBWKX?hl=pt-BR&gl=BR&ocid=pdpshare)

3. **Clone the Repository**  
   Open a terminal in any directory and run:  
   ```bash
   git clone https://github.com/magma/magma-documentation.git
   ```

4. **Start Docusaurus with Docker**     
   Navigate to the project folder:  
   ```bash
   cd magma-documentation/docusaurus
   ```      
   and set up Docusaurus by:  
   ```bash
   docker compose up dev
   ```   

5. **Access the Documentation**  
   Once running, open your browser and visit: [http://localhost:3000/](http://localhost:3000/)

6. **Proper Shutdown**  
   You can stop this proccess without losing persistent data or associated configurations through:
   ```bash
   docker-compose stop
   ```     
   Or completely clean up your Docker environment with:  
   ```bash
   docker-compose down
   ```
---

## Contact

For further assistance, join our [Slack channel](https://magmacore.slack.com/archives/C01PGTJECGJ)!



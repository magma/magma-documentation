# magma-documentation

A standalone home for work on documentation for Magma, in order to make check-ins less work

## Magma Documentation

This document provides pointers for those looking to make documentation changes for the Magma project

- [Documentation Overview](https://github.com/magma/magma/wiki/Contributing-Documentation) for general documentation information
- Makefile usage:
    ```bash
    make dev                    # starts Docusaurus with live reload (dev mode)
    make build                  # starts Docusaurus in production mode
    make start ENV=production   # also possible
    make precommit              # runs precommit checks
    make sidebar_check          # checks if all docs have a sidebar entry
    make help                   # shows all available commands
    ```

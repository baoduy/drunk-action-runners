# Product Context

Describe the product.

## Overview

Provide a high-level overview of the project.

## Core Features

- Feature 1
- Feature 2

## Technical Stack

- Tech 1
- Tech 2

## Project Description

Two Docker-based CI/CD runner containers: GitHub Actions Runner (ephemeral, token-based auth) and Azure Pipelines Agent (persistent or placeholder modes). Both include tooling for certificate handling, curl, jq, and git operations.



Docker containers for GitHub Actions Runner and Azure Pipelines Agent with built-in tooling and security enhancements



## Architecture

Multi-stage Docker architecture with two separate Dockerfiles:\n\n**GitHub Actions Runner (Dockerfile.github)**:\n- Base: ghcr.io/actions/actions-runner:latest\n- Runs as 'runner' user (non-root)\n- Uses GITHUB_PAT for registration token\n- Ephemeral mode: runs once and exits\n- Requires: GH_URL, GITHUB_PAT, REGISTRATION_TOKEN_API_URL\n\n**Azure Pipelines Agent (Dockerfile.azure-pipelines)**:\n- Base: ubuntu:20.04\n- Runs as root (AGENT_ALLOW_RUNASROOT=1)\n- Uses AZP_TOKEN for authentication\n- Supports placeholder mode for testing\n- Requires: AZP_URL, AZP_TOKEN or AZP_TOKEN_FILE\n- Optional: AZP_AGENT_NAME, AZP_POOL, AZP_WORK\n\nBoth include CA certificate updates via update-ca-certificates command for secure SSL/TLS operations.", "technologies">["Docker", "bash/shell scripting", "GitHub Actions", "Azure Pipelines", "Azure Container Apps", "curl", "jq", "Git", "Ubuntu 20.04"]



Two separate Dockerfiles: one for GitHub Actions (based on ghcr.io/actions/actions-runner) and one for Azure Pipelines (based on ubuntu:20.04). Both include curl, jq, git, and CA certificate management



## Technologies

- Docker
- GitHub Actions
- Azure Pipelines
- Ubuntu 20.04
- Bash
- curl
- jq



## Libraries and Dependencies

- actions/actions-runner (latest GitHub Actions)
- ubuntu:20.04
- curl (HTTP client)
- jq (JSON processor)
- git (version control)



- actions/actions-runner (latest)
- ubuntu:20.04
- jq
- curl
- Azure CLI


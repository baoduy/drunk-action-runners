# MemoriPilot: System Architect

## Overview
This file contains the architectural decisions and design patterns for the MemoriPilot project.

## Architectural Decisions

- Use separate Dockerfiles for GitHub Actions and Azure Pipelines to maintain independence and minimize each image
- Implement ephemeral mode for GitHub Actions (--ephemeral flag) for temporary runner lifecycle
- Support placeholder mode in Azure Pipelines for configuration without running agents
- Add update-ca-certificates to both images for SSL/TLS certificate validation
- Use token-based authentication with secure environment variable handling



1. **Decision 1**: Description of the decision and its rationale.
2. **Decision 2**: Description of the decision and its rationale.
3. **Decision 3**: Description of the decision and its rationale.



## Design Considerations

- GitHub Actions requires GITHUB_PAT token from GitHub API for registration
- Azure Pipelines can use token from file (AZP_TOKEN_FILE) or env var (AZP_TOKEN) for security
- Container architecture must support linux-x64, linux-arm64, and linux-arm platforms
- Azure Pipelines agent can run in placeholder mode without executing builds
- Cleanup handlers ensure agent properly deregisters on container exit (INT/TERM signals)
- Both runners need curl and jq for API interactions and JSON processing



## Components

### Dockerfile.github

GitHub Actions Runner container image based on official actions-runner

**Responsibilities:**

- Install curl and jq
- Update CA certificates
- Set up ephemeral runner entrypoint
- Handle GitHub PAT authentication

### Dockerfile.azure-pipelines

Azure Pipelines Agent container image based on ubuntu:20.04

**Responsibilities:**

- Install system dependencies (curl, jq, git, Azure CLI)
- Update CA certificates
- Set up agent configuration and run entrypoint
- Handle AZP token-based authentication

### entrypoint.sh (GitHub)

Startup script for GitHub Actions Runner container

**Responsibilities:**

- Retrieve registration token from GitHub API
- Register runner with GitHub
- Run in ephemeral mode
- Execute builds and exit

### start.sh (Azure)

Startup script for Azure Pipelines Agent container

**Responsibilities:**

- Validate required environment variables
- Handle token file creation
- Download matching agent package
- Configure and register agent
- Support placeholder and normal modes
- Handle cleanup on exit




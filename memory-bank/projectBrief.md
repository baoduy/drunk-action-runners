# Drunk Action Runners

## Purpose

Define the main purpose of this project.

## Target Users

Describe who will use this.


## Project Summary

Drunk Action Runners provides Docker containers for self-hosted GitHub Actions Runners and Azure Pipelines Agents, deployable via Azure Container Apps. Tutorial-based project for CI/CD infrastructure setup.



Docker containers for GitHub Actions Runner and Azure Pipelines Agent with enhanced security and certificate management



## Goals

- Deploy self-hosted CI/CD runners with Azure Container Apps
- Support both GitHub Actions and Azure Pipelines
- Enable multi-platform builds (x64, arm64, arm)
- Ensure secure certificate handling
- Provide ephemeral and persistent agent configurations



- Build secure Docker images for CI/CD runners
- Ensure proper CA certificate handling
- Support multi-platform builds
- Maintain lightweight container images



## Constraints

- Must support multiple target architectures
- Container must handle authentication tokens securely
- Support both ephemeral (GitHub) and long-running (Azure) modes
- Minimal container footprint preferred



- Must maintain compatibility with GitHub Actions and Azure Pipelines
- Need to support multiple architectures (x64, arm64, arm)



## Stakeholders

- Azure Container Apps users
- GitHub Actions users
- Azure Pipelines users
- DevOps teams



- CI/CD pipeline users
- Container deployments


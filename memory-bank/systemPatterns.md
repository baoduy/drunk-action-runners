# System Patterns

## Architectural Patterns

- Pattern 1: Description

## Design Patterns

- Pattern 1: Description

## Common Idioms

- Idiom 1: Description

## Token-based Authentication Pattern

Both containers use token-based authentication for CI/CD platform registration. GitHub uses GITHUB_PAT token passed to API, Azure uses AZP_TOKEN that can be file-based for enhanced security. Tokens are cleared from memory after use.

### Examples

- github-actions-runner/entrypoint.sh: Uses GITHUB_PAT with GitHub API
- azure-pipelines-agent/start.sh: Uses AZP_TOKEN_FILE or AZP_TOKEN, unsets AZP_TOKEN after reading

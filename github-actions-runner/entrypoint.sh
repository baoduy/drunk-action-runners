#!/bin/bash
set -euo pipefail

for var in GITHUB_PAT REGISTRATION_TOKEN_API_URL GH_URL; do
  if [ -z "${!var:-}" ]; then
    echo 1>&2 "error: missing $var environment variable"
    exit 1
  fi
done

# Exchange the PAT for a short-lived runner registration token.
REGISTRATION_TOKEN="$(curl -X POST -fsSL \
  -H 'Accept: application/vnd.github.v3+json' \
  -H "Authorization: Bearer $GITHUB_PAT" \
  -H 'X-GitHub-Api-Version: 2022-11-28' \
  "$REGISTRATION_TOKEN_API_URL" \
  | jq -r '.token')"

if [ -z "$REGISTRATION_TOKEN" ] || [ "$REGISTRATION_TOKEN" = "null" ]; then
  echo 1>&2 "error: could not obtain a runner registration token"
  echo 1>&2 "check that GITHUB_PAT is valid and REGISTRATION_TOKEN_API_URL is correct"
  exit 1
fi

# The PAT is no longer needed; keep it out of the job environment.
unset GITHUB_PAT

./config.sh --url "$GH_URL" --token "$REGISTRATION_TOKEN" --unattended --ephemeral

# --ephemeral makes run.sh exit after a single job, which is what an
# Azure Container Apps job expects.
exec ./run.sh

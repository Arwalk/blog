#!/bin/bash
#
# Fetches from https://github.com/Arwalk/blog, checks if master evolved,
# and rebuilds/runs the blog container if it did.
# Usage: ./check-and-run.sh
#

set -e

BRANCH="master"
COMMAND="docker-compose down && docker-compose build && docker-compose up -d"

# Get current remote commit before fetch
OLD_COMMIT=$(git rev-parse "refs/remotes/origin/${BRANCH}" 2>/dev/null) || {
  echo "error: origin/${BRANCH} does not exist" >&2
  exit 1
}

# Fetch latest
git fetch origin

# Get new remote commit after fetch
NEW_COMMIT=$(git rev-parse "refs/remotes/origin/${BRANCH}")

# Check if branch evolved
if [[ "$OLD_COMMIT" != "$NEW_COMMIT" ]]; then
  echo "Branch origin/${BRANCH} evolved: ${OLD_COMMIT:0:7} → ${NEW_COMMIT:0:7}"
  echo "Running: $COMMAND"
  eval "$COMMAND"
else
  echo "No changes on origin/${BRANCH}"
fi

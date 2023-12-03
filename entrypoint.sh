#!/bin/sh -x

PULL_REQUEST_ID=$(echo "$GITHUB_REF_NAME" | cut -d"/" -f1)

set

/usr/local/bin/cdk-notifier \
  --ci github \
  --delete "$1" \
  --log-file "$2" \
  --owner "$GITHUB_REPOSITORY_OWNER" \
  --pull-request-id "${GITHUB_ACTION_REPOSITORY}/pull/${PULL_REQUEST_ID}" \
  --repo "$GITHUB_REPOSITORY" \
  --tag-id "$3" \
  --template "$4" \
  --token "$GITHUB_TOKEN" \
  --verbosity "$5"
#!/bin/sh -x

set

/usr/local/bin/cdk-notifier \
  --ci github \
  --delete "$1" \
  --log-file "$2" \
  --owner "$GITHUB_REPOSITORY_OWNER" \
  --repo "$GITHUB_REPOSITORY" \
  --tag-id "$3" \
  --template "$4" \
  --verbosity "$5"
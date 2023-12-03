#!/bin/sh

/usr/local/bin/cdk-notifier \
  --ci github \
  --delete "$1" \
  --log-file "$2" \
  --tag-id "$3" \
  --template "$4" \
  --verbosity "$5"
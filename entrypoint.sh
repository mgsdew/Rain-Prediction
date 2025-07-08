#!/bin/bash
set -e

# Securely generate kaggle.json using injected env vars
if [[ -n "$KAGGLE_USERNAME" && -n "$KAGGLE_KEY" ]]; then
  mkdir -p /root/.kaggle
  echo "{\"username\":\"$KAGGLE_USERNAME\", \"key\":\"$KAGGLE_KEY\"}" > /root/.kaggle/kaggle.json
  chmod 600 /root/.kaggle/kaggle.json
else
  echo "❌ KAGGLE_USERNAME or KAGGLE_KEY is not set. Skipping kaggle.json generation."
fi

# Execute the CMD
exec "$@"
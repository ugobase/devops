#!/bin/bash
set -e
ENV=$1
if [ -z "$ENV" ]; then echo "Usage: $0 <env>"; exit 1; fi
URL="http://myapp-$ENV.production.svc.cluster.local:3000/health"
for i in {1..5}; do
  if curl -sf "$URL" >/dev/null; then
    echo "Smoke test passed!"
    exit 0
  fi
  echo "Retrying..."
  sleep 3
done
echo "Smoke test FAILED"
exit 1

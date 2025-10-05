#!/bin/bash
set -e
ENV=$1
if [ -z "$ENV" ]; then echo "Usage: $0 <env>"; exit 1; fi
CPU=$(kubectl top pods -n production -l env=$ENV --no-headers | awk '{sum+=$2} END {print sum}')
THRESHOLD=1000
echo "CPU usage: $CPU mCPU"
[ "$CPU" -gt "$THRESHOLD" ] && exit 1 || exit 0
echo "CPU usage is within acceptable limits."
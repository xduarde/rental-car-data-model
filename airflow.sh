#!/usr/bin/env bash

# Run airflow command in container

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -euo pipefail

export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"
if [ $# -gt 0 ]; then
    exec docker-compose run --rm airflow-cli "${@}"
else
    exec docker-compose run --rm airflow-cli
fi

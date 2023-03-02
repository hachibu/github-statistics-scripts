#!/usr/bin/env bash

set -euo pipefail

DATA_FILE="data/users.csv"

if [ ! -f "$DATA_FILE" ]; then
    gh api users --paginate --jq '.[].login' | tee "$DATA_FILE"
fi

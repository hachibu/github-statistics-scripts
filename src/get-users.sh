#!/usr/bin/env bash

set -euo pipefail

declare -A FLAGS

FLAGS[force]=false

while getopts 'fp' flag; do
  case "${flag}" in
    f) FLAGS[force]=true ;;
    *) ;;
  esac
done

DATA_FILE="data/users.csv"

if [ "${FLAGS[force]}" = true ]; then
    rm -rf "$DATA_FILE"
fi

if [ ! -f "$DATA_FILE" ]; then
    gh api users --paginate --jq '.[] | select(.type == "User") | .login' | tee "$DATA_FILE"
fi

#!/usr/bin/env bash

set -euo pipefail

render_data_file() {
  st --complete "$1"
  echo

  PERCENTILES=('75' '90' '95' '99')

  for K in "${PERCENTILES[@]}"
  do
      N=$(st --percentile="$K" "$1")
      echo -e "P$K\t$N"
  done
}

sample_users() {
  RESULT=$(sort -R "data/users.csv" | head -"$1")
  echo "$RESULT"
}

export -f render_data_file
export -f sample_users

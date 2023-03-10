#!/usr/bin/env bash

set -euo pipefail

render_data_file() {
  st --complete "$1"
  echo

  PERCENTILES=('50' '75' '90' '95' '99')

  for K in "${PERCENTILES[@]}"
  do
      N=$(st --percentile="$K" "$1")
      echo -e "P$K\t$N"
  done

  ./src/render-histogram.py "$1"
}

sample_users() {
  RESULT=$(sort -R "data/users.csv" | head -"$1")
  echo "$RESULT"
}

sort_data_file() {
  sort -g -o "$1"{,}
}

export -f render_data_file
export -f sample_users
export -f sort_data_file

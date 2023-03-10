#!/usr/bin/env bash

set -euo pipefail

source "src/util.sh"

declare -A FLAGS

FLAGS[force]=false

while getopts 'fp' flag; do
  case "${flag}" in
    f) FLAGS[force]=true ;;
    *) ;;
  esac
done

DATA_FILE="data/user-followers.csv"
SAMPLE_SIZE="${1:-100}"

if [ "${FLAGS[force]}" = true ]; then
    rm -rf "$DATA_FILE"
fi

if [ ! -f "$DATA_FILE" ]; then
    LOGINS=$(sample_users "$SAMPLE_SIZE")
    printf "Downloading data to %s" $DATA_FILE
    for LOGIN in $LOGINS
    do
        FOLLOWERS=$(gh api "users/$LOGIN" --jq '.followers')
        printf '.'
        echo "$FOLLOWERS" >> $DATA_FILE
    done
    echo 'done.'
fi

render_data_file $DATA_FILE

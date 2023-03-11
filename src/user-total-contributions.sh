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

DATA_FILE="data/user-total-contributions.csv"
SAMPLE_SIZE="${1:-100}"

if [ "${FLAGS[force]}" = true ]; then
    rm -rf "$DATA_FILE"
fi

if [ ! -f "$DATA_FILE" ]; then
    LOGINS=$(sample_users "$SAMPLE_SIZE")
    printf "Downloading data to %s" $DATA_FILE
    for LOGIN in $LOGINS
    do
        QUERY="query { user(login: \"$LOGIN\") { contributionsCollection { contributionCalendar { totalContributions } } } }"
        TOTAL_CONTRIBUTIONS=$(gh api graphql -f query="$QUERY" --jq '.data.user.contributionsCollection.contributionCalendar.totalContributions')
        printf '.'
        echo "$TOTAL_CONTRIBUTIONS" >> $DATA_FILE
    done
    echo 'done.'
fi

render_data_file $DATA_FILE

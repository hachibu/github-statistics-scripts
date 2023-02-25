#!/usr/bin/env bash

set -euo pipefail

source "src/util.sh"

DATA_FILE="data/user-followers.csv"

if [ ! -f "$DATA_FILE" ]; then
    LOGINS=$(gh api users --cache 1h | jq -r '.[].login')
    printf "Downloading data to %s" $DATA_FILE
    for LOGIN in $LOGINS
    do
        FOLLOWERS=$(gh api "users/$LOGIN" | jq -r '.followers')
        printf '.'
        echo "$FOLLOWERS" >> $DATA_FILE
    done
    echo 'done.'
fi

render_data_file $DATA_FILE

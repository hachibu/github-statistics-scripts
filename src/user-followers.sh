#!/usr/bin/env bash

set -euo pipefail

source "src/util.sh"

DATA_FILE="data/user-followers.csv"
SAMPLE_SIZE=100

if [ ! -f "$DATA_FILE" ]; then
    LOGINS=$(sample_users $SAMPLE_SIZE)
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

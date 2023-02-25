#!/usr/bin/env bash

set -euo pipefail

DATA_FILE="data/user-followers.csv"

if [ ! -f "$DATA_FILE" ]; then
    LOGINS=$(gh api users --cache 1h | jq -r '.[].login')
    printf "Downloading data to $DATA_FILE"
    for LOGIN in $LOGINS
    do
        FOLLOWERS=$(gh api users/$LOGIN | jq -r '.followers')
        printf '.'
        echo $FOLLOWERS >> $DATA_FILE
    done
    echo 'done.'
fi

cat $DATA_FILE | st --complete
echo

PERCENTILES=('75' '90' '95' '99')

for K in "${PERCENTILES[@]}"
do
    N=$(cat $DATA_FILE | st --percentile=$K)
    echo -e "P$K\t$N"
done

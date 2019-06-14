#!/usr/bin/env bash
set -e
if [[ -e stats.csv ]]; then
    rm stats.csv
fi

# my local script that run command on each commit
run-command-on-git-revisions $1 $2 "sh perf_stats_on_this_rev.sh >> stats.csv"
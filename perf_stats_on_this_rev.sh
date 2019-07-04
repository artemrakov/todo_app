#!/usr/bin/env bash
set -e

rev=`git log -1 --pretty='format:%h' HEAD`
time=`rspec perf/checklist_perf_spec.rb |
    grep '^RUNTIME: ' |
    awk '{print $2}'`

echo $rev,$time
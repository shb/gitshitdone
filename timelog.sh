#!/bin/sh

. "$(dirname "$0")/include/git-timelog.sh"

branch=${*:---all}

echo "‚--------------------."
echo "|  Time log of work  |"
echo "‛--------------------’"
echo ""

git_log "$branch" '%F' '%ad: %s' | sort

echo "------------------------"

echo "Total time estimate: " $(git_log $branch '%F;%H' '%ad;%s' | cut -f1,2 -d\; | sort -u | wc -l) "hrs"

#!/bin/sh

. "$(dirname "$0")/include/git-timelog.sh"

branch=${*:---all}

echo "year,month,day,slot,task"
git_log "$branch" '%Y,%m,%d,%H' '%ad,%s' | sort

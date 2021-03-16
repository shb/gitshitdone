#!/bin/sh

git_bdsm () {
  candidates="master main"
  for branch in $candidates; do
    git branch | grep $branch > /dev/null
    if [ "$?" = "0" ]; then
      echo $branch
      return
    fi
  done
}

git_log () {
  branches=$1
  date_format=$2
  log_format=$3
  git log --no-merges "--date=format:$date_format" "--pretty=$log_format" $branches
}

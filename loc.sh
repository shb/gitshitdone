#!/bin/sh

. "$(dirname "$0")/include/git-timelog.sh"

get_hashes () {
  main=$(git_bdsm)
  branches=${1-$main}
  echo $(git log --pretty='%H' "$branches" | tail -r )
}

sum () {
  commit=$1
  field=$2
  c=0
  for s in $( git show --numstat --minimal --pretty= "$commit" | cut -f "${field}" ); do
    if [ "$s" != "-" ]; then 
      c=$(( $c + ${s} ))
    fi
  done
  echo $c
}

echo "added,deleted,add_cumulative,del_cumulative,cumulative"
add_cum=0
del_cum=0
for hash in $(get_hashes); do
  added=$(sum $hash 1)
  deleted=$(sum $hash 2)
  add_cum=$(( $add_cum + $added ))
  del_cum=$(( $del_cum + $deleted ))
  cum=$(( $add_cum + $del_cum ))
  echo "${added},${deleted},${add_cum},${del_cum},${cum}"
done
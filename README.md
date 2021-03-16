gitshitdone
===========

Simple tracking scripts for git repositories


Scripts
-------

### timelog.sh

Print work log with time estimates.

```
./timelog.sh [branch, ...]
```

Print a work log picking commits from one or more branches. All branches are included if non is given.
Total working time is estimated by counting 1 hour of work for every hour where at least a commit is present

_See hrs2csv.sh_


### hrs2csv.sh

Print commit messages and timestamps from one or more branches in CSV format.

```
./hrs2csv.sh [branch, ...]
```

If no branch given get commits from all branches. Output the following columns:

| column | description |
|--------|-------------|
| year   | year of commit  |
| month  | month of commit |
| day    | day of commit   |
| slot   | hour of the day |
| task   | commit message  |

_See timelog.sh_


### loc.sh

Print counters for lines of code in CSV format.

```
./loc.sh [branch]
```

Print line statics for commits inside a branch or the main (master) branch if none specified.

| column |
|--------|
| added  |
| deleted |
| add_cumulative |
| del_cumulative |
| cumulative |

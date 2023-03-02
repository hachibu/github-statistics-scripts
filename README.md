# GitHub Statistics Scripts

## Requirements
- [gh](https://github.com/cli/cli)
- [st](https://github.com/nferraz/st)

## Usage

```
$ gh auth login
```

### User Followers

```
$ ./src/user-followers.sh
N       min     q1      median  q3      max     sum     mean    stddev  stderr  variance
100     1       1       3       12.5    415     2236    22.36   59.3823 5.93823 3526.25

P75     12.5
P90     46
P95     132
P99     347.5
```

### User Total Contributions

```
$ ./src/user-total-contributions.sh
N       min     q1      median  q3      max     sum     mean    stddev  stderr  variance
100     0       0       0       9.5     4369    13810   138.1   522.336 52.2336 272834

P75     9.5
P90     297
P95     855
P99     3271.5
```

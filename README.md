# GitHub Statistics Scripts

## Requirements
- [gh](https://github.com/cli/cli)
- [jq](https://stedolan.github.io/jq)
- [st](https://github.com/nferraz/st)

## Usage

```
$ gh auth login
```

### User Followers

```
$ ./src/user-followers.sh
N       min     q1      median  q3      max     sum     mean    stddev  stderr  variance
30      1       95.5    563.5   1338.5  23360   79873   2662.43 5848.89 1067.86 3.42096e+07

P75     1338.5
P90     9152.5
P95     15835
P99     22473
```

### User Total Contributions

```
$ ./src/user-total-contributions.sh
N min     q1      median  q3      max     sum     mean    stddev  stderr  variance
27      0       1       35      461     1845    7046    260.963 424.644 81.7228 180323

P75     461
P90     741.5
P95     819
P99     1342.5
```

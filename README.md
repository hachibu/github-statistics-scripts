# GitHub Statistics Scripts

## Requirements
- [gh](https://github.com/cli/cli)
- [st](https://github.com/nferraz/st)
- [python](https://www.python.org/downloads)
- [bashplotlib](https://github.com/glamp/bashplotlib)

## Usage

```
$ gh auth login
```

### User Followers

```
$ ./src/user-followers.sh
```

```
N       min     q1      median  q3      max     sum     mean    stddev  stderr  variance
100     1       1       3       12.5    415     2236    22.36   59.3823 5.93823 3526.25

P50     3
P75     12.5
P90     46
P95     132
P99     347.5

 41|  o                                                 
 38|  o                                                 
 35|  o                                                 
 32|  o                                                 
 29|  o                                                 
 26| oo                                                 
 23| oo                                                 
 21| oo                                                 
 18| oo                                                 
 15| oo                                                 
 12| oo                                                 
  9| oo                                                 
  6| oooo                                               
  3| ooooo o                                            
  1| ooooooooo   o        o  o  o      o               o
    ---------------------------------------------------
```

### User Total Contributions

```
$ ./src/user-total-contributions.sh
```

```
N       min     q1      median  q3      max     sum     mean    stddev  stderr  variance
100     0       0       0       9.5     4369    13810   138.1   522.336 52.2336 272834

P50     0
P75     9.5
P90     297
P95     855
P99     3271.5

 63| o                                                  
 59| o                                                  
 54| o                                                  
 50| o                                                  
 45| o                                                  
 41| o                                                  
 36| o                                                  
 32| o                                                  
 27| o                                                  
 23| o                                                  
 18| o                                                  
 14| oo                                                 
  9| oo                                                 
  5| oo                                                 
  1| oooooo  o o oo           o                        o
    ---------------------------------------------------
```
